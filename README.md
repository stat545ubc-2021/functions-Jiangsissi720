
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StrSplitP

<!-- badges: start -->
<!-- badges: end -->

Welcome to my first package. The goal of StrSplitP is to add some new
features to existing `strsplit` function, so it is a plus version of
`strsplit`, which can process strings.

## Installation

You can install the released version of StrSplitP with:

``` r
install.packages("devtools")
devtools::install_github("stat545ubc-2021/functions-Jiangsissi720")
```

## Function lists

`strsplit`: Keep the delimiter after, before or between a given split.

`delete_na`: Remove missing value of a string.

`cutcertainstr`: Reduce and cut a given string into parts with a fixed
length.

Warning: `cutcertainstr` relies on `strsplit` and `delete_na`. Don’t
download it separately.

## Assignment B-4 New update for version 0.1.1

In this version 0.1.1, two new functions for string processing are added
to realize more functions.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(StrSplitP)
x <- c("3D/MON&SUN")
StrSplitP(x, "", type = "before")
#> [[1]]
#>  [1] "3" "D" "/" "M" "O" "N" "&" "S" "U" "N"
```
