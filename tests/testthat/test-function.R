test_that("fwa_function works", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  sf <- fwa_function("fwa_locatealong", parameters = parameters)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POINT")
  expect_identical(sf::st_crs(sf)$epsg, 4326L)
  expect_identical(nrow(sf), 1L)
  expect_identical(colnames(sf), "geometry")
})

test_that("fwa_function informative error invalid function_id", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  expect_chk_error(fwa_function("not_a_function", parameters = parameters),
                   "API request failed \\[404\\]: Function not found: not_a_function")
})

test_that("fwa_function informative error invalid transform", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  expect_chk_error(fwa_function("fwa_locatealong", parameters = parameters,
                     transform = "not_a_transform"))
})
