test_that("hydroshed works", {
  x <- -124.6
  y <- 54.8

  sf <- hydroshed(x = x, y = y)

  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POLYGON")
  expect_identical(nrow(sf), 1L)
  expect_identical(colnames(sf), "geometry")
})
