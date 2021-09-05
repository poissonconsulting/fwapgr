test_that("API functions work", {


  ### watershed_at_measure
  blk <- 356308001
  drm <- 0
  drm2 <- 10000
  properties <- c("area_ha")

  df <- fwa_watershed_at_measure(blk, downstream_route_measure = drm2, properties = properties)
  expect_s3_class(df, "sf")
  expect_s3_class(df$geometry, "sfc_POLYGON")
  expect_identical(nrow(df), 1L)
  expect_identical(names(df), c(properties, "geometry"))
  #
  # df2 <- fwa_watershed_at_measure(blk, downstream_route_measure = drm2)
  # expect_true(df$area_ha > df2$area_ha)

  ### watershed_stream
  df <- fwa_watershed_stream(blk, downstream_route_measure = drm)
  expect_s3_class(df, "sf")
  expect_s3_class(df$geometry, "sfc_MULTILINESTRING")
  expect_identical(nrow(df), 1L)

  df2 <- fwa_watershed_stream(blk, downstream_route_measure = drm2)
  expect_true(df$linear_feature_id != df2$linear_feature_id)

  ### watershed hex
  df <- fwa_watershed_hex(blk, downstream_route_measure = drm2)
  expect_s3_class(df, "sf")
  expect_s3_class(df$geometry, "sfc_MULTIPOLYGON")

  ### locate along interval
  df <- fwa_locate_along_interval(blk, interval_length = 100, start_measure = 10000)
  expect_s3_class(df, "sf")
  expect_s3_class(df$geometry, "sfc_POINT")
  expect_identical(nrow(df), 93L)

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
