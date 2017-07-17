# Topics

1. installation of R and its packages, loading and using libraries, accessing the help system
2. data import/export
3. data types in R: lists, data.frames, vectors, matrices
4. very simple examples of statistics in R to get folks used to the output format and the idea that everything is an object of some sort (i.e., output is data)
5. Programming basics in R (taught in dplyr where possible):
    - A. data filtering and selection
    - B. conditional logic
    - C. flow control (esp. loops)
    - D. functions with a brief intro to lexical scoping
6. Good practices in R
    - A. caching data objects to file to avoid redundant computation and keeping a snapshot of the analysis environment for reproducibility/clarity
    - B. maintaining a set of related scripts while keeping the mainline analysis clear and succinct (often through use of functions or scripts that handle preprocessing/environment preparation)
    - C. version control, rather than having many copies of a script through a ‘save as’ setup. Brief intro to Github?
7. Graphics in R
    - A. output devices: save to PDF, PNG, brief intro to issues of vector versus raster graphics
    - B. super quick ggplot2 intro
8. Literate programming in R
    - A. introduction to R markdown and knitr
    - B. example of integrating narrative with code
    - C. example of building in figures in Rmd documents