# make-site.R
#
# Updates and makes R bootcamp site
#

# render ioslides_presentation last because github_document makes HTML
rmarkdown::render("talks/r-eproducible-science.Rmd", 
                  output_format = c("github_document", 
                                    "pdf_document", 
                                    "word_document", 
                                    "ioslides_presentation"))

source("talks/update-survey.R")

rmarkdown::render("talks/R-Workshop-James.Rmd", 
                  output_format = c("github_document", 
                                    "pdf_document", 
                                    "word_document", 
                                    "ioslides_presentation"))

# Render site last so that updated versions get copied to docs/
rmarkdown::render_site()
