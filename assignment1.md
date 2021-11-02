Assignment1
================

## Exercise 1: Make a Function

This function aims to implement the function of `strsplit()` without
using this wrapper function and adds the possibility to split and keep
the delimiter after or before the given split, or it can help to split
between two given splits and keep both.

Input Arguments:

-   `x`: character vector, each element of which is to be split. Other
    inputs, including a factor, will give an error.
    -   *Justification*: This is the main argument, a `str` to be
        processed by this function.
-   `split`: character vector (or object which can be coerced to such)
    containing regular expression(s) to use for splitting. If empty
    matches occur, in particular if `split` has length 0, `x` is split
    into single characters. If `split` has length greater than 1, it is
    recycled along `x`.
    -   *Justification*: This is the delimiter.
-   `type`: charachter. Either to `remove` or keep the delimiter
    `before`, `between` or `remove` the split.
    -   *Justification*: This is a new feature to determine what kind of
        function will be realized.
-   `perl`: logical. Should Perl-compatible regexps be used? Is `TRUE`
    for all but `remove`.
    -   *Justification*: This is a new feature to determine what kind of
        function will be realized.  
-   `...`: other inputs passed along to `strsplit`.
    -   *Justification*: There can also be a parameter to determine
        whether to match byte-by-byte and the default value is false
        (matching character-by-character).

Output: Return a list of the same length as `x`, the i-th element of
which contains the vector of splits of `x[i]`. The list can show the
result of `character` split.

``` r
StrSplitP <- function(x,
                     split,
                     type = "remove",
                     perl = FALSE,
                     ...) {
  
  if (!type %in% c("remove", "before", "after", "between")) {
    stop("type must be remove, after, before or between!")
  }

  if (type == "between" & length(split) != 2) {
    stop("split need no have length two!")
  }
  if (length(split) != 1 & type != "between") {
    split <- split[1]
    warning("there are multiple splits - taking only the first one")
  }

  if (type == "remove") {
    out <- base::strsplit(x = x, split = split, perl = perl, ...)
  } else if (type == "before") {
    out <- base::strsplit(x = x,
                          split = paste0("(?<=.)(?=", split, ")"),
                          perl = TRUE,
                          ...)
  } else if (type == "after") {
    out <- base::strsplit(x = x,
                          split = paste0("(?<=", split, ")"),
                          perl = TRUE,
                          ...)
  } else if (type == "between") {
    out <- base::strsplit(
      x = x,
      split = paste0("(?<=", paste0(split, collapse = ""), ")"),
      perl = TRUE,
      ...)

    index <- lapply(out, endsWith, suffix = paste0(split, collapse = ""))
    index <- lapply(index, function(i) which(i == TRUE) + 1)

    out <- lapply(out, function(i) gsub(paste0(split, collapse = ""),
                                        split[1], i))

    out <- mapply(FUN = function(o, i) {
      o[i] <- paste0(split[2], o[i])
      return(o)
      },
      out, index,
      SIMPLIFY = FALSE)
  }

  return(out)
}
```

## Exercise 2: Document your Function

``` r
# Split the data
# @param data and the data source to be handled
# @param use the function of StrSplitP to split the data into the pattern you want
# @return the output result

# @examples
# str
# StrSplitP(spitstr, delimiter, type)

# export
# @md
```

## Exercise 3: Include examples

This `StrSplitP()` function is implemented as follows. Useful error
messages are provided by `stop()` for new parameter `type`, because it
should be in four certain types.

Three non-redundant inputs are provided to demonstrate its function:

-   `x <- c("3D/MON&SUN")` `strsplit(x, "[/&]", type = "before")`
    -   This function can split `x` by the two `split` and preserve them
        before the separated parts.

``` r
x <- c("3D/MON&SUN")
StrSplitP(x, "[/&]", type = "before")
```

    ## [[1]]
    ## [1] "3D"   "/MON" "&SUN"

-   `x <- c("3D/MON&SUN")` `strsplit(x, "", type = "before")`
    -   This function will be split to single characters if the length
        of `split` is 0.

``` r
x <- c("3D/MON&SUN")
StrSplitP(x, "", type = "before")
```

    ## [[1]]
    ##  [1] "3" "D" "/" "M" "O" "N" "&" "S" "U" "N"

-   `x <- c("3D/MON&SUN")` `strsplit(x, "S", type = "DK")`
    -   This function will give an error message if the type is not the
        four certain types.

``` r
x <- c("3D/MON&SUN")
StrSplitP(x, "S", type = "DK")
```

    ## Error in StrSplitP(x, "S", type = "DK"): type must be remove, after, before or between!

## Exercise 4: Test the Function

`testthat` package should be installed to test this function with three
inputs.

``` r
library(testthat)

x <- c("3D/MON&SUN2D/MON&SUN")
test_that('Strsplit test!', {
  expect_error(StrSplitP(StrSplitP(x, "S", type = "WILLBEERROR")))
  expect_equal(StrSplitP(x, "/", type = "remove"), list(c("3D","MON&SUN2D","MON&SUN")))
  expect_equal(StrSplitP(x,""),list(c("3", "D", "/", "M", "O", "N", "&", "S", "U", "N","2", "D", "/", "M", "O", "N", "&", "S", "U", "N")))
})
```

    ## Test passed