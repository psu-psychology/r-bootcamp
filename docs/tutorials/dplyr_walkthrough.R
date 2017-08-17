##Basics of data manipulation in dplyr
library(foreign); library(dplyr); library(readr)
data(iris)
head(iris)
str(iris)

##Core verbs

#1) Filter: subsetting or removing observations based on logical criteria
iris %>% filter(Sepal.Length > 7)
iris %>% filter(Petal.Width < 2 & Sepal.Length > 7)

#Although the above commands will simply print output to the screen, remember that
#the result of any manipulation operation can be assigned to a new dataset (e.g., if you want
#to zoom in on some fraction of the data for verification).

vonly <- iris %>% filter(Species == "virginica")

#2) Select: obtain a group of columns (variables) based on some criteria
data(mtcars)
names(mtcars) #all variable names
datasetmpg = mtcars %>% select(mpg, cyl, disp)

mtcars %>% filter(mpg > 20) %>% select(mpg, cyl, disp)

#updating
mtcars_nompgcyl <- mtcars %>% select(-mpg, -cyl)


#some random data for select demo
rdata <- data.frame(matrix(rnorm(10000), nrow=100, ncol=100))
names(rdata) <- paste0(letters[1:20], 1:100, "_", 1:5)

#variable prefix of a
rdata %>% select(starts_with("a")) %>% head

#variable suffix of _1
rdata %>% select(ends_with("_1")) %>% head

#contains 3 anywhere in name
rdata %>% select(contains("3")) %>% names

#2 or 6 followed by 9_
rdata %>% select(matches("[26]9_")) %>% names

#starts with b and ends with 2
rdata %>% select(matches("^b.*2")) %>% head

#starts with b and ends with 2
rdata %>% select(matches("^b.*2")) %>% head

#conceptually related to %in%
rdata %>% select(one_of(c("b62_2", "a1_1"))) %>% head

#equivalent to this simple syntax, but above allows the vector of variables to be built
#up programmatically (in another function, loop, etc.)
rdata %>% select(b62_2, a1_1) %>% head

#select variables in a range (based on variable/column order)
rdata %>% select(a1_1:f6_1) %>% head

#inverse: grab everything but those columns
rdata %>% select(-a1_1:-f6_1) %>% head

####
#mutate: add a variable that is a function of other variables

#add all "r" variables together to create a variable called sumsr (added to data.frame)
rdata <- rdata %>% mutate(sumsr = r18_3 + r38_3 + r58_3 + r78_3 + r98_3)

rdata %>% select(r18_3, r38_3, r58_3, r78_3, r98_3, sumsr) %>% head

data(mtcars)

#create ratio of horsepower to displacement, keep weight and cylinders, drop everything else
#anything not named in the transmute is dropped
mtcars_revised = mtcars %>% transmute(hp_disp = hp/disp, wt=wt, cyl=cyl)

#compare: just add the ratio, but keep everything else intact
mtcars = mtcars %>% mutate(hp_disp = hp/disp)

#use mutate to drop/delete a variable (note that we could just as easily use select to subtract out a variable.)
mtcars = mtcars %>% mutate(hp_disp = NULL)

#add weight ranks (low to high) and percentiles
mtcars = mtcars %>% mutate(wtrank = row_number(wt), wtpct=percent_rank(wt))

#look at extreme percentiles for weight (e.g., if you anticipate outliers)
mtcars %>% filter(wtpct > .95 | wtpct < .05) %>% arrange(wtpct)

#alternative to look at top observations
mtcars %>% top_n(2, wt)

###
#summarize data: summary functions receive a vector as input and return a
#single value (summary) as output

#first value of mpg and cyl (not especially useful)
mtcars %>% summarise(mpg=first(mpg), cyl=first(cyl))

#means of all columns
mtcars %>% summarise_all(mean, na.rm=TRUE)

#means of select columns (between the spell-it-out version and the all version)
#note that the vars function has the same syntax as select (e.g., matches, starts_with, etc.)
#can pass additional arguments to function
mtcars %>% summarise_at(vars(one_of(c("hp", "drat", "carb"))), mean, na.rm=TRUE, trim=0.1)

#median of first and second columns
mtcars %>% summarise_at(1:2, median)

