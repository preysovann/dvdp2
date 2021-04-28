---
title: "User Guide"
author: "Sovann Prey"
date: "4/28/2021"
output: html_document
---



# Application User Guide

## App Overview and Function
The app will visualize the World's GDP vs. Life Expentance for all the countries in different years using the Gapminder datasets.

The app has been developed using Shiny application from RStudio. The source code of the application can be found here.

The applicaton allows the users to:

- Plot the data in a scatter plot (GDP vs. Life Expectancy)
- Create a set of parameters, such as year and continent, for data visualization.
- Customize data visualization.
- Generate a table for the data
- Download the data

## Application Interface
The web app contains two sections: configuration and visualization part.

- **Configuration**: allows the users to filter the data and configure visualization of the data.
- **Visualization**: allows the users to see the (filtered) data being visualized in the form of graph/plot and table.

## Application Interface Details
<img src="myLittleShinyApp Interface.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="90%" />

Source code of the webapp can be found [here](https://github.com/preysovann/dvdp2/tree/master/myLittleShinyApp).

## Gapminder Datasets
The application is based on the [Gapminder](https://cran.r-project.org/web/packages/gapminder/README.html) datasets.


```r
library(gapminder)
str(gapminder)
```

```
## tibble [1,704 x 6] (S3: tbl_df/tbl/data.frame)
##  $ country  : Factor w/ 142 levels "Afghanistan",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ continent: Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
##  $ year     : int [1:1704] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 ...
##  $ lifeExp  : num [1:1704] 28.8 30.3 32 34 36.1 ...
##  $ pop      : int [1:1704] 8425333 9240934 10267083 11537966 13079460 14880372 12881816 13867957 16317921 22227415 ...
##  $ gdpPercap: num [1:1704] 779 821 853 836 740 ...
```
