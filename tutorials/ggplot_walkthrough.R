#title: "Simple ggplot2 walkthrough with bootcamp survey data"
#authors: "Rick Gilmore and Michael Hallquist"

library(tidyverse)
library(googlesheets)

setwd("/Users/michael/Data_Analysis/r-bootcamp") #set this to the location on your computer

#read the cached survey responses
survey <- read_csv("data/survey.csv")
str(survey)

# complete.cases() drops NAs
survey <- survey[complete.cases(survey),]
survey

# Now, lets make sure we have numbers where we expect them.
survey$Age_yrs <- readr::parse_number(survey$Age_yrs)
survey$Sleep_hrs <- readr::parse_number(survey$Sleep_hrs)
survey

#frequency table of expertise
table(survey$R_exp)

#store experience as ordered variable
survey$R_exp <- ordered(survey$R_exp, levels=c("none", "limited", "some", "lots", "pro"))

#basic visualization

R_exp_hist <- survey %>%
  ggplot() +
  aes(x=R_exp) +
  geom_bar() # R_exp is discrete
R_exp_hist

Sleep_hrs_hist <- survey %>%
  ggplot() +
  aes(x=Sleep_hrs) +
  geom_histogram(bins=8) # Sleep_hrs is continuous
Sleep_hrs_hist

#game of thrones preference
Got_hist <- survey %>%
  ggplot() +
  aes(x=GoT) +
  geom_histogram(bins=10)
Got_hist

#Looks like we are of two minds about GoT!
#https://static.independent.co.uk/s3fs-public/styles/article_small/public/thumbnails/image/2017/03/17/08/thrones-dragon.jpg

GoT_vs_r_exp <- survey %>%
  ggplot() +
  aes(x=GoT, y=Age_yrs) +
  facet_grid(. ~ R_exp) +
  geom_point()
GoT_vs_r_exp

#improving aesthetic details of the plot
GoT_vs_r_exp + labs(title="Game of Thrones rating by age and R experience", 
                    x="Game of Thrones enthusiasm (1-10)", y="Age (years)") +
  theme_bw(base_size=15) #B&W theme
  
#how about outputting this to a file?
ggsave(filename="GoT by age and R expertise.pdf", width=12, height=10)

#do people who are older sleep less in our workshop?
gg <- ggplot(survey, aes(x=Age_yrs, y=Sleep_hrs)) +
  stat_smooth(method="lm", se=FALSE, color="black") +
  stat_smooth(method="loess", color="blue") +
  theme_bw(base_size=15)
plot(gg + geom_point())

#some evidence of overplotting problems. try jittering for clarity
plot(gg + geom_jitter())

