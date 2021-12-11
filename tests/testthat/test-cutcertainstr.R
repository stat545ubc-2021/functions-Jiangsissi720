test_that("examples with correct length", {
  x <- "Hello world, this is a test sequence."

  # multiple splits
  tmp1 <- cutcertainstr(x, split = "[, ]", char = 10, newlines = FALSE)
  res1 <- c("Hello ", "world, ", "this is a ", "test ", "sequence.")
  expect_equal(tmp1, res1)

  # newlines
  tmp2 <- cutcertainstr(x, split = ",", char = 30, newlines = TRUE)
  res2 <- c("Hello world,\n this is a test sequence.")
  expect_equal(tmp2, res2)

})
