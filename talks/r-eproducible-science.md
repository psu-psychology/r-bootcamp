R-eproducible-science
================
Rick Gilmore
2017-08-11 12:34:53

-   [R-eproducible psychological science](#r-eproducible-psychological-science)
-   [Themes](#themes)
-   [Is there a crisis?](#is-there-a-crisis)
-   [Not just in psychology](#not-just-in-psychology)
-   [If so, why?](#if-so-why)
-   [What am I trying to reproduce?](#what-am-i-trying-to-reproduce)
-   [Reproducible workflows](#reproducible-workflows)
-   [Using R for reproducible workflows](#using-r-for-reproducible-workflows)
-   [Example 1](#example-1)
-   [How to](#how-to)
-   [How to](#how-to-1)
-   [Let's try it](#lets-try-it)
-   [Key points](#key-points)
-   [Advanced topics](#advanced-topics)

R-eproducible psychological science
-----------------------------------

Themes
------

1.  What is reproducible psychological science?
2.  How can R make my science more transparent, open, and reproducible?

Is there a crisis?
------------------

<a href="http://www.nature.com/polopoly_fs/7.36716.1469695923!/image/reproducibility-graphic-online1.jpeg_gen/derivatives/landscape_630/reproducibility-graphic-online1.jpeg" height=450px> <img src="http://www.nature.com/polopoly_fs/7.36716.1469695923!/image/reproducibility-graphic-online1.jpeg_gen/derivatives/landscape_630/reproducibility-graphic-online1.jpeg" height=500px> </a>

[Baker 2016](http://doi.org/10.1038/533452a)

Not just in psychology
----------------------

<div class="centered">
<a href="http://www.nature.com/polopoly_fs/7.36718.1464174471!/image/reproducibility-graphic-online3.jpg_gen/derivatives/landscape_630/reproducibility-graphic-online3.jpg"> <img src="http://www.nature.com/polopoly_fs/7.36718.1464174471!/image/reproducibility-graphic-online3.jpg_gen/derivatives/landscape_630/reproducibility-graphic-online3.jpg"" height=500px> </a>

If so, why?
-----------

<a href="http://www.nature.com/polopoly_fs/7.36719.1464174488!/image/reproducibility-graphic-online4.jpg_gen/derivatives/landscape_630/reproducibility-graphic-online4.jpg"> <img src="http://www.nature.com/polopoly_fs/7.36719.1464174488!/image/reproducibility-graphic-online4.jpg_gen/derivatives/landscape_630/reproducibility-graphic-online4.jpg" height=500px> </a>

[Baker 2016](http://doi.org/10.1038/533452a)

Here are the data from the Nature survey.

What am I trying to reproduce?
------------------------------

-   My own workflow
    -   Data collection
    -   Cleaning
    -   Visualization
    -   Analysis
-   "Hit by a truck" scenario

Reproducible workflows
----------------------

-   Scripted, automated = minimize human-dependent steps.
-   Well-documented
-   Transparent to me & colleagues == transparent to others

Using R for reproducible workflows
----------------------------------

-   Mix R code, output, comments, tables using R Markdown
-   R Markdown files = text files
-   One input file, multiple outputs to
    -   PDF, Word (.docx)
    -   HTML for web pages, slides

Example 1
---------

-   James' R commands from Day 1
-   [Raw R script (.R)](R-Workshop-James.R)
-   Converted to [R Markdown](R-Workshop-James.R.Rmd)
-   Output as | [HTML Slides](R-Workshop-James.html) | [PDF](R-Workshop-James.pdf) | [DOCX](R-Workshop-James.docx) |

How to
------

-   Add header info in [YAML Ain't Markup Language (YAML) format](http://www.yaml.org/start.html)
-   Wrap R code "chunks" with triple backticks and {r}
-   Separate segments with `---` and/or `##` or `###`
-   Render via `knit` button or \`rmarkdown::render(file="my-file.Rmd")

How to
------

-   Create new R Markdown file: `New/New File/R Markdown...`
-   Specify default, alternative output formats:
    -   `pdf_document`
    -   `word_document`
    -   `ioslides_document`: HTML slides
    -   `github_document`: renders nicely on GitHub

------------------------------------------------------------------------

-   Create your document
    -   Use an "outline" with Header\_1, Header\_2, Header\_3, etc.
    -   Header\_1 text starts with `# This is a top level header`
    -   Header\_2 text starts with `## This is a 2nd level header`
    -   Header\_3 text starts with `### This is a 3rd level header`
-   Surround R code with triple back-ticks
-   Sections that start with Header\_1, Header\_2, and `---` will start new slides in `ioslides_presentation` mode.
-   **Bold text**: `**This is bold**`; *Italicized text*: `*Italics*`
-   Start lists with hyphens `- Item 1` or numbers `1. Item 1`.

Let's try it
------------

-   [bootcamp-survey.Rmd](bootcamp-survey.Rmd)
-   [bootcamp-survey.md](bootcamp-survey.md)

Key points
----------

-   Use R Markdown files for documents, reports, presentations.
    -   One or more output formats from the same file.
    -   Analysis/lab notebook.
-   Use R scripts to automate different pieces of the pipeline.
-   Make README files to explain how to put pieces together.

Advanced topics
---------------

-   Version control with git and GitHub
-   Websites, blogs, (even books) with R Markdown
-   Reference lists
-   Scriptable analysis workflows
    -   Reports for each participant
    -   Example: [PEEP-II project](https://github.com/gilmore-lab/peep-II-ratings-analysis)
