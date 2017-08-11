# update-survey.R
#
# Updates Googlesheet survey data and generates new R Markdown report
#

source("R/get-bootcamp-googlesheet.R")
rmarkdown::render("talks/bootcamp-survey.Rmd", 
                  output_format = c("github_document",
                                    "pdf_document",
                                    "word_document",
                                    "ioslides_presentation"))