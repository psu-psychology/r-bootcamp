R-Workshop-James
================
James LeBreton with Rick Gilmore
2017-08-16 16:50:07

``` r
path2data <- "../data/"
```

PART 1: INSTALLATION, SETTINGS, AND DATA MANAGEMENT
===================================================

TOPIC 1: Projects & Directories in R Studio
-------------------------------------------

``` r
getwd() #get the current working directory
```

    ## [1] "/Users/rick/github/psu-psychology/r-bootcamp/talks"

``` r
#setwd("~/Dropbox/James Work Files/R Workshop/2017") #change the working directory
```

Since `~/Dropbox/James Work Files/R Workshop/2017` is specific to James' computer, it won't work for others. When using an RStudio project, I don't change my working directory. Instead, I just make sure I give relevant functions information about the directories where other resources can be found.

TOPIC 2: Installing Packages & Loading into Active Library of Resources
-----------------------------------------------------------------------

### Install packages via syntax

``` r
# Can install by evaluating chunk, but not by "knitting"
install.packages("multilevel") #Downloading a package to my computer
#loading packages into working library
library("multilevel")
```

------------------------------------------------------------------------

### Understanding How R Searches for Information

``` r
search()
detach(package:multilevel)
search()
```

------------------------------------------------------------------------

### Obtaining Help

``` r
#You may inquire about a function using any of the following:
##If you know the exact name:
?search
help(search)

##If want to search by part of the name
apropos("searc")
```

    ##  [1] ".rs.getCompletionsSearchPath" ".rs.objectsOnSearchPath"     
    ##  [3] ".rs.recursiveSearch"          ".rs.rpc.search"              
    ##  [5] "help.search"                  "hsearch_db"                  
    ##  [7] "hsearch_db_concepts"          "hsearch_db_keywords"         
    ##  [9] "RSiteSearch"                  "search"                      
    ## [11] "searchpaths"

``` r
??sear
```

