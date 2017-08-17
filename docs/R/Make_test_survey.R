# Make_test_survey.R
# Timestamp,R_exp,GoT,Age_yrs,Sleep_hrs,Fav_day,Tidy_data
#8/11/2017 10:13:58,I should be teaching this course,9,54,8,1/17/2018,Yes

n_subs = 50

# Duplicate Timestamps
now <- Sys.time()
Timestamp <- rep(now, n_subs)

# Age_yrs uniform on [22,55] rounded to nearest integer
Age_yrs <- round(runif(n_subs, min = 22, max = 55), 0)

# Sleep_hrs normal on 8 with SD = 1?
Sleep_hrs <- rnorm(n_subs, mean = 8, sd = 1)

# R_exp equally distributed across 5 categories
exp_levels <- c("none", "limited", "some", "lots", "pro")
R_exp <- rep(exp_levels, n_subs)
R_exp <- R_exp[sample(1:n_subs, replace = FALSE)]

# GoT enthusiasm lower in older, higher in lower sleep
beta_age <- -.2
beta_sleep <- -.5
mean_got <- 5
got_no_intercept <- rep(mean_got, n_subs) + beta_age*Age_yrs + beta_sleep*Sleep_hrs
got_intercept <- 1-min(got_no_intercept)

GoT <- round(got_intercept + got_no_intercept + rnorm(n_subs, 0, .5), 0)

# Tidy_data random
Tidy_data <- rep(c("Yes", "No"), n_subs)
Tidy_data <- Tidy_data[sample(1:50, replace = FALSE)]

# Fav_date
Fav_date <- rep(Sys.Date(), n_subs)

survey <- data.frame(Timestamp, R_exp, GoT, Age_yrs, 
                     Sleep_hrs, Fav_date, Tidy_data)
write.csv(survey, "data/survey-test.csv")