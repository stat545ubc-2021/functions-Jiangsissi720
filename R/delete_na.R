#' @title Remove NA from list
#'
#' @description
#'    This functions removes `NA` from a list. With `recursive = TRUE`,
#'     `NA` within each list's elements are removed as well.
#'
#' @param y a list
#' @param recursive logical. If `TRUE`, `NA` within the list's
#'  elements are removed too.
#'
#' @return Returns the list without `NA`.
#' @export
#'
#' @examples
#' y <- list(c(1:3), letters[1:4], NA, c(1, NA), list(c(5:6, NA), NA, "A"))
#' delete_na(y, recursive = TRUE)
#'
#' # [[1]]
#' # [1] 1 2 3
#' #
#' # [[2]]
#' # [1] "a" "b" "c" "d"
#' #
#' # [[3]]
#' # [1] 1
#' #
#' # [[4]]
#' # [[4]][[1]]
#' # [1] 5 6
#' #
#' # [[4]][[2]]
#' # [1] "A"

delete_na <- function(y = list(),
                        recursive = FALSE) {

  if (recursive && anyNA(y, recursive = TRUE)) {
    y <- y[!sapply(y, function(x) all(is.na(x)))]
    y <- sapply(y, delete_na, recursive = TRUE, simplify = TRUE)
  } else {
    y <- y[!sapply(y, function(x) all(is.na(x)), simplify = TRUE)]
  }
  return(y)
}