Another good source of help is [StackOverflow](http://stackoverflow.com).

TOPIC 3: Data Types & Structures in R
-------------------------------------

### Numbers

``` r
x <- 2
x
```

    ## [1] 2

``` r
y = c(1:3); y
```

    ## [1] 1 2 3

``` r
z = c("Porsche 911", "Porsche 944", "Porsche 911", "BMW 335xi")
z
```

    ## [1] "Porsche 911" "Porsche 944" "Porsche 911" "BMW 335xi"

``` r
g=sqrt(x); g
```

    ## [1] 1.414214

``` r
is.numeric(x)
```

    ## [1] TRUE

``` r
is.numeric(z)
```

    ## [1] FALSE

------------------------------------------------------------------------

### Strings

``` r
#String Data as character:
z
```

    ## [1] "Porsche 911" "Porsche 944" "Porsche 911" "BMW 335xi"

``` r
#String Data as factor:
z2=factor(z)
z2
```

    ## [1] Porsche 911 Porsche 944 Porsche 911 BMW 335xi  
    ## Levels: BMW 335xi Porsche 911 Porsche 944

``` r
#Compute the Length of a String (or Numeric) Variable:
nchar(x)
```

    ## [1] 1

``` r
nchar(y)
```

    ## [1] 1 1 1

``` r
nchar(y)
```

    ## [1] 1 1 1

``` r
nchar(z)
```

    ## [1] 11 11 11  9

``` r
#nchar(z2) Throws error during rendering
```

------------------------------------------------------------------------

### Logical Data

``` r
##Assumes values of TRUE or FALSE
###TRUE is considered equal to 1
###FALSE is considered equal to 0
TRUE*5
```

    ## [1] 5

``` r
sqrt(TRUE)
```

    ## [1] 1

``` r
t=TRUE
# you can test if a variable type is logical using:
is.logical(x)
```

    ## [1] FALSE

``` r
is.logical(t)
```

    ## [1] TRUE

``` r
# Logical data types also used as input to functions (see Day 2 examples)
2==2
```

    ## [1] TRUE

``` r
2==3
```

    ## [1] FALSE

------------------------------------------------------------------------

### Vectors

``` r
#Vectors - 1 dimensional collections of same type data
v1=1:5; v1 #creating vector of numbers
```

    ## [1] 1 2 3 4 5

``` r
v2=c(1,2,3,4,5); v2
```

    ## [1] 1 2 3 4 5

``` r
v3=c("Porsche 911", "Ford Mustang GT", "Plymouth Baracuda", "Chevrolet Camaro", "Honda Pilot LX")
v1; v2; v3
```

    ## [1] 1 2 3 4 5

    ## [1] 1 2 3 4 5

    ## [1] "Porsche 911"       "Ford Mustang GT"   "Plymouth Baracuda"
    ## [4] "Chevrolet Camaro"  "Honda Pilot LX"

``` r
#Matrices - 2 dimensional collections of same type data
m=matrix(1:20, nrow=5); m
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    6   11   16
    ## [2,]    2    7   12   17
    ## [3,]    3    8   13   18
    ## [4,]    4    9   14   19
    ## [5,]    5   10   15   20

------------------------------------------------------------------------

### Arrays & Data Frames

``` r
#Arrays - multidimensional collection of same type data
#example of 3D array
a=array(1:20, dim=c(2,5,2)); a
```

    ## , , 1
    ## 
    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]    1    3    5    7    9
    ## [2,]    2    4    6    8   10
    ## 
    ## , , 2
    ## 
    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]   11   13   15   17   19
    ## [2,]   12   14   16   18   20

``` r
#Creating a data frame from vectors
eng=c("Flat-6", "V-8", "V-8", "V-8", "V-6")
doors=c(2,2,2,2,4)
data1=data.frame(v2, v3, eng, doors)

# Viewing content of data framees
#   Look at the "enviroment" tab in the upper left panel
#   Click on one of the data frames listed under Data (e.g., "data1") 
#   Or, simply type:

data1
```

    ##   v2                v3    eng doors
    ## 1  1       Porsche 911 Flat-6     2
    ## 2  2   Ford Mustang GT    V-8     2
    ## 3  3 Plymouth Baracuda    V-8     2
    ## 4  4  Chevrolet Camaro    V-8     2
    ## 5  5    Honda Pilot LX    V-6     4

``` r
# Obtain a list of the variable names in a data frame 
names(data1)
```

    ## [1] "v2"    "v3"    "eng"   "doors"

------------------------------------------------------------------------

``` r
# Change the names of the variables in a data frame
data2=data.frame(id=v2, model=v3, eng=eng, doors=doors) #creates a new data frame 
data1
```

    ##   v2                v3    eng doors
    ## 1  1       Porsche 911 Flat-6     2
    ## 2  2   Ford Mustang GT    V-8     2
    ## 3  3 Plymouth Baracuda    V-8     2
    ## 4  4  Chevrolet Camaro    V-8     2
    ## 5  5    Honda Pilot LX    V-6     4

``` r
data2
```

    ##   id             model    eng doors
    ## 1  1       Porsche 911 Flat-6     2
    ## 2  2   Ford Mustang GT    V-8     2
    ## 3  3 Plymouth Baracuda    V-8     2
    ## 4  4  Chevrolet Camaro    V-8     2
    ## 5  5    Honda Pilot LX    V-6     4

``` r
data3=data1 #make a copy of the original dataframe
```

``` r
install.packages("plyr")
library(plyr)
data3=rename(data3, replace=c("v2"="id","v3" = "model"))  #renames specific variables
data3
names(data1)=c("id","model", "eng", "doors")  #replaces names of all variables in existing data frame
data1
```

TOPIC 4: Reading Data Files into R
----------------------------------

### Reading Data - From R Data Sets

``` r
##List of avaialble data sets
data()
library(multilevel)
#List data in the multilevel package
data(package="multilevel")
#load the univ data frame into R environment
data(univbct, package="multilevel")
d=univbct

#Confirm it is loaded as a data frame
class(d)
```

    ## [1] "data.frame"

------------------------------------------------------------------------

### Saving data frames as comma-separated value (CSV)

``` r
#Saving a data frame as a .csv file (to be read into SPSS, Excel, Text Editor, etc.)
write.table(d, file = paste0(path2data, "d2.csv"), sep=",",row.names=F)
write.table(d, paste0(path2data, "d1.csv"), sep=",", row.names=FALSE) 
```

``` r
#save the data as a text file to be read into SPSS
install.packages("foreign")
library("foreign")
write.foreign(univbct,
              datafile=paste0(path2data, "univbct.csv"),
              codefile=paste0(path2data, "univbct.sps"),
              package="SPSS")
file.show(paste0(path2data, "univbct.csv"))
file.show(paste0(path2data, "univbct.sps"))
```

------------------------------------------------------------------------

### Reading data from SPSS

``` r
library("foreign")
demo1=read.spss(file=paste0(path2data, "demo1.sav"), 
                use.value.labels=TRUE, 
                to.data.frame=TRUE,
                use.missings=TRUE)
summary(demo1)
```

    ##      SUBNUM            TIME        BTN            COMPANY   
    ##  Min.   :  1.00   Min.   :0   Min.   :   4.0   A      :246  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.: 377.8   HHC    :210  
    ##  Median :150.50   Median :1   Median :1022.0   B      :207  
    ##  Mean   :150.50   Mean   :1   Mean   :1860.3   D      :114  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:3066.0   C      : 84  
    ##  Max.   :300.00   Max.   :2   Max.   :4042.0   SVC    : 24  
    ##                                                (Other): 15  
    ##     MARITAL          GENDER         HOWLONG           RANK      
    ##  Min.   :1.000   Min.   :1.000   Min.   :0.000   Min.   :11.00  
    ##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000   1st Qu.:13.00  
    ##  Median :2.000   Median :1.000   Median :2.000   Median :14.00  
    ##  Mean   :1.711   Mean   :1.039   Mean   :2.371   Mean   :15.26  
    ##  3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:4.000   3rd Qu.:16.00  
    ##  Max.   :5.000   Max.   :2.000   Max.   :5.000   Max.   :32.00  
    ##  NA's   :6       NA's   :51      NA's   :18      NA's   :48     
    ##     EDUCATE           AGE       
    ##  Min.   :1.000   Min.   :18.00  
    ##  1st Qu.:2.000   1st Qu.:20.00  
    ##  Median :2.000   Median :24.00  
    ##  Mean   :2.663   Mean   :25.75  
    ##  3rd Qu.:3.000   3rd Qu.:30.00  
    ##  Max.   :6.000   Max.   :44.00  
    ##  NA's   :9       NA's   :9

``` r
demo2=read.spss(file=paste0(path2data, "demo2.sav"),
                use.value.labels=T,
                to.data.frame=T,
                use.missings=FALSE)
summary(demo2) #oops, GENDER = 999 was a missing values code
```

    ##      SUBNUM         TIME        BTN          COMPANY   
    ##  Min.   :301   Min.   :0   Min.   :   4   A      :156  
    ##  1st Qu.:349   1st Qu.:0   1st Qu.: 404   HHC    :144  
    ##  Median :398   Median :1   Median :1022   B      :141  
    ##  Mean   :398   Mean   :1   Mean   :1755   D      : 69  
    ##  3rd Qu.:447   3rd Qu.:2   3rd Qu.:3066   C      : 42  
    ##  Max.   :495   Max.   :2   Max.   :4042   SVC    : 15  
    ##                                           (Other): 18  
    ##     MARITAL          GENDER          HOWLONG     
    ##  Min.   :1.000   Min.   :  1.00   Min.   :0.000  
    ##  1st Qu.:1.000   1st Qu.:  1.00   1st Qu.:2.000  
    ##  Median :2.000   Median :  1.00   Median :2.000  
    ##  Mean   :1.756   Mean   : 88.03   Mean   :2.446  
    ##  3rd Qu.:2.000   3rd Qu.:  1.00   3rd Qu.:3.000  
    ##  Max.   :5.000   Max.   :999.00   Max.   :5.000  
    ##  NA's   :6                        NA's   :6      
    ##       RANK         EDUCATE          AGE       
    ##  Min.   :11.0   Min.   :1.00   Min.   :18.00  
    ##  1st Qu.:13.0   1st Qu.:2.00   1st Qu.:21.00  
    ##  Median :14.0   Median :2.00   Median :24.00  
    ##  Mean   :14.7   Mean   :2.49   Mean   :25.68  
    ##  3rd Qu.:15.0   3rd Qu.:2.00   3rd Qu.:29.00  
    ##  Max.   :31.0   Max.   :6.00   Max.   :46.00  
    ##  NA's   :27     NA's   :3      NA's   :3

``` r
demo2=read.spss(file=paste0(path2data, "demo2.sav"),
                use.value.labels=T,
                to.data.frame=T,
                use.missings=T)
names(demo1); names(demo2)
```

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"

``` r
#Reading data (csv)
data1=read.csv(paste0(path2data, "data1.csv"), header=T)
data2=read.csv(paste0(path2data, "data2.csv"))
```

------------------------------------------------------------------------

``` r
#Now click on "Environment" tab and the "data1" dataframe
#NA (not available) is automatically inserted by R for any missing data
head(data1) # display first 6 cases
```

    ##   SUBNUM TIME  JOBSAT1  COMMIT1 READY1 JOBSAT2  COMMIT2 READY2
    ## 1      1    0 1.666667 1.666667   2.75       1 1.666667      1
    ## 2      1    1 1.666667 1.666667   2.75       1 1.666667      1
    ## 3      1    2 1.666667 1.666667   2.75       1 1.666667      1
    ## 4      2    0 3.666667 1.666667   3.00       4 1.333333      2
    ## 5      2    1 3.666667 1.666667   3.00       4 1.333333      2
    ## 6      2    2 3.666667 1.666667   3.00       4 1.333333      2
    ##   JOBSAT3  COMMIT3 READY3     JSAT   COMMIT READY
    ## 1       3 3.000000   3.00 1.666667 1.666667  2.75
    ## 2       3 3.000000   3.00 1.000000 1.666667  1.00
    ## 3       3 3.000000   3.00 3.000000 3.000000  3.00
    ## 4       4 1.333333   1.75 3.666667 1.666667  3.00
    ## 5       4 1.333333   1.75 4.000000 1.333333  2.00
    ## 6       4 1.333333   1.75 4.000000 1.333333  1.75

``` r
tail(data1) # display last 6 cases
```

    ##     SUBNUM TIME  JOBSAT1  COMMIT1 READY1  JOBSAT2  COMMIT2
    ## 895    299    0 2.333333 4.333333   2.75 3.666667 3.666667
    ## 896    299    1 2.333333 4.333333   2.75 3.666667 3.666667
    ## 897    299    2 2.333333 4.333333   2.75 3.666667 3.666667
    ## 898    300    0 2.666667 3.666667   2.25 2.666667 4.333333
    ## 899    300    1 2.666667 3.666667   2.25 2.666667 4.333333
    ## 900    300    2 2.666667 3.666667   2.25 2.666667 4.333333
    ##     READY2 JOBSAT3  COMMIT3 READY3     JSAT   COMMIT READY
    ## 895   2.75       4 3.333333   3.00 2.333333 4.333333  2.75
    ## 896   2.75       4 3.333333   3.00 3.666667 3.666667  2.75
    ## 897   2.75       4 3.333333   3.00 4.000000 3.333333  3.00
    ## 898   3.75       3 4.333333   3.25 2.666667 3.666667  2.25
    ## 899   3.75       3 4.333333   3.25 2.666667 4.333333  3.75
    ## 900   3.75       3 4.333333   3.25 3.000000 4.333333  3.25

``` r
summary(data1) # display summary
```

    ##      SUBNUM            TIME      JOBSAT1       
    ##  Min.   :  1.00   Min.   :0   Min.   :  1.000  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.:  2.667  
    ##  Median :150.50   Median :1   Median :  3.667  
    ##  Mean   :150.50   Mean   :1   Mean   : 49.763  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:  4.000  
    ##  Max.   :300.00   Max.   :2   Max.   :999.000  
    ##                                                
    ##     COMMIT1            READY1          JOBSAT2     
    ##  Min.   :  1.000   Min.   :  1.00   Min.   :1.000  
    ##  1st Qu.:  3.333   1st Qu.:  2.75   1st Qu.:2.667  
    ##  Median :  3.667   Median :  3.25   Median :3.333  
    ##  Mean   : 46.794   Mean   : 56.18   Mean   :3.272  
    ##  3rd Qu.:  4.333   3rd Qu.:  3.75   3rd Qu.:4.000  
    ##  Max.   :999.000   Max.   :999.00   Max.   :5.000  
    ##                                     NA's   :66     
    ##     COMMIT2          READY2         JOBSAT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:3.000  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.498   Mean   :3.176   Mean   :3.355  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :54      NA's   :51     
    ##     COMMIT3          READY3           JSAT      
    ##  Min.   :1.333   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:2.667  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.556   Mean   :3.241   Mean   :3.308  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :48      NA's   :53     
    ##      COMMIT          READY      
    ##  Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750  
    ##  Median :3.667   Median :3.250  
    ##  Mean   :3.573   Mean   :3.161  
    ##  3rd Qu.:4.000   3rd Qu.:3.750  
    ##  Max.   :5.000   Max.   :5.000  
    ##  NA's   :45      NA's   :50

``` r
summary(data2)
```

    ##      SUBNUM         TIME      JOBSAT1         COMMIT1     
    ##  Min.   :301   Min.   :0   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:349   1st Qu.:0   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :398   Median :1   Median :3.333   Median :3.667  
    ##  Mean   :398   Mean   :1   Mean   :3.137   Mean   :3.543  
    ##  3rd Qu.:447   3rd Qu.:2   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :495   Max.   :2   Max.   :5.000   Max.   :5.000  
    ##                            NA's   :39      NA's   :45     
    ##      READY1        JOBSAT2         COMMIT2     
    ##  Min.   :1.00   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.25   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.00   Median :3.333   Median :3.667  
    ##  Mean   :2.92   Mean   :3.207   Mean   :3.422  
    ##  3rd Qu.:3.50   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :4.75   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48     NA's   :24      NA's   :21     
    ##      READY2         JOBSAT3         COMMIT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.500   1st Qu.:3.000   1st Qu.:3.000  
    ##  Median :3.000   Median :3.333   Median :3.667  
    ##  Mean   :3.007   Mean   :3.313   Mean   :3.508  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :33      NA's   :45      NA's   :36     
    ##      READY3           JSAT           COMMIT     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.750   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.165   Mean   :3.219   Mean   :3.490  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :57      NA's   :36      NA's   :34     
    ##      READY     
    ##  Min.   :1.00  
    ##  1st Qu.:2.50  
    ##  Median :3.25  
    ##  Mean   :3.03  
    ##  3rd Qu.:3.75  
    ##  Max.   :5.00  
    ##  NA's   :46

------------------------------------------------------------------------

### Handling missing values

``` r
#Note: I used 999 to represent missing data for JOBSAT1 COMMIT1 and READY1  
#R needs to be told that 999 is not a legitimate value, but is user-defined missing value
data1$JOBSAT1[data1$JOBSAT1==999]=NA #Explain what the heck this means!
data1$COMMIT1[data1$COMMIT1==999]=NA 
data1$READY1[data1$READY1==999]=NA 
summary(data1)
```

    ##      SUBNUM            TIME      JOBSAT1         COMMIT1     
    ##  Min.   :  1.00   Min.   :0   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :150.50   Median :1   Median :3.333   Median :3.667  
    ##  Mean   :150.50   Mean   :1   Mean   :3.297   Mean   :3.663  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :300.00   Max.   :2   Max.   :5.000   Max.   :5.000  
    ##                               NA's   :42      NA's   :39     
    ##      READY1         JOBSAT2         COMMIT2     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.500   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.000   Median :3.333   Median :3.667  
    ##  Mean   :3.066   Mean   :3.272   Mean   :3.498  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :66      NA's   :48     
    ##      READY2         JOBSAT3         COMMIT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.333  
    ##  1st Qu.:2.750   1st Qu.:3.000   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.176   Mean   :3.355   Mean   :3.556  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :54      NA's   :51      NA's   :48     
    ##      READY3           JSAT           COMMIT     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.750   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.241   Mean   :3.308   Mean   :3.573  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :53      NA's   :45     
    ##      READY      
    ##  Min.   :1.000  
    ##  1st Qu.:2.750  
    ##  Median :3.250  
    ##  Mean   :3.161  
    ##  3rd Qu.:3.750  
    ##  Max.   :5.000  
    ##  NA's   :50

``` r
summary(data2)
```

    ##      SUBNUM         TIME      JOBSAT1         COMMIT1     
    ##  Min.   :301   Min.   :0   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:349   1st Qu.:0   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :398   Median :1   Median :3.333   Median :3.667  
    ##  Mean   :398   Mean   :1   Mean   :3.137   Mean   :3.543  
    ##  3rd Qu.:447   3rd Qu.:2   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :495   Max.   :2   Max.   :5.000   Max.   :5.000  
    ##                            NA's   :39      NA's   :45     
    ##      READY1        JOBSAT2         COMMIT2     
    ##  Min.   :1.00   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.25   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.00   Median :3.333   Median :3.667  
    ##  Mean   :2.92   Mean   :3.207   Mean   :3.422  
    ##  3rd Qu.:3.50   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :4.75   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48     NA's   :24      NA's   :21     
    ##      READY2         JOBSAT3         COMMIT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.500   1st Qu.:3.000   1st Qu.:3.000  
    ##  Median :3.000   Median :3.333   Median :3.667  
    ##  Mean   :3.007   Mean   :3.313   Mean   :3.508  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :33      NA's   :45      NA's   :36     
    ##      READY3           JSAT           COMMIT     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.750   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.165   Mean   :3.219   Mean   :3.490  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :57      NA's   :36      NA's   :34     
    ##      READY     
    ##  Min.   :1.00  
    ##  1st Qu.:2.50  
    ##  Median :3.25  
    ##  Mean   :3.03  
    ##  3rd Qu.:3.75  
    ##  Max.   :5.00  
    ##  NA's   :46

------------------------------------------------------------------------

``` r
#The above can be tedious if you have a large number of variables
### it is eaiser if you copy & paste code
#Or, if 999 doens't hold any meaning for ANY of the variables
data1=read.csv(paste0(path2data, "data1.csv"), na.strings=c(".", "999","9","-9"))
summary(data1)
```

    ##      SUBNUM         TIME      JOBSAT1         COMMIT1     
    ##  Min.   :  1   Min.   :0   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.: 76   1st Qu.:0   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :151   Median :1   Median :3.333   Median :3.667  
    ##  Mean   :151   Mean   :1   Mean   :3.297   Mean   :3.663  
    ##  3rd Qu.:226   3rd Qu.:2   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :300   Max.   :2   Max.   :5.000   Max.   :5.000  
    ##  NA's   :3                 NA's   :42      NA's   :39     
    ##      READY1         JOBSAT2         COMMIT2     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.500   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.000   Median :3.333   Median :3.667  
    ##  Mean   :3.066   Mean   :3.272   Mean   :3.498  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :66      NA's   :48     
    ##      READY2         JOBSAT3         COMMIT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.333  
    ##  1st Qu.:2.750   1st Qu.:3.000   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.176   Mean   :3.355   Mean   :3.556  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :54      NA's   :51      NA's   :48     
    ##      READY3           JSAT           COMMIT     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.750   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.241   Mean   :3.308   Mean   :3.573  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :53      NA's   :45     
    ##      READY      
    ##  Min.   :1.000  
    ##  1st Qu.:2.750  
    ##  Median :3.250  
    ##  Mean   :3.161  
    ##  3rd Qu.:3.750  
    ##  Max.   :5.000  
    ##  NA's   :50

``` r
#OR, you could write a function
my999isNA=function(x) {x[x==999]=NA; x}
```

------------------------------------------------------------------------

``` r
#Now we will apply this missing data function to the proper variables in data2
#To do this, we use the "lapply" function which allows us to apply the same function over a list or array

data1=read.csv(paste0(path2data, "data1.csv")) #reread data1 as a data.frame with missing data 
names(data1)
```

    ##  [1] "SUBNUM"  "TIME"    "JOBSAT1" "COMMIT1" "READY1" 
    ##  [6] "JOBSAT2" "COMMIT2" "READY2"  "JOBSAT3" "COMMIT3"
    ## [11] "READY3"  "JSAT"    "COMMIT"  "READY"

``` r
summary(data1)
```

    ##      SUBNUM            TIME      JOBSAT1       
    ##  Min.   :  1.00   Min.   :0   Min.   :  1.000  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.:  2.667  
    ##  Median :150.50   Median :1   Median :  3.667  
    ##  Mean   :150.50   Mean   :1   Mean   : 49.763  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:  4.000  
    ##  Max.   :300.00   Max.   :2   Max.   :999.000  
    ##                                                
    ##     COMMIT1            READY1          JOBSAT2     
    ##  Min.   :  1.000   Min.   :  1.00   Min.   :1.000  
    ##  1st Qu.:  3.333   1st Qu.:  2.75   1st Qu.:2.667  
    ##  Median :  3.667   Median :  3.25   Median :3.333  
    ##  Mean   : 46.794   Mean   : 56.18   Mean   :3.272  
    ##  3rd Qu.:  4.333   3rd Qu.:  3.75   3rd Qu.:4.000  
    ##  Max.   :999.000   Max.   :999.00   Max.   :5.000  
    ##                                     NA's   :66     
    ##     COMMIT2          READY2         JOBSAT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:3.000  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.498   Mean   :3.176   Mean   :3.355  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :54      NA's   :51     
    ##     COMMIT3          READY3           JSAT      
    ##  Min.   :1.333   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:2.667  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.556   Mean   :3.241   Mean   :3.308  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :48      NA's   :53     
    ##      COMMIT          READY      
    ##  Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750  
    ##  Median :3.667   Median :3.250  
    ##  Mean   :3.573   Mean   :3.161  
    ##  3rd Qu.:4.000   3rd Qu.:3.750  
    ##  Max.   :5.000   Max.   :5.000  
    ##  NA's   :45      NA's   :50

``` r
data1[3:5]=lapply(data1[3:5],my999isNA)
summary(data1)
```

    ##      SUBNUM            TIME      JOBSAT1         COMMIT1     
    ##  Min.   :  1.00   Min.   :0   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :150.50   Median :1   Median :3.333   Median :3.667  
    ##  Mean   :150.50   Mean   :1   Mean   :3.297   Mean   :3.663  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :300.00   Max.   :2   Max.   :5.000   Max.   :5.000  
    ##                               NA's   :42      NA's   :39     
    ##      READY1         JOBSAT2         COMMIT2     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.500   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.000   Median :3.333   Median :3.667  
    ##  Mean   :3.066   Mean   :3.272   Mean   :3.498  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :66      NA's   :48     
    ##      READY2         JOBSAT3         COMMIT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.333  
    ##  1st Qu.:2.750   1st Qu.:3.000   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.176   Mean   :3.355   Mean   :3.556  
    ##  3rd Qu.:3.750   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :54      NA's   :51      NA's   :48     
    ##      READY3           JSAT           COMMIT     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.750   1st Qu.:2.667   1st Qu.:3.000  
    ##  Median :3.250   Median :3.333   Median :3.667  
    ##  Mean   :3.241   Mean   :3.308   Mean   :3.573  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :48      NA's   :53      NA's   :45     
    ##      READY      
    ##  Min.   :1.000  
    ##  1st Qu.:2.750  
    ##  Median :3.250  
    ##  Mean   :3.161  
    ##  3rd Qu.:3.750  
    ##  Max.   :5.000  
    ##  NA's   :50

TOPIC 5: Merging Data Files
---------------------------

``` r
#Merging data by adding variables (e.g, two data.frames, demo1 + data1)
dd1=merge(demo1,data1, by="SUBNUM")
dd1=merge(demo1,data1, by=c("SUBNUM","TIME"), all=TRUE)
      
dd2=merge(demo2,data2, by=c("SUBNUM","TIME"), all=TRUE)
summary(dd1)
```

    ##      SUBNUM            TIME        BTN            COMPANY   
    ##  Min.   :  1.00   Min.   :0   Min.   :   4.0   A      :246  
    ##  1st Qu.: 75.75   1st Qu.:0   1st Qu.: 377.8   HHC    :210  
    ##  Median :150.50   Median :1   Median :1022.0   B      :207  
    ##  Mean   :150.50   Mean   :1   Mean   :1860.3   D      :114  
    ##  3rd Qu.:225.25   3rd Qu.:2   3rd Qu.:3066.0   C      : 84  
    ##  Max.   :300.00   Max.   :2   Max.   :4042.0   SVC    : 24  
    ##                                                (Other): 15  
    ##     MARITAL          GENDER         HOWLONG     
    ##  Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.000  
    ##  Median :2.000   Median :1.000   Median :2.000  
    ##  Mean   :1.711   Mean   :1.039   Mean   :2.371  
    ##  3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :2.000   Max.   :5.000  
    ##  NA's   :6       NA's   :51      NA's   :18     
    ##       RANK          EDUCATE           AGE       
    ##  Min.   :11.00   Min.   :1.000   Min.   :18.00  
    ##  1st Qu.:13.00   1st Qu.:2.000   1st Qu.:20.00  
    ##  Median :14.00   Median :2.000   Median :24.00  
    ##  Mean   :15.26   Mean   :2.663   Mean   :25.75  
    ##  3rd Qu.:16.00   3rd Qu.:3.000   3rd Qu.:30.00  
    ##  Max.   :32.00   Max.   :6.000   Max.   :44.00  
    ##  NA's   :48      NA's   :9       NA's   :9      
    ##     JOBSAT1         COMMIT1          READY1     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.667   1st Qu.:3.000   1st Qu.:2.500  
    ##  Median :3.333   Median :3.667   Median :3.000  
    ##  Mean   :3.297   Mean   :3.663   Mean   :3.066  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:3.750  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :42      NA's   :39      NA's   :48     
    ##     JOBSAT2         COMMIT2          READY2     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.667   1st Qu.:3.000   1st Qu.:2.750  
    ##  Median :3.333   Median :3.667   Median :3.250  
    ##  Mean   :3.272   Mean   :3.498   Mean   :3.176  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:3.750  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :66      NA's   :48      NA's   :54     
    ##     JOBSAT3         COMMIT3          READY3     
    ##  Min.   :1.000   Min.   :1.333   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:3.000   1st Qu.:2.750  
    ##  Median :3.333   Median :3.667   Median :3.250  
    ##  Mean   :3.355   Mean   :3.556   Mean   :3.241  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :51      NA's   :48      NA's   :48     
    ##       JSAT           COMMIT          READY      
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.667   1st Qu.:3.000   1st Qu.:2.750  
    ##  Median :3.333   Median :3.667   Median :3.250  
    ##  Mean   :3.308   Mean   :3.573   Mean   :3.161  
    ##  3rd Qu.:4.000   3rd Qu.:4.000   3rd Qu.:3.750  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :53      NA's   :45      NA's   :50

``` r
summary(dd2)
```

    ##      SUBNUM         TIME        BTN          COMPANY   
    ##  Min.   :301   Min.   :0   Min.   :   4   A      :156  
    ##  1st Qu.:349   1st Qu.:0   1st Qu.: 404   HHC    :144  
    ##  Median :398   Median :1   Median :1022   B      :141  
    ##  Mean   :398   Mean   :1   Mean   :1755   D      : 69  
    ##  3rd Qu.:447   3rd Qu.:2   3rd Qu.:3066   C      : 42  
    ##  Max.   :495   Max.   :2   Max.   :4042   SVC    : 15  
    ##                                           (Other): 18  
    ##     MARITAL          GENDER         HOWLONG     
    ##  Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:2.000  
    ##  Median :2.000   Median :1.000   Median :2.000  
    ##  Mean   :1.756   Mean   :1.022   Mean   :2.446  
    ##  3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:3.000  
    ##  Max.   :5.000   Max.   :2.000   Max.   :5.000  
    ##  NA's   :6       NA's   :51      NA's   :6      
    ##       RANK         EDUCATE          AGE           JOBSAT1     
    ##  Min.   :11.0   Min.   :1.00   Min.   :18.00   Min.   :1.000  
    ##  1st Qu.:13.0   1st Qu.:2.00   1st Qu.:21.00   1st Qu.:2.667  
    ##  Median :14.0   Median :2.00   Median :24.00   Median :3.333  
    ##  Mean   :14.7   Mean   :2.49   Mean   :25.68   Mean   :3.137  
    ##  3rd Qu.:15.0   3rd Qu.:2.00   3rd Qu.:29.00   3rd Qu.:4.000  
    ##  Max.   :31.0   Max.   :6.00   Max.   :46.00   Max.   :5.000  
    ##  NA's   :27     NA's   :3      NA's   :3       NA's   :39     
    ##     COMMIT1          READY1        JOBSAT2     
    ##  Min.   :1.000   Min.   :1.00   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.25   1st Qu.:2.667  
    ##  Median :3.667   Median :3.00   Median :3.333  
    ##  Mean   :3.543   Mean   :2.92   Mean   :3.207  
    ##  3rd Qu.:4.000   3rd Qu.:3.50   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :4.75   Max.   :5.000  
    ##  NA's   :45      NA's   :48     NA's   :24     
    ##     COMMIT2          READY2         JOBSAT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.500   1st Qu.:3.000  
    ##  Median :3.667   Median :3.000   Median :3.333  
    ##  Mean   :3.422   Mean   :3.007   Mean   :3.313  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :21      NA's   :33      NA's   :45     
    ##     COMMIT3          READY3           JSAT      
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:2.667  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.508   Mean   :3.165   Mean   :3.219  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :36      NA's   :57      NA's   :36     
    ##      COMMIT          READY     
    ##  Min.   :1.000   Min.   :1.00  
    ##  1st Qu.:3.000   1st Qu.:2.50  
    ##  Median :3.667   Median :3.25  
    ##  Mean   :3.490   Mean   :3.03  
    ##  3rd Qu.:4.000   3rd Qu.:3.75  
    ##  Max.   :5.000   Max.   :5.00  
    ##  NA's   :34      NA's   :46

### Merging data by adding rows (subjects)

``` r
#let's combine dd1 with dd2
#when you have IDENTICAL columns in both data sets you may use rbind
names(dd1); names(dd2)
```

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"    
    ## [11] "JOBSAT1" "COMMIT1" "READY1"  "JOBSAT2" "COMMIT2"
    ## [16] "READY2"  "JOBSAT3" "COMMIT3" "READY3"  "JSAT"   
    ## [21] "COMMIT"  "READY"

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"    
    ## [11] "JOBSAT1" "COMMIT1" "READY1"  "JOBSAT2" "COMMIT2"
    ## [16] "READY2"  "JOBSAT3" "COMMIT3" "READY3"  "JSAT"   
    ## [21] "COMMIT"  "READY"

``` r
dd3=rbind(dd1,dd2)
summary(dd3)
```

    ##      SUBNUM         TIME        BTN          COMPANY   
    ##  Min.   :  1   Min.   :0   Min.   :   4   A      :402  
    ##  1st Qu.:124   1st Qu.:0   1st Qu.: 404   HHC    :354  
    ##  Median :248   Median :1   Median :1022   B      :348  
    ##  Mean   :248   Mean   :1   Mean   :1819   D      :183  
    ##  3rd Qu.:372   3rd Qu.:2   3rd Qu.:3066   C      :126  
    ##  Max.   :495   Max.   :2   Max.   :4042   SVC    : 39  
    ##                                           (Other): 33  
    ##     MARITAL          GENDER         HOWLONG         RANK      
    ##  Min.   :1.000   Min.   :1.000   Min.   :0.0   Min.   :11.00  
    ##  1st Qu.:1.000   1st Qu.:1.000   1st Qu.:1.0   1st Qu.:13.00  
    ##  Median :2.000   Median :1.000   Median :2.0   Median :14.00  
    ##  Mean   :1.729   Mean   :1.033   Mean   :2.4   Mean   :15.04  
    ##  3rd Qu.:2.000   3rd Qu.:1.000   3rd Qu.:4.0   3rd Qu.:16.00  
    ##  Max.   :5.000   Max.   :2.000   Max.   :5.0   Max.   :32.00  
    ##  NA's   :12      NA's   :102     NA's   :24    NA's   :75     
    ##     EDUCATE           AGE           JOBSAT1     
    ##  Min.   :1.000   Min.   :18.00   Min.   :1.000  
    ##  1st Qu.:2.000   1st Qu.:21.00   1st Qu.:2.667  
    ##  Median :2.000   Median :24.00   Median :3.333  
    ##  Mean   :2.595   Mean   :25.72   Mean   :3.235  
    ##  3rd Qu.:3.000   3rd Qu.:30.00   3rd Qu.:4.000  
    ##  Max.   :6.000   Max.   :46.00   Max.   :5.000  
    ##  NA's   :12      NA's   :12      NA's   :81     
    ##     COMMIT1          READY1        JOBSAT2     
    ##  Min.   :1.000   Min.   :1.00   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.50   1st Qu.:2.667  
    ##  Median :3.667   Median :3.00   Median :3.333  
    ##  Mean   :3.617   Mean   :3.01   Mean   :3.246  
    ##  3rd Qu.:4.000   3rd Qu.:3.75   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.00   Max.   :5.000  
    ##  NA's   :84      NA's   :96     NA's   :90     
    ##     COMMIT2          READY2         JOBSAT3     
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.500   1st Qu.:3.000  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.468   Mean   :3.109   Mean   :3.338  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :69      NA's   :87      NA's   :96     
    ##     COMMIT3          READY3           JSAT      
    ##  Min.   :1.000   Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:3.000   1st Qu.:2.750   1st Qu.:2.667  
    ##  Median :3.667   Median :3.250   Median :3.333  
    ##  Mean   :3.537   Mean   :3.212   Mean   :3.273  
    ##  3rd Qu.:4.000   3rd Qu.:3.750   3rd Qu.:4.000  
    ##  Max.   :5.000   Max.   :5.000   Max.   :5.000  
    ##  NA's   :84      NA's   :105     NA's   :89     
    ##      COMMIT          READY     
    ##  Min.   :1.000   Min.   :1.00  
    ##  1st Qu.:3.000   1st Qu.:2.50  
    ##  Median :3.667   Median :3.25  
    ##  Mean   :3.540   Mean   :3.11  
    ##  3rd Qu.:4.000   3rd Qu.:3.75  
    ##  Max.   :5.000   Max.   :5.00  
    ##  NA's   :79      NA's   :96

``` r
#when you have different columns in your data, you can use rbind.fill
#first let's compute some extra variables and add them to dd1
#Computing new variables in an existing data.frame
dd1$STAY=dd1$JSAT+dd1$COMMIT
#dd3=rbind(dd1,dd2) doesn't work because of differing colums
?rbind.fill
install.packages("plyr")
library(plyr)
```

``` r
dd3=plyr::rbind.fill(dd1,dd2)
head(dd3); tail(dd3)
```

    ##   SUBNUM TIME  BTN COMPANY MARITAL GENDER HOWLONG RANK EDUCATE
    ## 1      1    0 1022     HHC       1      1       2   12       2
    ## 2      1    1 1022     HHC       1      1       2   12       2
    ## 3      1    2 1022     HHC       1      1       2   12       2
    ## 4     10    0 3066       C       1      1       3   13       2
    ## 5     10    1 3066       C       1      1       3   13       2
    ## 6     10    2 3066       C       1      1       3   13       2
    ##   AGE  JOBSAT1  COMMIT1 READY1  JOBSAT2  COMMIT2 READY2
    ## 1  20 1.666667 1.666667   2.75 1.000000 1.666667      1
    ## 2  20 1.666667 1.666667   2.75 1.000000 1.666667      1
    ## 3  20 1.666667 1.666667   2.75 1.000000 1.666667      1
    ## 4  22 1.000000 3.666667   2.00 1.333333 3.333333      3
    ## 5  22 1.000000 3.666667   2.00 1.333333 3.333333      3
    ## 6  22 1.000000 3.666667   2.00 1.333333 3.333333      3
    ##   JOBSAT3 COMMIT3 READY3     JSAT   COMMIT READY
    ## 1       3       3      3 1.666667 1.666667  2.75
    ## 2       3       3      3 1.000000 1.666667  1.00
    ## 3       3       3      3 3.000000 3.000000  3.00
    ## 4       3       3      3 1.000000 3.666667  2.00
    ## 5       3       3      3 1.333333 3.333333  3.00
    ## 6       3       3      3 3.000000 3.000000  3.00

    ##      SUBNUM TIME  BTN COMPANY MARITAL GENDER HOWLONG RANK
    ## 1480    494    0 4042       B       1      1       0   11
    ## 1481    494    1 4042       B       1      1       0   11
    ## 1482    494    2 4042       B       1      1       0   11
    ## 1483    495    0 1022       B       1      1       3   13
    ## 1484    495    1 1022       B       1      1       3   13
    ## 1485    495    2 1022       B       1      1       3   13
    ##      EDUCATE AGE JOBSAT1  COMMIT1 READY1  JOBSAT2  COMMIT2
    ## 1480       2  22       3 4.333333   3.75 2.333333 3.333333
    ## 1481       2  22       3 4.333333   3.75 2.333333 3.333333
    ## 1482       2  22       3 4.333333   3.75 2.333333 3.333333
    ## 1483       2  19       4 4.000000   3.75 4.000000 4.000000
    ## 1484       2  19       4 4.000000   3.75 4.000000 4.000000
    ## 1485       2  19       4 4.000000   3.75 4.000000 4.000000
    ##      READY2  JOBSAT3  COMMIT3 READY3     JSAT   COMMIT READY
    ## 1480   3.25 3.666667 4.000000   4.00 3.000000 4.333333  3.75
    ## 1481   3.25 3.666667 4.000000   4.00 2.333333 3.333333  3.25
    ## 1482   3.25 3.666667 4.000000   4.00 3.666667 4.000000  4.00
    ## 1483   4.00 3.000000 3.333333   3.25 4.000000 4.000000  3.75
    ## 1484   4.00 3.000000 3.333333   3.25 4.000000 4.000000  4.00
    ## 1485   4.00 3.000000 3.333333   3.25 3.000000 3.333333  3.25

------------------------------------------------------------------------

### Deleting a variable from a data frame

``` r
#let's delete STAY from the previous dd3 data.frame
names(dd3)
```

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"    
    ## [11] "JOBSAT1" "COMMIT1" "READY1"  "JOBSAT2" "COMMIT2"
    ## [16] "READY2"  "JOBSAT3" "COMMIT3" "READY3"  "JSAT"   
    ## [21] "COMMIT"  "READY"

``` r
dd4=dd3[c(1,2,3:22)]
names(dd4)
```

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "MARITAL"
    ##  [6] "GENDER"  "HOWLONG" "RANK"    "EDUCATE" "AGE"    
    ## [11] "JOBSAT1" "COMMIT1" "READY1"  "JOBSAT2" "COMMIT2"
    ## [16] "READY2"  "JOBSAT3" "COMMIT3" "READY3"  "JSAT"   
    ## [21] "COMMIT"  "READY"

``` r
#Renaming a variable in a data.frame
#let's rename HOWLONG to TENURE and MARITAL to STATUS
dd4=plyr::rename(dd4, c(HOWLONG="TENURE", MARITAL="STATUS")) 
names(dd4)
```

    ##  [1] "SUBNUM"  "TIME"    "BTN"     "COMPANY" "STATUS" 
    ##  [6] "GENDER"  "TENURE"  "RANK"    "EDUCATE" "AGE"    
    ## [11] "JOBSAT1" "COMMIT1" "READY1"  "JOBSAT2" "COMMIT2"
    ## [16] "READY2"  "JOBSAT3" "COMMIT3" "READY3"  "JSAT"   
    ## [21] "COMMIT"  "READY"

------------------------------------------------------------------------

### Recoding variables

``` r
#Categorical Variables: recode sex into a different, dummy variable
#Only “factor” type variables are assigned value labels
dd4$GENDER2=plyr::revalue(as.factor(dd4$GENDER), c("1"="male","2"="female"))
dd4$GENDER3=(dd4$GENDER-1)
class(dd4$GENDER)
```

    ## [1] "numeric"

``` r
class(dd4$GENDER2)
```

    ## [1] "factor"

``` r
class(dd4$GENDER3)
```

    ## [1] "numeric"

``` r
#recode Likert-type items/scales
###let's reverse the overall score on COMMIT so that high scores = more likely to leave
dd4$LEAVE=6-dd4$COMMIT
```

TOPIC 6: Summarizing & Visualizing Data Frames
----------------------------------------------

### Central Tendency

``` r
mean(dd3$JSAT); median(dd3$JSAT)
```

    ## [1] NA

    ## [1] NA

``` r
mean(dd3$JSAT,na.rm=TRUE); median(dd3$JSAT,na.rm=TRUE)
```

    ## [1] 3.272923

    ## [1] 3.333333

``` r
#Dispersion
var(dd3$JSAT,na.rm=T)
```

    ## [1] 0.8622181

``` r
sd(dd3$JSAT,na.rm=T)
```

    ## [1] 0.928557

``` r
min(dd3$JSAT, na.rm=T)
```

    ## [1] 1

``` r
max(dd3$JSAT,na.rm=T)
```

    ## [1] 5

``` r
summary(dd3$JSAT,na.rm=T)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##   1.000   2.667   3.333   3.273   4.000   5.000      89

``` r
quantile(dd3$JSAT,probs=c(.1,.2,.3,.4,.5,.6,.7,.8,.9),na.rm=T)
```

    ##      10%      20%      30%      40%      50%      60%      70% 
    ## 2.000000 2.333333 3.000000 3.000000 3.333333 3.666667 4.000000 
    ##      80%      90% 
    ## 4.000000 4.333333

### Alternative: Hmisc

``` r
install.packages("Hmisc")
library("Hmisc")
```

``` r
Hmisc::describe(dd4)
```

    ## dd4 
    ## 
    ##  25  Variables      1485  Observations
    ## ---------------------------------------------------------------
    ## SUBNUM 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1485        0      495        1      248    165.1     25.2 
    ##      .10      .25      .50      .75      .90      .95 
    ##     50.0    124.0    248.0    372.0    446.0    470.8 
    ## 
    ## lowest :   1   2   3   4   5, highest: 491 492 493 494 495
    ## ---------------------------------------------------------------
    ## TIME 
    ##        n  missing distinct     Info     Mean      Gmd 
    ##     1485        0        3    0.889        1   0.8895 
    ##                             
    ## Value          0     1     2
    ## Frequency    495   495   495
    ## Proportion 0.333 0.333 0.333
    ## ---------------------------------------------------------------
    ## BTN 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1485        0       16    0.965     1819     1566        4 
    ##      .10      .25      .50      .75      .90      .95 
    ##      104      404     1022     3066     4042     4042 
    ##                                                           
    ## Value          0   100   120   140   300   400   700  1000
    ## Frequency    141    15    42    30   123    48     6    66
    ## Proportion 0.095 0.010 0.028 0.020 0.083 0.032 0.004 0.044
    ##                                                     
    ## Value       1010  1020  2000  2010  3070  4000  4040
    ## Frequency     21   288    36    51   435    18   165
    ## Proportion 0.014 0.194 0.024 0.034 0.293 0.012 0.111
    ## ---------------------------------------------------------------
    ## COMPANY 
    ##        n  missing distinct 
    ##     1485        0        8 
    ##                                                           
    ## Value          A     B     C     D     F   HHC   REC   SVC
    ## Frequency    402   348   126   183    15   354    18    39
    ## Proportion 0.271 0.234 0.085 0.123 0.010 0.238 0.012 0.026
    ## ---------------------------------------------------------------
    ## STATUS 
    ##        n  missing distinct     Info     Mean      Gmd 
    ##     1473       12        5     0.79    1.729    0.745 
    ##                                         
    ## Value          1     2     3     4     5
    ## Frequency    603   768    21    60    21
    ## Proportion 0.409 0.521 0.014 0.041 0.014
    ## ---------------------------------------------------------------
    ## GENDER 
    ##        n  missing distinct     Info     Mean      Gmd 
    ##     1383      102        2    0.094    1.033    0.063 
    ##                       
    ## Value          1     2
    ## Frequency   1338    45
    ## Proportion 0.967 0.033
    ## ---------------------------------------------------------------
    ## TENURE 
    ##        n  missing distinct     Info     Mean      Gmd 
    ##     1461       24        6    0.949      2.4    1.747 
    ##                                               
    ## Value          0     1     2     3     4     5
    ## Frequency    216   159   495   225   147   219
    ## Proportion 0.148 0.109 0.339 0.154 0.101 0.150
    ## ---------------------------------------------------------------
    ## RANK 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1410       75       15    0.972    15.04    2.979       12 
    ##      .10      .25      .50      .75      .90      .95 
    ##       12       13       14       16       21       22 
    ##                                                           
    ## Value         11    12    13    14    15    16    17    18
    ## Frequency     21   147   324   264   279   114    84    18
    ## Proportion 0.015 0.104 0.230 0.187 0.198 0.081 0.060 0.013
    ##                                                     
    ## Value         19    21    22    23    24    31    32
    ## Frequency      3    54    51    42     3     3     3
    ## Proportion 0.002 0.038 0.036 0.030 0.002 0.002 0.002
    ## ---------------------------------------------------------------
    ## EDUCATE 
    ##        n  missing distinct     Info     Mean      Gmd 
    ##     1473       12        6    0.617    2.595   0.9586 
    ##                                               
    ## Value          1     2     3     4     5     6
    ## Frequency      9  1068    99   117   168    12
    ## Proportion 0.006 0.725 0.067 0.079 0.114 0.008
    ## ---------------------------------------------------------------
    ## AGE 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1473       12       29    0.994    25.72    6.715       19 
    ##      .10      .25      .50      .75      .90      .95 
    ##       19       21       24       30       35       37 
    ## 
    ## lowest : 18 19 20 21 22, highest: 42 43 44 45 46
    ## ---------------------------------------------------------------
    ## JOBSAT1 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1404       81       13    0.983    3.235    1.104    1.333 
    ##      .10      .25      .50      .75      .90      .95 
    ##    1.667    2.667    3.333    4.000    4.333    4.667 
    ## 
    ## 1 (48, 0.034), 1.333333 (39, 0.028), 1.666667 (63, 0.045), 2
    ## (96, 0.068), 2.333333 (78, 0.056), 2.666667 (102, 0.073), 3
    ## (180, 0.128), 3.333333 (156, 0.111), 3.666667 (141, 0.100), 4
    ## (315, 0.224), 4.333333 (87, 0.062), 4.666667 (54, 0.038), 5
    ## (45, 0.032)
    ## ---------------------------------------------------------------
    ## COMMIT1 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1401       84       13    0.982    3.617   0.9408    2.000 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.333    3.000    3.667    4.000    4.667    5.000 
    ## 
    ## 1 (12, 0.009), 1.333333 (9, 0.006), 1.666667 (21, 0.015), 2
    ## (45, 0.032), 2.333333 (57, 0.041), 2.666667 (75, 0.054), 3
    ## (165, 0.118), 3.333333 (189, 0.135), 3.666667 (222, 0.158), 4
    ## (282, 0.201), 4.333333 (102, 0.073), 4.666667 (102, 0.073), 5
    ## (120, 0.086)
    ## ---------------------------------------------------------------
    ## READY1 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1389       96       17     0.99     3.01   0.9286     1.50 
    ##      .10      .25      .50      .75      .90      .95 
    ##     1.75     2.50     3.00     3.75     4.00     4.00 
    ## 
    ## 1 (36, 0.026), 1.25 (33, 0.024), 1.5 (33, 0.024), 1.75 (45,
    ## 0.032), 2 (66, 0.048), 2.25 (78, 0.056), 2.5 (108, 0.078),
    ## 2.75 (141, 0.102), 3 (177, 0.127), 3.25 (204, 0.147), 3.5
    ## (105, 0.076), 3.75 (117, 0.084), 4 (183, 0.132), 4.25 (36,
    ## 0.026), 4.5 (18, 0.013), 4.75 (6, 0.004), 5 (3, 0.002)
    ## ---------------------------------------------------------------
    ## JOBSAT2 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1395       90       13    0.978    3.246    1.041    1.333 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.000    2.667    3.333    4.000    4.000    4.667 
    ## 
    ## 1 (51, 0.037), 1.333333 (30, 0.022), 1.666667 (54, 0.039), 2
    ## (75, 0.054), 2.333333 (99, 0.071), 2.666667 (84, 0.060), 3
    ## (174, 0.125), 3.333333 (177, 0.127), 3.666667 (168, 0.120), 4
    ## (348, 0.249), 4.333333 (63, 0.045), 4.666667 (33, 0.024), 5
    ## (39, 0.028)
    ## ---------------------------------------------------------------
    ## COMMIT2 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1416       69       13    0.981    3.468   0.9529    1.667 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.333    3.000    3.667    4.000    4.667    5.000 
    ## 
    ## 1 (39, 0.028), 1.333333 (18, 0.013), 1.666667 (30, 0.021), 2
    ## (18, 0.013), 2.333333 (57, 0.040), 2.666667 (93, 0.066), 3
    ## (207, 0.146), 3.333333 (213, 0.150), 3.666667 (207, 0.146), 4
    ## (291, 0.206), 4.333333 (96, 0.068), 4.666667 (75, 0.053), 5
    ## (72, 0.051)
    ## ---------------------------------------------------------------
    ## READY2 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1398       87       17    0.989    3.109   0.9311     1.50 
    ##      .10      .25      .50      .75      .90      .95 
    ##     2.00     2.50     3.25     3.75     4.00     4.25 
    ## 
    ## 1 (24, 0.017), 1.25 (30, 0.021), 1.5 (30, 0.021), 1.75 (39,
    ## 0.028), 2 (69, 0.049), 2.25 (75, 0.054), 2.5 (105, 0.075),
    ## 2.75 (75, 0.054), 3 (216, 0.155), 3.25 (162, 0.116), 3.5 (162,
    ## 0.116), 3.75 (162, 0.116), 4 (156, 0.112), 4.25 (39, 0.028),
    ## 4.5 (18, 0.013), 4.75 (15, 0.011), 5 (21, 0.015)
    ## ---------------------------------------------------------------
    ## JOBSAT3 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1389       96       13    0.972    3.338    0.941    1.667 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.000    3.000    3.333    4.000    4.333    4.667 
    ## 
    ## 1 (24, 0.017), 1.333333 (33, 0.024), 1.666667 (21, 0.015), 2
    ## (72, 0.052), 2.333333 (72, 0.052), 2.666667 (69, 0.050), 3
    ## (279, 0.201), 3.333333 (183, 0.132), 3.666667 (138, 0.099), 4
    ## (351, 0.253), 4.333333 (60, 0.043), 4.666667 (42, 0.030), 5
    ## (45, 0.032)
    ## ---------------------------------------------------------------
    ## COMMIT3 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1401       84       13    0.974    3.537   0.8182    2.000 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.667    3.000    3.667    4.000    4.333    4.667 
    ## 
    ## 1 (9, 0.006), 1.333333 (9, 0.006), 1.666667 (21, 0.015), 2
    ## (33, 0.024), 2.333333 (42, 0.030), 2.666667 (54, 0.039), 3
    ## (261, 0.186), 3.333333 (204, 0.146), 3.666667 (234, 0.167), 4
    ## (315, 0.225), 4.333333 (102, 0.073), 4.666667 (48, 0.034), 5
    ## (69, 0.049)
    ## ---------------------------------------------------------------
    ## READY3 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1380      105       17    0.986    3.212   0.8964     1.50 
    ##      .10      .25      .50      .75      .90      .95 
    ##     2.00     2.75     3.25     3.75     4.00     4.25 
    ## 
    ## 1 (12, 0.009), 1.25 (24, 0.017), 1.5 (42, 0.030), 1.75 (36,
    ## 0.026), 2 (36, 0.026), 2.25 (39, 0.028), 2.5 (87, 0.063), 2.75
    ## (102, 0.074), 3 (237, 0.172), 3.25 (144, 0.104), 3.5 (168,
    ## 0.122), 3.75 (114, 0.083), 4 (231, 0.167), 4.25 (48, 0.035),
    ## 4.5 (21, 0.015), 4.75 (21, 0.015), 5 (18, 0.013)
    ## ---------------------------------------------------------------
    ## JSAT 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1396       89       13    0.978    3.273    1.032    1.333 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.000    2.667    3.333    4.000    4.333    4.667 
    ## 
    ## 1 (41, 0.029), 1.333333 (34, 0.024), 1.666667 (46, 0.033), 2
    ## (81, 0.058), 2.333333 (83, 0.059), 2.666667 (85, 0.061), 3
    ## (211, 0.151), 3.333333 (172, 0.123), 3.666667 (149, 0.107), 4
    ## (338, 0.242), 4.333333 (70, 0.050), 4.666667 (43, 0.031), 5
    ## (43, 0.031)
    ## ---------------------------------------------------------------
    ## COMMIT 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1406       79       13    0.979     3.54   0.9079    2.000 
    ##      .10      .25      .50      .75      .90      .95 
    ##    2.667    3.000    3.667    4.000    4.667    5.000 
    ## 
    ## 1 (20, 0.014), 1.333333 (12, 0.009), 1.666667 (24, 0.017), 2
    ## (32, 0.023), 2.333333 (52, 0.037), 2.666667 (74, 0.053), 3
    ## (211, 0.150), 3.333333 (202, 0.144), 3.666667 (221, 0.157), 4
    ## (296, 0.211), 4.333333 (100, 0.071), 4.666667 (75, 0.053), 5
    ## (87, 0.062)
    ## ---------------------------------------------------------------
    ## READY 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1389       96       17    0.989     3.11    0.924     1.50 
    ##      .10      .25      .50      .75      .90      .95 
    ##     2.00     2.50     3.25     3.75     4.00     4.25 
    ## 
    ## 1 (24, 0.017), 1.25 (29, 0.021), 1.5 (35, 0.025), 1.75 (40,
    ## 0.029), 2 (57, 0.041), 2.25 (64, 0.046), 2.5 (100, 0.072),
    ## 2.75 (106, 0.076), 3 (210, 0.151), 3.25 (170, 0.122), 3.5
    ## (145, 0.104), 3.75 (131, 0.094), 4 (190, 0.137), 4.25 (41,
    ## 0.030), 4.5 (19, 0.014), 4.75 (14, 0.010), 5 (14, 0.010)
    ## ---------------------------------------------------------------
    ## GENDER2 
    ##        n  missing distinct 
    ##     1383      102        2 
    ##                         
    ## Value        male female
    ## Frequency    1338     45
    ## Proportion  0.967  0.033
    ## ---------------------------------------------------------------
    ## GENDER3 
    ##        n  missing distinct     Info      Sum     Mean      Gmd 
    ##     1383      102        2    0.094       45  0.03254    0.063 
    ## 
    ## ---------------------------------------------------------------
    ## LEAVE 
    ##        n  missing distinct     Info     Mean      Gmd      .05 
    ##     1406       79       13    0.979     2.46   0.9079    1.000 
    ##      .10      .25      .50      .75      .90      .95 
    ##    1.333    2.000    2.333    3.000    3.333    4.000 
    ## 
    ## 1 (87, 0.062), 1.333333 (75, 0.053), 1.666667 (100, 0.071), 2
    ## (296, 0.211), 2.333333 (221, 0.157), 2.666667 (202, 0.144), 3
    ## (211, 0.150), 3.333333 (74, 0.053), 3.666667 (52, 0.037), 4
    ## (32, 0.023), 4.333333 (24, 0.017), 4.666667 (12, 0.009), 5
    ## (20, 0.014)
    ## ---------------------------------------------------------------

### Alternative: psych

``` r
detach("package:Hmisc")
install.packages("psych")
library(psych)
```

``` r
psych::describe(dd4,na.rm=T)
```

    ##          vars    n    mean      sd  median trimmed     mad min
    ## SUBNUM      1 1485  248.00  142.94  248.00  248.00  183.84   1
    ## TIME        2 1485    1.00    0.82    1.00    1.00    1.48   0
    ## BTN         3 1485 1818.73 1403.35 1022.00 1767.29 1509.29   4
    ## COMPANY*    4 1485    3.26    2.10    2.00    3.12    1.48   1
    ## STATUS      5 1473    1.73    0.80    2.00    1.61    0.00   1
    ## GENDER      6 1383    1.03    0.18    1.00    1.00    0.00   1
    ## TENURE      7 1461    2.40    1.56    2.00    2.38    1.48   0
    ## RANK        8 1410   15.04    3.02   14.00   14.51    1.48  11
    ## EDUCATE     9 1473    2.59    1.09    2.00    2.37    0.00   1
    ## AGE        10 1473   25.72    6.12   24.00   25.01    5.93  18
    ## JOBSAT1    11 1404    3.24    0.98    3.33    3.29    0.99   1
    ## COMMIT1    12 1401    3.62    0.85    3.67    3.66    0.99   1
    ## READY1     13 1389    3.01    0.83    3.00    3.07    0.74   1
    ## JOBSAT2    14 1395    3.25    0.94    3.33    3.31    0.99   1
    ## COMMIT2    15 1416    3.47    0.87    3.67    3.52    0.49   1
    ## READY2     16 1398    3.11    0.83    3.25    3.15    0.74   1
    ## JOBSAT3    17 1389    3.34    0.85    3.33    3.39    0.99   1
    ## COMMIT3    18 1401    3.54    0.75    3.67    3.57    0.49   1
    ## READY3     19 1380    3.21    0.81    3.25    3.27    0.74   1
    ## JSAT       20 1396    3.27    0.93    3.33    3.33    0.99   1
    ## COMMIT     21 1406    3.54    0.83    3.67    3.58    0.49   1
    ## READY      22 1389    3.11    0.83    3.25    3.16    0.74   1
    ## GENDER2*   23 1383    1.03    0.18    1.00    1.00    0.00   1
    ## GENDER3    24 1383    0.03    0.18    0.00    0.00    0.00   0
    ## LEAVE      25 1406    2.46    0.83    2.33    2.42    0.49   1
    ##           max range  skew kurtosis    se
    ## SUBNUM    495   494  0.00    -1.20  3.71
    ## TIME        2     2  0.00    -1.50  0.02
    ## BTN      4042  4038  0.20    -1.48 36.42
    ## COMPANY*    8     7  0.52    -1.11  0.05
    ## STATUS      5     4  1.67     3.97  0.02
    ## GENDER      2     1  5.26    25.73  0.00
    ## TENURE      5     5  0.19    -0.85  0.04
    ## RANK       32    21  1.84     4.18  0.08
    ## EDUCATE     6     5  1.50     0.75  0.03
    ## AGE        46    28  0.92     0.16  0.16
    ## JOBSAT1     5     4 -0.47    -0.50  0.03
    ## COMMIT1     5     4 -0.48     0.14  0.02
    ## READY1      5     4 -0.47    -0.26  0.02
    ## JOBSAT2     5     4 -0.60    -0.23  0.03
    ## COMMIT2     5     4 -0.69     0.64  0.02
    ## READY2      5     4 -0.41    -0.09  0.02
    ## JOBSAT3     5     4 -0.55     0.16  0.02
    ## COMMIT3     5     4 -0.48     0.69  0.02
    ## READY3      5     4 -0.50     0.09  0.02
    ## JSAT        5     4 -0.55    -0.20  0.02
    ## COMMIT      5     4 -0.57     0.56  0.02
    ## READY       5     4 -0.46    -0.09  0.02
    ## GENDER2*    2     1  5.26    25.73  0.00
    ## GENDER3     1     1  5.26    25.73  0.00
    ## LEAVE       5     4  0.57     0.56  0.02

``` r
psych::describe(dd4,na.rm=F)
```

    ##          vars    n    mean      sd  median trimmed     mad min
    ## SUBNUM      1 1032  249.52  143.06  248.50  250.14  182.36   1
    ## TIME        2 1032    1.00    0.82    1.00    1.00    1.48   0
    ## BTN         3 1032 1805.08 1400.20 1022.00 1750.15 1509.29   4
    ## COMPANY*    4 1032    3.29    2.08    2.50    3.16    2.22   1
    ## STATUS      5 1032    1.75    0.81    2.00    1.63    0.00   1
    ## GENDER      6 1032    1.03    0.16    1.00    1.00    0.00   1
    ## TENURE      7 1032    2.42    1.58    2.00    2.41    1.48   0
    ## RANK        8 1032   15.14    3.18   14.00   14.61    1.48  11
    ## EDUCATE     9 1032    2.65    1.13    2.00    2.44    0.00   1
    ## AGE        10 1032   25.68    6.03   24.00   24.99    5.93  18
    ## JOBSAT1    11 1032    3.20    0.99    3.33    3.26    0.99   1
    ## COMMIT1    12 1032    3.63    0.84    3.67    3.66    0.99   1
    ## READY1     13 1032    3.02    0.79    3.00    3.08    0.74   1
    ## JOBSAT2    14 1032    3.23    0.93    3.33    3.29    0.99   1
    ## COMMIT2    15 1032    3.47    0.86    3.67    3.53    0.49   1
    ## READY2     16 1032    3.13    0.83    3.25    3.18    0.74   1
    ## JOBSAT3    17 1032    3.28    0.87    3.33    3.34    0.99   1
    ## COMMIT3    18 1032    3.52    0.76    3.67    3.54    0.49   1
    ## READY3     19 1032    3.21    0.81    3.25    3.26    0.74   1
    ## JSAT       20 1032    3.24    0.93    3.33    3.30    0.99   1
    ## COMMIT     21 1032    3.54    0.82    3.67    3.58    0.49   1
    ## READY      22 1032    3.12    0.81    3.25    3.17    0.74   1
    ## GENDER2*   23 1032    1.03    0.16    1.00    1.00    0.00   1
    ## GENDER3    24 1032    0.03    0.16    0.00    0.00    0.00   0
    ## LEAVE      25 1032    2.46    0.82    2.33    2.42    0.49   1
    ##           max range  skew kurtosis    se
    ## SUBNUM    495   494 -0.04    -1.18  4.45
    ## TIME        2     2  0.00    -1.50  0.03
    ## BTN      4042  4038  0.24    -1.47 43.59
    ## COMPANY*    8     7  0.49    -1.17  0.06
    ## STATUS      5     4  1.71     4.12  0.03
    ## GENDER      2     1  5.93    33.18  0.00
    ## TENURE      5     5  0.17    -0.90  0.05
    ## RANK       32    21  1.83     4.08  0.10
    ## EDUCATE     6     5  1.33     0.21  0.04
    ## AGE        45    27  0.91     0.17  0.19
    ## JOBSAT1     5     4 -0.46    -0.61  0.03
    ## COMMIT1     5     4 -0.42     0.05  0.03
    ## READY1      5     4 -0.47    -0.08  0.02
    ## JOBSAT2     5     4 -0.55    -0.39  0.03
    ## COMMIT2     5     4 -0.68     0.68  0.03
    ## READY2      5     4 -0.41    -0.18  0.03
    ## JOBSAT3     5     4 -0.54     0.06  0.03
    ## COMMIT3     5     4 -0.46     0.70  0.02
    ## READY3      5     4 -0.47     0.19  0.03
    ## JSAT        5     4 -0.52    -0.33  0.03
    ## COMMIT      5     4 -0.52     0.52  0.03
    ## READY       5     4 -0.44    -0.03  0.03
    ## GENDER2*    2     1  5.93    33.18  0.00
    ## GENDER3     1     1  5.93    33.18  0.00
    ## LEAVE       5     4  0.52     0.52  0.03

``` r
psych::describe(na.omit(dd4))
```

    ##          vars    n    mean      sd  median trimmed     mad min
    ## SUBNUM      1 1032  249.52  143.06  248.50  250.14  182.36   1
    ## TIME        2 1032    1.00    0.82    1.00    1.00    1.48   0
    ## BTN         3 1032 1805.08 1400.20 1022.00 1750.15 1509.29   4
    ## COMPANY*    4 1032    3.29    2.08    2.50    3.16    2.22   1
    ## STATUS      5 1032    1.75    0.81    2.00    1.63    0.00   1
    ## GENDER      6 1032    1.03    0.16    1.00    1.00    0.00   1
    ## TENURE      7 1032    2.42    1.58    2.00    2.41    1.48   0
    ## RANK        8 1032   15.14    3.18   14.00   14.61    1.48  11
    ## EDUCATE     9 1032    2.65    1.13    2.00    2.44    0.00   1
    ## AGE        10 1032   25.68    6.03   24.00   24.99    5.93  18
    ## JOBSAT1    11 1032    3.20    0.99    3.33    3.26    0.99   1
    ## COMMIT1    12 1032    3.63    0.84    3.67    3.66    0.99   1
    ## READY1     13 1032    3.02    0.79    3.00    3.08    0.74   1
    ## JOBSAT2    14 1032    3.23    0.93    3.33    3.29    0.99   1
    ## COMMIT2    15 1032    3.47    0.86    3.67    3.53    0.49   1
    ## READY2     16 1032    3.13    0.83    3.25    3.18    0.74   1
    ## JOBSAT3    17 1032    3.28    0.87    3.33    3.34    0.99   1
    ## COMMIT3    18 1032    3.52    0.76    3.67    3.54    0.49   1
    ## READY3     19 1032    3.21    0.81    3.25    3.26    0.74   1
    ## JSAT       20 1032    3.24    0.93    3.33    3.30    0.99   1
    ## COMMIT     21 1032    3.54    0.82    3.67    3.58    0.49   1
    ## READY      22 1032    3.12    0.81    3.25    3.17    0.74   1
    ## GENDER2*   23 1032    1.03    0.16    1.00    1.00    0.00   1
    ## GENDER3    24 1032    0.03    0.16    0.00    0.00    0.00   0
    ## LEAVE      25 1032    2.46    0.82    2.33    2.42    0.49   1
    ##           max range  skew kurtosis    se
    ## SUBNUM    495   494 -0.04    -1.18  4.45
    ## TIME        2     2  0.00    -1.50  0.03
    ## BTN      4042  4038  0.24    -1.47 43.59
    ## COMPANY*    8     7  0.49    -1.17  0.06
    ## STATUS      5     4  1.71     4.12  0.03
    ## GENDER      2     1  5.93    33.18  0.00
    ## TENURE      5     5  0.17    -0.90  0.05
    ## RANK       32    21  1.83     4.08  0.10
    ## EDUCATE     6     5  1.33     0.21  0.04
    ## AGE        45    27  0.91     0.17  0.19
    ## JOBSAT1     5     4 -0.46    -0.61  0.03
    ## COMMIT1     5     4 -0.42     0.05  0.03
    ## READY1      5     4 -0.47    -0.08  0.02
    ## JOBSAT2     5     4 -0.55    -0.39  0.03
    ## COMMIT2     5     4 -0.68     0.68  0.03
    ## READY2      5     4 -0.41    -0.18  0.03
    ## JOBSAT3     5     4 -0.54     0.06  0.03
    ## COMMIT3     5     4 -0.46     0.70  0.02
    ## READY3      5     4 -0.47     0.19  0.03
    ## JSAT        5     4 -0.52    -0.33  0.03
    ## COMMIT      5     4 -0.52     0.52  0.03
    ## READY       5     4 -0.44    -0.03  0.03
    ## GENDER2*    2     1  5.93    33.18  0.00
    ## GENDER3     1     1  5.93    33.18  0.00
    ## LEAVE       5     4  0.52     0.52  0.03

### Simple Distributions

``` r
#Frequency Counts
table(dd4$COMPANY)
```

    ## 
    ##   A   B   C   D   F HHC REC SVC 
    ## 402 348 126 183  15 354  18  39

``` r
#Proportions
prop.table(table(dd4$COMPANY))
```

    ## 
    ##          A          B          C          D          F 
    ## 0.27070707 0.23434343 0.08484848 0.12323232 0.01010101 
    ##        HHC        REC        SVC 
    ## 0.23838384 0.01212121 0.02626263

``` r
#Rounding proportions to 3 decimals
round(prop.table(table(dd4$COMPANY)),3)
```

    ## 
    ##     A     B     C     D     F   HHC   REC   SVC 
    ## 0.271 0.234 0.085 0.123 0.010 0.238 0.012 0.026

``` r
#Percentages
100*(prop.table(table(dd4$COMPANY)))
```

    ## 
    ##         A         B         C         D         F       HHC 
    ## 27.070707 23.434343  8.484848 12.323232  1.010101 23.838384 
    ##       REC       SVC 
    ##  1.212121  2.626263

------------------------------------------------------------------------

``` r
#Cross Tabs & Simple Tables
#install.packages("gmodels")
library(gmodels)
CrossTable(dd4$GENDER,dd4$COMPANY,chisq=TRUE,format="SPSS")
```

    ## Warning in chisq.test(t, correct = FALSE, ...): Chi-squared
    ## approximation may be incorrect

    ## 
    ##    Cell Contents
    ## |-------------------------|
    ## |                   Count |
    ## | Chi-square contribution |
    ## |             Row Percent |
    ## |          Column Percent |
    ## |           Total Percent |
    ## |-------------------------|
    ## 
    ## Total Observations in Table:  1383 
    ## 
    ##              | dd4$COMPANY 
    ##   dd4$GENDER |        A  |        B  |        C  |        D  |        F  |      HHC  |      REC  |      SVC  | Row Total | 
    ## -------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
    ##            1 |      357  |      321  |      111  |      165  |        9  |      321  |       18  |       36  |     1338  | 
    ##              |    0.023  |    0.181  |    0.042  |    0.037  |    0.010  |    0.148  |    0.020  |    0.039  |           | 
    ##              |   26.682% |   23.991% |    8.296% |   12.332% |    0.673% |   23.991% |    1.345% |    2.691% |   96.746% | 
    ##              |   95.968% |   99.074% |   94.872% |   98.214% |  100.000% |   94.690% |  100.000% |  100.000% |           | 
    ##              |   25.813% |   23.210% |    8.026% |   11.931% |    0.651% |   23.210% |    1.302% |    2.603% |           | 
    ## -------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
    ##            2 |       15  |        3  |        6  |        3  |        0  |       18  |        0  |        0  |       45  | 
    ##              |    0.693  |    5.396  |    1.263  |    1.113  |    0.293  |    4.404  |    0.586  |    1.171  |           | 
    ##              |   33.333% |    6.667% |   13.333% |    6.667% |    0.000% |   40.000% |    0.000% |    0.000% |    3.254% | 
    ##              |    4.032% |    0.926% |    5.128% |    1.786% |    0.000% |    5.310% |    0.000% |    0.000% |           | 
    ##              |    1.085% |    0.217% |    0.434% |    0.217% |    0.000% |    1.302% |    0.000% |    0.000% |           | 
    ## -------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
    ## Column Total |      372  |      324  |      117  |      168  |        9  |      339  |       18  |       36  |     1383  | 
    ##              |   26.898% |   23.427% |    8.460% |   12.148% |    0.651% |   24.512% |    1.302% |    2.603% |           | 
    ## -------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
    ## 
    ##  
    ## Statistics for All Table Factors
    ## 
    ## 
    ## Pearson's Chi-squared test 
    ## ------------------------------------------------------------
    ## Chi^2 =  15.42045     d.f. =  7     p =  0.03097201 
    ## 
    ## 
    ##  
    ##        Minimum expected frequency: 0.2928416 
    ## Cells with Expected Frequency < 5: 4 of 16 (25%)

``` r
table(dd4$GENDER,dd4$COMPANY)
```

    ##    
    ##       A   B   C   D   F HHC REC SVC
    ##   1 357 321 111 165   9 321  18  36
    ##   2  15   3   6   3   0  18   0   0

``` r
prop.table(table(dd4$GENDER,dd4$COMPANY))
```

    ##    
    ##               A           B           C           D
    ##   1 0.258134490 0.232104121 0.080260304 0.119305857
    ##   2 0.010845987 0.002169197 0.004338395 0.002169197
    ##    
    ##               F         HHC         REC         SVC
    ##   1 0.006507592 0.232104121 0.013015184 0.026030369
    ##   2 0.000000000 0.013015184 0.000000000 0.000000000

``` r
#Histograms
hist(dd4$JSAT)
```

![](R-Workshop-James_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-40-1.png)

``` r
hist(dd4$JSAT, main="Job Satisfaction Histogram",xlab="Job Satisfaction" )
```

![](R-Workshop-James_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-41-1.png)

### Correlations using cor (part of stats) or rcorr (part of Hmisc)

``` r
cor(dd4[,20:22],use="complete.obs")
```

    ##             JSAT    COMMIT     READY
    ## JSAT   1.0000000 0.5373179 0.5093204
    ## COMMIT 0.5373179 1.0000000 0.4610560
    ## READY  0.5093204 0.4610560 1.0000000

``` r
install.packages("Hmisc")
library(Hmisc)
```

``` r
Hmisc::rcorr(as.matrix(dd4[,c(20:22)]))
```

    ##        JSAT COMMIT READY
    ## JSAT   1.00   0.54  0.51
    ## COMMIT 0.54   1.00  0.46
    ## READY  0.51   0.46  1.00
    ## 
    ## n
    ##        JSAT COMMIT READY
    ## JSAT   1396   1385  1369
    ## COMMIT 1385   1406  1375
    ## READY  1369   1375  1389
    ## 
    ## P
    ##        JSAT COMMIT READY
    ## JSAT         0      0   
    ## COMMIT  0           0   
    ## READY   0    0

Popular Packages
----------------

### [multilevel](https://cran.r-project.org/web/packages/multilevel/multilevel.pdf)

### [lme4](https://cran.r-project.org/web/packages/lme4/lme4.pdf) & [nlme](https://cran.r-project.org/web/packages/nlme/nlme.pdf)

### [plyr](https://cran.r-project.org/web/packages/plyr/plyr.pdf)

### [ggplot2](http://ggplot2.org/)

### [reshape2](https://cran.r-project.org/web/packages/reshape2/reshape2.pdf)

### [Rcmdr](https://cran.r-project.org/web/packages/Rcmdr/Rcmdr.pdf)

### [Hmisc](https://cran.r-project.org/web/packages/Hmisc/Hmisc.pdf)
