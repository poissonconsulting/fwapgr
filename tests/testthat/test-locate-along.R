test_that("fwa_locate_along works", {
  sf <- fwa_locate_along(356308001, downstream_route_measure = 10000)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POINT")
  expect_identical(nrow(sf), 1L)
  expect_identical(colnames(sf), "geometry")
})
