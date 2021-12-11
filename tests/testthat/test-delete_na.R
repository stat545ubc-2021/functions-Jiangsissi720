test_that("example works as specified", {
  y <- list(c(1:3), NA, c(1, NA), list(c(5:6, NA), NA, "A"))
  tmp1 <- delete_na(y, recursive = FALSE)
  res1 <- list(c(1:3), c(1, NA), list(c(5:6, NA), NA, "A"))
  expect_equal(tmp1, res1)

  tmp2 <- delete_na(y, recursive = TRUE)
  res2 <- list(c(1:3), c(1), list(c(5:6), "A"))
  expect_equal(tmp2, res2)
})
