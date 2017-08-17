library(foreign)
library(tidyverse)
setwd("/Users/michael/Data_Analysis/r-bootcamp") #change this to where the bootcamp files live on your computer

#worker function for replacing numeric missing values with NA
recodeMissing <- function(vec, targetvals=c(99, 999)) {
  vec[vec %in% targetvals] <- NA
  return(vec)
}

#Conflict tactics scale raw data
cts <- read.spss("data/CTS.sav", to.data.frame=TRUE)

#recode CTS to represent counts (uneven anchor spacing)
#DEFINITIONS:  v=victim, p=perpetrator, m=minor, s=severe
cts <- cts %>% 
  mutate_at(vars(CTS1:CTS40), funs(recode(. , `0`=0, `1`=1, `2`=2, `3`=4, `4`=8, `5`=15, `6`=25, `7`=98))) %>%
  rename(DyadID=dyadID) %>% #capitalize D for match
  mutate(
    CTS_PsychAggV = CTS1 + CTS11 + CTS15 + CTS19 + CTS27 + CTS33 + CTS35 + CTS37,
    CTS_PsychAggP = CTS2 + CTS12 + CTS16 + CTS20 + CTS28 + CTS34 + CTS36 + CTS38,
    CTS_PhysAssV = CTS3 + CTS5 + CTS7 + CTS9 + CTS13 + CTS17 + CTS21 + CTS23 + CTS25 + CTS29 + CTS31 + CTS39,
    CTS_PhysAssP = CTS4 + CTS6 + CTS8 + CTS10 + CTS14 + CTS18 + CTS22 + CTS24 + CTS26 + CTS30 + CTS32 + CTS40,
    CTS_PsychAggVM = CTS1 + CTS19 + CTS27 + CTS35,
    CTS_PsychAggPM = CTS2 + CTS20 + CTS28 + CTS36,
    CTS_PsychAggVS = CTS11 + CTS15 + CTS33 + CTS37,
    CTS_PsychAggPS = CTS12 + CTS16 + CTS34 + CTS38,
    CTS_PhysAssVM = CTS3 + CTS5 + CTS7 + CTS25 + CTS29,
    CTS_PhysAssPM = CTS4 + CTS6 + CTS8 + CTS26 + CTS30,
    CTS_PhysAssVS = CTS9 + CTS13 + CTS17 + CTS21 + CTS23 + CTS31 + CTS39,
    CTS_PhysAssPS = CTS10 + CTS14 + CTS18 + CTS22 + CTS24 + CTS32 + CTS40,
    CTS_Victim = CTS_PsychAggV + CTS_PhysAssV,
    CTS_Perp = CTS_PsychAggP + CTS_PhysAssP
  )

#make sure that we are using only baseline data (mth==0) and drop the items themselves
cts <- cts %>% filter(mth==0 & PTNUM >= 8000) %>% select(-one_of(c("ADate", "RecNum", "mth", paste0("CTS", 1:40))))

#dyadic adjustment scale (32 items)
das <- read.spss("data/DAS.sav", to.data.frame=TRUE) %>%
  mutate_at(vars(one_of(paste0("DAS", 1:32))), funs(recodeMissing))

#Items for 6 - x reverse coding
reverseItems <- paste("DAS", c(1:15, 18, 19, 32), sep="") 

#Base R version
#das[,reverseItems] <- lapply(das[,reverseItems], function(x) { 6 - x }) #reverse score and subtract 1 (becomes 0-5)

#dplyr version
#das <- das %>% mutate_at(vars(one_of(reverseItems)), funs((function(x) { 6 - x })(.))) #using anonymous function

rev6 <- function(x) { 6 - x }
das <- das %>% mutate_at(vars(one_of(reverseItems)), funs(rev6))

reverseItems <- paste("DAS", c(23, 24), sep="") 
das[,reverseItems] <- lapply(das[,reverseItems], function(x) { 5 - x }) #reverse score and subtract 1 (becomes 0-4)

