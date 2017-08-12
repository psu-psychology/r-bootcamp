bootcamp-survey
================
Rick Gilmore
2017-08-12 07:45:18

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
# survey <- read_csv("../data/survey.csv")
survey <- read_csv("../data/survey-test.csv")
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_integer(),
    ##   Timestamp = col_datetime(format = ""),
    ##   R_exp = col_character(),
    ##   GoT = col_integer(),
    ##   Age_yrs = col_integer(),
    ##   Sleep_hrs = col_double(),
    ##   Fav_date = col_date(format = ""),
    ##   Tidy_data = col_character()
    ## )

``` r
survey
```

    ## # A tibble: 50 × 8
    ##       X1           Timestamp   R_exp   GoT Age_yrs Sleep_hrs   Fav_date
    ##    <int>              <dttm>   <chr> <int>   <int>     <dbl>     <date>
    ## 1      1 2017-08-12 07:30:39 limited     1      53  7.348351 2017-08-12
    ## 2      2 2017-08-12 07:30:39    lots     2      52  7.619878 2017-08-12
    ## 3      3 2017-08-12 07:30:39    none     6      33  8.411470 2017-08-12
    ## 4      4 2017-08-12 07:30:39     pro     2      54  8.231536 2017-08-12
    ## 5      5 2017-08-12 07:30:39     pro     5      38  8.179473 2017-08-12
    ## 6      6 2017-08-12 07:30:39    none     3      45  8.368195 2017-08-12
    ## 7      7 2017-08-12 07:30:39    lots     3      39  9.608013 2017-08-12
    ## 8      8 2017-08-12 07:30:39    some     5      37  7.876698 2017-08-12
    ## 9      9 2017-08-12 07:30:39    none     7      28  7.506042 2017-08-12
    ## 10    10 2017-08-12 07:30:39    none     5      40  7.368981 2017-08-12
    ## # ... with 40 more rows, and 1 more variables: Tidy_data <chr>

Notice that the `get-bootcamp-googlesheet.R` script changed the names of the variables a bit. We may also want to modify the levels of the `R_exp` variable to make it an ordered factor.

``` r
(survey_responses <- unique(survey$R_exp))
```

    ## [1] "limited" "lots"    "none"    "pro"     "some"

This shows us the different survey response values.

``` r
survey$R_exp <- ordered(survey$R_exp, levels=c("none",
                                               "limited",
                                               "some",
                                               "lots",
                                               "pro"))
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

![](bootcamp-survey_files/figure-markdown_github-ascii_identifiers/got-vs-r-exp-1.png)
