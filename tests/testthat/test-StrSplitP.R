x <- c("3D/MON&SUN2D/MON&SUN")
test_that('Strsplit test!', {
  expect_error(StrSplitP(StrSplitP(x, "S", type = "WILLBEERROR")))
  expect_equal(StrSplitP(x, "/", type = "remove"), list(c("3D","MON&SUN2D","MON&SUN")))
  expect_equal(StrSplitP(x,""),list(c("3", "D", "/", "M", "O", "N", "&", "S", "U", "N","2", "D", "/", "M", "O", "N", "&", "S", "U", "N")))
})
