demo_code <- c(
  "#' ---",
  "#' title: \"R scripts can be rendered!\"",
  "#' author: \"Jenny Bryan\"",
  "#' date: \"`r format(Sys.Date())`\"",
  "#' output: github_document",
  "#' ---",
  "#'"
)
writeLines(demo_code, "render-r-script-demo.R")