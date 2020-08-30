test_that("API V1 functions work", {
  ### fwa_bbox
  x <- fwa_bbox("fwa_lakes_poly")
  expect_identical(length(x), 4L)
  expect_true(all(is.numeric(x)))
  expect_is(x, "bbox")
})
