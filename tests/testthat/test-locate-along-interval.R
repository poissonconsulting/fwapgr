test_that("fwa_locate_along_interval works", {
  sf <- fwa_locate_along_interval(356308001, interval_length = 100, start_measure = 10000)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POINT")
  expect_identical(nrow(sf), 93L)
  expect_identical(colnames(sf), c("downstream_route_measure", "index", "geometry"))
})

test_that("fwa_locate_along_interval errors with invalid", {
  chk::expect_chk_error(
    fwa_locate_along_interval(1, end_measure = 100, interval_length = 10, limit = 9),
    "`limit` must be greater than"
  )
})
