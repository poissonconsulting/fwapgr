test_that("API functions work", {


  ### watershed_at_measure
  blk <- 356308001
  drm <- 0
  drm2 <- 10000
  properties <- c("area_ha")

  ### check transform
  # test multiple args
  x <- fwa_watershed_stream(blk, downstream_route_measure = drm2, transform = c("ST_Simplify", 1000))
  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 1L)
  # expect a triangle
  expect_identical(length(unlist(x$geometry)), 4L)
})