#multiple summary functions
mtcars %>% summarise_all(funs(q3=quantile(., .75), q1=quantile(., .25)))

mtcars %>% summarize(q3wt = quantile(wt, .75), q1wt = quantile(wt, .25))

#summaries become more useful when you think about grouping (means within groups, etc.)

#look at means by number of cylinders
mtcars %>% group_by(cyl) %>% summarize_all(mean) # summarise_if(is.numeric, mean)

###
#arrange: change the order observations

#compute the mean of all columns for each cylinder level (4,6,8) and sort by mpg ascending
mtcars %>% group_by(cyl) %>% summarise_if(is.numeric, mean) %>% arrange(mpg)

###
#rename variables (new -> old mapping)
mtcars <- rename(mtcars, displacement=disp, weight=wt)

###
#windowing functions
if (!require("ez")) install.packages("ez")
library(ez)
data(ANT)

str(ANT)

#RTs > 800ms
ANT %>% filter(rt > 800)
ANT %>% filter(rt < 200) #plausible?

#running minimum by subject

ANT %>% group_by(subnum) %>% mutate(rminrt = cummin(rt), rmaxrt = cummax(rt))

#try out: aggregate by subject
ANT %>% group_by(subnum) %>% summarize(maxrt=max(rt), minrt=min(rt), q3=quantile(rt, .75), q1=quantile(rt, .25))

#what about

###
#but what if I don't know which variables start with r?
#this is more complicated and can be achieved in a couple of ways

#alternative: compute the sum within the subset, use transmute to drop columns used,
#retaining only the sum, then cbind the result back together with the original data
rdata = rdata %>% select(starts_with("r")) %>% transmute(sumsr3=rowSums(.)) %>% bind_cols(rdata)

#add a column sumsr2 to the dataset (on the left-hand side)
#use the do operator to run the rowSums function on the selected data
rdata$sumsr2 = rdata %>% select(starts_with("r")) %>% do(data.frame(rsums=rowSums(.))) %>% unlist

#alternative: use full do function for maximum flexibility (and clarity)
#note the use of the {} to create a code expression across lines
rdata = rdata %>% do({
  rvars = select(., starts_with("r"))
  .$sumsr4 = rowSums(rvars)
  return(.)
})

all.equal(rdata$sumsr, rdata$sumsr2)
all.equal(rdata$sumsr, rdata$sumsr3)
all.equal(rdata$sumsr, rdata$sumsr4)


##joins
superheroes <-"
    name, alignment, gender,         publisher
Magneto,       bad,   male,            Marvel
Storm,      good, female,            Marvel
Mystique,       bad, female,            Marvel
Batman,      good,   male,                DC
Joker,       bad,   male,                DC
Catwoman,       bad, female,                DC
Hellboy,      good,   male, Dark Horse Comics
"
superheroes <- read_csv(superheroes, trim_ws = TRUE, skip = 1)

publishers <- "
publisher, yr_founded
DC,       1934
Marvel,       1939
Image,       1992
"
publishers <- read_csv(publishers, trim_ws = TRUE, skip = 1)

#merging datasets
#left join
#right join



##multilevel example
##between-person and within-person centering
library(foreign); library(dplyr)
popdata<-read.dta("http://www.ats.ucla.edu/stat/stata/examples/mlm_ma_hox/popular.dta")

#DV is popular
#school is clustering
table(popdata$school)

#texp is teacher experience (L2 - school varying)
#teachpop appears to be L1 varying

#within cluster centering and add cluster means
#need to add ungroup to unflag the data frame as a grouped structure
#summarize would do this for you (since a level of aggregation occurs)
popdata_update <- popdata %>% group_by(school) %>% mutate(teachpop_wicent=teachpop - mean(teachpop, na.rm=TRUE),
                                                   teachpop_wim=mean(teachpop)) %>% ungroup

#between centering
popdata_update <- popdata_update %>% mutate(teachpop_bwcent = teachpop - mean(teachpop), teachpop_bwm=mean(teachpop))

#between summaries (mean by teacher popularity)
popagg <- popdata %>% group_by(school) %>% summarize(mteachpop=mean(teachpop))

#between summaries (mean by teacher popularity and sex)
popagg <- popdata %>% group_by(school, sex) %>% summarize(mteachpop=mean(teachpop))
