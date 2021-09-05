test_that("API functions work", {


  ### watershed_at_measure
  blk <- 356308001
  drm <- 0
  drm2 <- 10000
  properties <- c("area_ha")

  ### watershed hex
  df <- fwa_watershed_hex(blk, downstream_route_measure = drm2)
  expect_s3_class(df, "sf")
  expect_s3_class(df$geometry, "sfc_MULTIPOLYGON")

  ### check transform
  # test multiple args
  x <- fwa_watershed_stream(blk, downstream_route_measure = drm2, transform = c("ST_Simplify", 1000))
  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 1L)
  # expect a triangle
  expect_identical(length(unlist(x$geometry)), 4L)
})


test_that("chk errors", {
  chk::expect_chk_error(
    fwa_locate_along_interval(1, end_measure = 100, interval_length = 10, limit = 9),
    "`limit \\+ offset` must be greater than"
  )
})
