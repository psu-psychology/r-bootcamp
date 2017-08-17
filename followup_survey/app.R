library(shiny)
library(shinyforms)

## To recreate this example, you must download shinyforms using:
## devtools::install_github("fozy81/shinyforms", ref = 'input-type')

formInfo <- list(
  id = "basicinfo",
  questions = list(
    list(id = "date", type = "date", title = "Date"),
    list(id = "title", type = "text", title = "Title", mandatory = TRUE, value = "",
         placeholder = "e.g., Grad, Faculty, etc.", 
         hint = "What is your affiliation/title at Penn State?", width = 350),
    list(id = "age", type = "numeric", title = "Age", min = 0, max = 150, value = 0, step = 1,
         hint = "Age between: 0-150"),
    list(id = "area", type = "text", title = "Program Area",
         placeholder = 'e.g., Clinical, Developmental, etc.'),
    list(id = "days", type = "checkboxGroup", title = "Which Days Did you Attend?",
         choices = c("Day 1 (Wednesday)" = "day1", "Day 2 (Thursday)" = "day2"),inline = FALSE),
    list(id = "install_rate", type = "slider", title = "How would you rate the Introductory session on Day 1?",
         min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "office_rate", type = "slider", title = "How would you rate the Office Hours on Day 1?",
         min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "day1_rate", type = "slider", title = "Overall, how would you rate Day 1?", min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "tidy_rate", type = "slider", title = "How would you rate the Data Wrangling session on Day 2?",
         min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "vis_rate", type = "slider", title = "How would you rate the Data Visualization session on Day 2?",
         min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "func_rate", type = "slider",
         title = "How would you rate the Functional Programming session on Day 2?", min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "best_rate", type = "slider", title = "How would you rate the Best Practices session on Day 2?",
         min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "reproduce_rate", type = "slider",
         title = "How would you rate the Reproducibility session on Day 2?", min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "day2_rate", type = "slider", title = "Overall, how would you rate Day 2?", min = 1, max = 7,
         value = 1, ticks = TRUE, mandatory = FALSE),
    list(id = "other_topics", type = "textarea", title = "Would you have liked to see any other topics covered?",
         mandatory = FALSE, value = "",
         hint = "Please type response", width = 400),
    list(id = "other_feedback", type = "textarea", title = "Do you have any other feedback about the Bootcamp?",
         mandatory = FALSE, value = "",
         hint = "Please type response", width = 400),
    list(id = "class_int", type = "select",
         title = "Finally, would you be interested in taking a 'Introduction to R' Graduate Seminar Course?",
         choices = c("Yes" = "yes", "No" = "no"),
         multiple = FALSE, selectize = TRUE)
    ),
  storage = list(
    # Right now, only flat file storage is supported
    type = STORAGE_TYPES$FLATFILE,
    # The path where responses are stored
    path = "responses"
  ),
  multiple = FALSE,
  reset = FALSE
)

ui <- fluidPage(
  formUI(formInfo)
)

server <- function(input, output, session) {
  formServer(formInfo)
}

shinyApp(ui = ui, server = server)