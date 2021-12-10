
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StrSplitP

<!-- badges: start -->
<!-- badges: end -->

The goal of StrSplitP is to add some new features to existing `strsplit`
function.

## Installation

You can install the released version of StrSplitP with:

``` r
install.packages("StrSplitP")
devtools::install_github("stat545ubc-2021/functions-Jiangsissi720")
```
## New adds

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(StrSplitP)
x <- c("3D/MON&SUN")
StrSplitP(x, "", type = "before")
#> [[1]]
#>  [1] "3" "D" "/" "M" "O" "N" "&" "S" "U" "N"
```
