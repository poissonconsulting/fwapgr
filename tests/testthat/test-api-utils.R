test_that("api utils", {
  path <- "fwa/v1/watershed/356308001"
  query <- list(downstream_route_measure = 1, srid = 4326)
  bad_blk <- "fwa/v1/watershed/3563080"
  expect_error(fwa_api(path, list(1)), class = "chk_error")
  expect_error(fwa_api(1, list(a = 1)), class = "chk_error")
  expect_error(fwa_api(path, 1), class = "chk_error")

  x <- fwa_api(bad_blk, query)
  expect_identical(x, "{\"type\":\"FeatureCollection\",\"features\":[]}")

  x <- fwa_api(path, query)
  expect_is(x, "character")
  expect_true(grepl("\"type\":\"Polygon\",\"coordinates\":", x))

  bad_path <- "fwa/v1/geojson/fwa_lakes_poly"
  path <- "fwa/v1/geojson/whse_basemapping.fwa_lakes_poly"
  bad_query <- list(filter = "gnis_name = 'Adams Lake'")
  query <- list(filter = "gnis_name_1 = 'Adams Lake'")
  no_features <- list(filter = "gnis_name_1 = 'Adams Lake'",
                      bounds = "-122.01,49.11,-121.86,49.16")
  ## test different error messages
  # API request failure
  expect_error(fwa_api(bad_path, query), class = "chk_error")
  expect_error(fwa_api(path, bad_query), class = "chk_error")
  # bad gateway json
  expect_error(fwa_api(path, no_features), class = "chk_error")

  x <- read_feature(x, 4326)
  expect_is(x, "sf")
})
