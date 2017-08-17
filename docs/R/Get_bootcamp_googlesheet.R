# Get_bootcamp_googlesheet.R
# 
# Script to authenticate to Google, extract R bootcamp survey data

library(googlesheets)
library(tidyverse)
source("R/Clean_survey_data.R")

survey_url <- "https://docs.google.com/spreadsheets/d/1Ay56u6g4jyEEdlmV2NHxTLBlcjI2gHavta-Ik0kGrpg/edit?usp=sharing"

bootcamp_by_url <- survey_url %>%
  extract_key_from_url() %>%
  gs_key()

bootcamp_sheets <- gs_ws_ls(bootcamp_by_url)

boot_data <- bootcamp_by_url %>%
  gs_read(bootcamp_sheets[1])
          
#boot_data_clean <- Clean_survey_data(boot_data)
#write_csv(boot_data_clean, path = "data/survey.csv")
write_csv(boot_data, path="data/survey.csv")