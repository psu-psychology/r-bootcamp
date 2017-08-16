# r-bootcamp
An introduction to R for grad students, postdocs, and others presented by the Penn State Psychology Department. To view the site associated with this repo, visit <http://psu-psychology.github.io/r-bootcamp/>

## Components

- `.Rmd` and `.html`: components used to build static site.
- `docs/`: folder GitHub pages uses to serve site.
- `data/`: folder with some generated data files.
- `talks/`: folder with files related to presenter talks.
- `papaja_demo/`: folder with files related to a very brief demo of the `papaja` package that allows APA-formatted manuscripts to be generated from RMarkdown.

## Instructions

1. Clone or copy the site locally.
2. From the site root directory, run `rmarkdown::render_site()` from your R or RStudio console to generate the HTML, CSS, and JS files. The site resides in `docs/` and may be viewed in any browser.
3. Or, to regenerate all the files anew, run `source("R/make-site.R")` from the R or RStudio console in the project root directory.

## Known issues

1. ~~`*.R` build scripts should run from `R/` directory in root.~~. Fixed 2017-08-11-15:27.
