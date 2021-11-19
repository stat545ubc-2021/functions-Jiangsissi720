#' @title The improvement of `strsplit`
#'
#' @description This functions uses `strsplit` and adds the possibility to split
#'  and keep the delimiter after or before the given split. Or it can split
#'  between two given splits and keep both.
#'
#' @param x character vector, each element of which is to be split. Other
#'   inputs, including a factor, will give an error.
#' @param split character vector (or object which can be coerced to such)
#'   containing regular expression(s) to use for splitting. If empty matches
#'   occur, in particular if `split` has length 0, `x` is split into single
#'   characters. If `split` has length greater than 1, it is recycled along `x`.
#' @param type a character. Either to `remove` or keep the delimiter
#'   `before`, `between `or `remove` the split.
#' @param perl logical.
#' @param ... other inputs passed along to `strsplit`.
#'
#' @return A list of the same length as `x`, the i-th element of which contains
#'   the vector
#'
#' @examples
#' x <- c("3D/MON&SUN")
#' StrSplitP(x, "", type = "before")
#' x <- c("3D/MON&SUN")
#` StrSplitP(x, "S", type = "DK")
#`
#' @export
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