subtractItems <- paste("DAS", c(16, 17, 20:22, 25:28, 31), sep="")
das$DAS20[das$DAS20 == 7] <- NA #a '7' in the original coding indicates they are not married/live together 
das[,subtractItems] <- lapply(das[,subtractItems], function(x) { x - 1 })

flipItems <- paste("DAS", c(29, 30), sep="")
das[,flipItems] <- lapply(das[,flipItems], function(x) { ifelse(x==1, 0, 1) })

#if DASrelationship is 0, then the person is not in a relationship with their partner (or at least the one at enrollment)
#Thus, invalidate any DAS data up front to prevent accidental use
das <- das %>% mutate_at(vars(one_of(paste0("DAS", 1:32))), funs(ifelse(DASrelationship==0, NA, .)))

das <- das %>% mutate(
  DAS_Con=DAS1 + DAS2 + DAS3 + DAS5 + DAS7 + DAS8 + DAS9 + DAS10 + DAS11 + DAS12 + DAS13 + DAS14 + DAS15, #consensus
  DAS_Sat=DAS16 + DAS17 + DAS18 + DAS19 + DAS20 + DAS21 + DAS22 + DAS23 + DAS31 + DAS32, #satisfaction
  DAS_Coh=DAS24 + DAS25 + DAS26 + DAS27 + DAS28, #cohesion
  DAS_AffExp=DAS4 + DAS6 + DAS29 + DAS30, #affectional expression
  DASTotal=DAS_Con + DAS_Sat + DAS_Coh + DAS_AffExp #total score (sum of subscales)
)

#drop items
das <- das %>% filter(mth==0 & PTNUM >= 8000) %>% select(-one_of(c("ADate", "RecNum", "mth", paste0("DAS", 1:32))))

##clinical interview
sidp <- read.spss("data/SIDP.sav", to.data.frame=TRUE)

#szoid5 and sztypl8 are stored in same column (assuming it's an identical criterion)
#but this blows up the logic of the auto scoring below
sidp <- sidp %>% rename(szoid5=szoid5stypl8) %>% mutate(stypl8=szoid5, UsrID=as.numeric(paste0(PTNUM, DyadID))) %>% 
  select(-initials, -sectionQpatient, -sectionQinterviewer)

sidp <- filter(sidp, mth==0 & raterID==0 & ratercode==6) #raterID 0 is case conference; ratercode 6 is case conference; mth 0 is intake
score_pd <- function(df, prefix, dropitems=TRUE) {
  require(dplyr)
  for (p in prefix) {
    tosum <- df %>% select(matches(paste0(p, "\\d+")))
    df[[paste0(p, "_sidp")]] <- apply(tosum, 1, function(r) { sum(r)})
    if (dropitems) { df <- df %>% select(-matches(paste0(p, "\\d+"))) }
  }
  return(df)
}

#compute sums of all item sets
sidp <- score_pd(sidp, c("antso", "avoid", "bordl", "depen", "deprs", "histr", 
                         "narci", "negtv", "obcmp", "parnd", "stypl", "szoid"))

#drop unnecessary items
sidp <- sidp %>% filter(mth==0 & PTNUM >= 8000) %>% select(PTNUM, DyadID, UsrID, ends_with("_sidp"))

#merge all datasets together on three matching variables
couples_baseline_clin = Reduce(function(...) { full_join(..., by=c("UsrID", "PTNUM", "DyadID")) },
                               list(cts, das, sidp))

#list of rule-out and break-up IDs from clinical review
ro_ids <- c(8002, 8012, 8021, 8025, 8037, 8054, 8068, 8076, 8077, 8079, 8089, 8090, 8040, 8047, 8048, 8097, 8119, 8125)
message("Removing rule-out/incomplete IDs: ", paste(ro_ids, collapse=", "))
couples_baseline_clin <- filter(couples_baseline_clin, !PTNUM %in% ro_ids)

#cache file with calculated scores. use date for clarity
write.csv(x=couples_baseline_clin, file=paste0("data/couples_baseline_", format(Sys.Date(), "%d%b%Y"), ".csv"), row.names=FALSE)