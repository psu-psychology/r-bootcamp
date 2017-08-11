bootcamp-survey
================
Rick Gilmore
2017-08-11 12:35:01

-   [Goals](#goals)
-   [Preliminaries](#preliminaries)
-   [Load data and examine](#load-data-and-examine)
-   [Visualization and analysis](#visualization-and-analysis)

Goals
-----

-   Download and clean data from 2017 R Bootcamp Survey
-   Visualize data
-   Prepare reports in `ioslides_presentation`, `pdf_document`, and `word_document` formats

Preliminaries
-------------

Load required packages.

``` r
library(tidyverse)
library(googlesheets)
```

Load data and examine
---------------------

The survey data are stored in a [Google Sheet](https://docs.google.com/spreadsheets/d/1Ay56u6g4jyEEdlmV2NHxTLBlcjI2gHavta-Ik0kGrpg/edit#gid=896447063). We'll use the `googlesheets` package to open it and create a data frame. Documentation about the package can be found [here](https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html).

There are some idiosyncrasies in using the `googlesheets` package in an R Markdown document, so I created a separate R script, `get-bootcamp-googlesheet.R` to extract the survey data and save it to a CSV under `data/survey.csv`. We can then just load this file.

------------------------------------------------------------------------

``` r
survey <- read_csv("../data/survey.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   Timestamp = col_character(),
    ##   R_exp = col_character(),
    ##   GoT = col_integer(),
    ##   Age_yrs = col_integer(),
    ##   Sleep_hrs = col_integer(),
    ##   Fav_date = col_character(),
    ##   Tidy_data = col_character()
    ## )

``` r
survey
```

    ## # A tibble: 1 × 7
    ##            Timestamp                            R_exp   GoT Age_yrs
    ##                <chr>                            <chr> <int>   <int>
    ## 1 8/11/2017 10:13:58 I should be teaching this course     9      54
    ## # ... with 3 more variables: Sleep_hrs <int>, Fav_date <chr>,
    ## #   Tidy_data <chr>

Notice that the `get-bootcamp-googlesheet.R` script changed the names of the variables a bit. We may also want to modify the levels of the `R_exp` variable to make it an ordered factor.

``` r
survey$R_exp <- ordered(survey$R_exp, levels=c("No experience",
                                               "Limited experience",
                                               "Extensive",
                                               "I should be teaching this course"))
```

Visualization and analysis
--------------------------

Now, we can ask important questions.

``` r
got_vs_r_exp <- survey %>%
  ggplot() +
  aes(x=GoT, y=Age_yrs) +
  facet_grid(. ~ R_exp) +
  geom_point()
got_vs_r_exp
```

![](bootcamp-survey_files/figure-markdown_github/got-vs-r-exp-1.png)
