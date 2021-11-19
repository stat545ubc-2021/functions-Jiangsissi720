
<!-- README.md is generated from README.Rmd. Please edit that file -->

# StrSplitP

<!-- badges: start -->
<!-- badges: end -->

The goal of StrSplitP is to add some new features to existing `strsplit`
function.

## Installation

You can install the released version of StrSplitP from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("StrSplitP")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(StrSplitP)
x <- c("3D/MON&SUN")
StrSplitP(x, "", type = "before")
#> [[1]]
#>  [1] "3" "D" "/" "M" "O" "N" "&" "S" "U" "N"
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
