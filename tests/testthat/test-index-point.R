test_that("fwa_index_point works", {
  rlang::local_options(nocache = TRUE)

  x <- -124.6
  y <- 54.8

  sf <- fwa_index_point(x = x, y = y)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POINT")
  expect_identical(nrow(sf), 1L)
  expect_identical(119, round(sf$distance_to_stream))

  expect_snapshot_data(sf, "default")
})

test_that("fwa_index_point gets multiple within limits", {
  rlang::local_options(nocache = TRUE)

  x <- -124.6
  y <- 54.8

  sf <- fwa_index_point(x = x, y = y, limit = 3L)
  expect_s3_class(sf, "sf")
  expect_identical(nrow(sf), 3L)
  expect_identical(colnames(sf), c(
    "bc_ind", "blue_line_key", "distance_to_stream", "downstream_route_measure",
    "gnis_name", "linear_feature_id", "localcode_ltree", "wscode_ltree",
    "geometry"
  ))
  expect_true(!is.unsorted(sf$distance_to_stream))

  expect_snapshot_data(sf, "limit3")
})

test_that("fwa_index_point returns none if tight tolerance", {
  rlang::local_options(nocache = TRUE)

  x <- -124.6
  y <- 54.8

  sf <- fwa_index_point(x = x, y = y, tolerance = 100)
  expect_s3_class(sf, "sf")
  expect_identical(nrow(sf), 0L)
  expect_s3_class(sf$geometry, "sfc")

  skip("fwa_index_point only returns geometry column when no matches")
  expect_identical(colnames(sf), c(
    "bc_ind", "blue_line_key", "distance_to_stream", "downstream_route_measure",
    "gnis_name", "linear_feature_id", "localcode_ltree", "wscode_ltree",
    "geometry"
  ))
})
