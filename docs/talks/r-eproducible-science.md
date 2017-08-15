R-eproducible-science
================
Rick Gilmore
2017-08-15 09:27:13

-   [R-eproducible psychological science](#r-eproducible-psychological-science)
-   [Themes](#themes)
-   [Is there a crisis?](#is-there-a-crisis)
-   [Not just in psychology](#not-just-in-psychology)
-   [If so, why?](#if-so-why)
-   [[(Munafò et al. 2017)](http://doi.org/10.1038/s41562-016-0021) manifesto](#munafo2017-dc-manifesto)
-   [What am I trying to reproduce?](#what-am-i-trying-to-reproduce)
-   [Reproducible workflows](#reproducible-workflows)
-   [Using R for reproducible workflows](#using-r-for-reproducible-workflows)
-   [Example 1](#example-1)
-   [How to](#how-to)
-   [How to](#how-to-1)
-   [Let's try it](#lets-try-it)
-   [Key points](#key-points)
-   [Toward a reproducible psychological science...](#toward-a-reproducible-psychological-science...)
-   [Advanced topics](#advanced-topics)
-   [My GitHub workflow](#my-github-workflow)
-   [Learn from my mistakes](#learn-from-my-mistakes)
-   [References](#references)

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

[(Munafò et al. 2017)](http://doi.org/10.1038/s41562-016-0021) manifesto
------------------------------------------------------------------------

<a href="http://www.nature.com/articles/s41562-016-0021/figures/1"> <img src="http://www.nature.com/article-assets/npg/nathumbehav/2017/s41562-016-0021/images_hires/w926/s41562-016-0021-f1.jpg" height=500px> </a>

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
-   Output as | [HTML notebook](R-Workshop-James.nb.html) | [HTML Slides](R-Workshop-James.html) | [PDF](R-Workshop-James.pdf) | [DOCX](R-Workshop-James.docx) |

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

Toward a reproducible psychological science...
----------------------------------------------

-   Transparent, reproducible, open workflows pre-publication
-   Openly shared materials + data + code
-   [(Munafò et al. 2017)](http://doi.org/10.1038/s41562-016-0021)
-   [(Gilmore and Adolph 2017)](http://dx.doi.org/10.1038/s41562-017-0128)

Advanced topics
---------------

-   Write papers in R Markdown using [`papaja`](https://github.com/crsh/papaja)
-   Use R Studio [projects](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)
-   Version control with git and [GitHub](http://github.com)
-   [Web sites](http://rmarkdown.rstudio.com/rmarkdown_websites.html), [blogs](https://bookdown.org/yihui/blogdown/), (even [books](https://bookdown.org/)) with R Markdown
-   Scriptable analysis workflows
    -   Reports for each participant
    -   Example: [PEEP-II project](https://github.com/gilmore-lab/peep-II-ratings-analysis)

My GitHub workflow
------------------

1.  Create a repo on GitHub
2.  Copy repo URL
3.  `File/New Project.../`
4.  Version Control, Git
5.  Paste repo URL
6.  Select local name for repo and directory where it lives.
7.  Open project within R Studio `File/Open Project...`
8.  Commit early & often

Learn from my mistakes
----------------------

-   Script **everything** you possibly can
    -   If you have to repeat something, make a function or write a parameterized script
-   Document **all the time**
    -   Comments in code
    -   Update README files
-   Don't be afraid to ask
-   Don't be afraid to work in the open
-   Learn from others
-   Just do it!

References
----------

Gilmore, Rick O, and Karen E Adolph. 2017. “Video Can Make Behavioural Science More Reproducible.” *Nature Human Behavior* 1 (12~jun). doi:[10.1038/s41562-017-0128](https://doi.org/10.1038/s41562-017-0128).

Munafò, Marcus R, Brian A Nosek, Dorothy V M Bishop, Katherine S Button, Christopher D Chambers, Nathalie Percie du Sert, Uri Simonsohn, Eric-Jan Wagenmakers, Jennifer J Ware, and John P A Ioannidis. 2017. “A Manifesto for Reproducible Science.” *Nature Human Behaviour* 1 (10~jan): 0021. doi:[10.1038/s41562-016-0021](https://doi.org/10.1038/s41562-016-0021).
