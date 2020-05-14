test_that("api utils", {
  path <- "fwa/v1/watershed_stream/356308001"
  query <- list(downstream_route_measure = 1, srid = 4326)
  bad_blk <- "fwa/v1/watershed_stream/3563080"
  expect_error(fwa_api(path, list(1)), class = "chk_error")
  expect_error(fwa_api(1, list(a = 1)), class = "chk_error")
  expect_error(fwa_api(path, 1), class = "chk_error")

  x <- fwa_api(bad_blk, query)
  expect_identical(x, "{\"type\":\"FeatureCollection\",\"features\":[]}")

  x <- fwa_api(path, query)
  expect_identical(x, "{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"MultiLineString\",\"coordinates\":[[[-122.015467,49.168027],[-122.014029,49.165565]]]},\"properties\":{\"linear_feature_id\":701348697}}]}")

  x <- read_feature(x, 4326)
  expect_is(x, "sf")
})
