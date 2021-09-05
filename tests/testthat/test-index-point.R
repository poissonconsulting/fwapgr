test_that("fwa_index_point point works", {
  x <- -124.6
  y <- 54.8

  index_point <- fwa_index_point(x = x, y = y)
  expect_s3_class(index_point, "sf")
  expect_s3_class(index_point, "tbl_df")
  expect_s3_class(index_point$geometry, "sfc_POINT")
  expect_identical(nrow(index_point), 1L)
  expect_identical(119, round(index_point$distance_to_stream))

  expect_snapshot_data(index_point, "default")
})

test_that("fwa_index_point gets multiple within limits", {
  x <- -124.6
  y <- 54.8

  index_point <- fwa_index_point(x = x, y = y, limit = 3L)
  expect_s3_class(index_point, "sf")
  expect_identical(nrow(index_point), 3L)
  expect_identical(colnames(index_point), c(
    "bc_ind", "blue_line_key", "distance_to_stream", "downstream_route_measure",
    "gnis_name", "linear_feature_id", "localcode_ltree", "wscode_ltree",
    "geometry"
  ))
  expect_true(!is.unsorted(index_point$distance_to_stream))

  expect_snapshot_data(index_point, "limit3")
})

test_that("fwa_index_point returns none if tight tolerance", {
  x <- -124.6
  y <- 54.8

  index_point <- fwa_index_point(x = x, y = y, tolerance = 100)
  expect_s3_class(index_point, "sf")
  expect_identical(nrow(index_point), 0L)
  expect_s3_class(index_point$geometry, "sfc")

  skip("fwa_index_point only returns geometry column when no matches")
  expect_identical(colnames(index_point), c(
    "bc_ind", "blue_line_key", "distance_to_stream", "downstream_route_measure",
    "gnis_name", "linear_feature_id", "localcode_ltree", "wscode_ltree",
    "geometry"
  ))
})
