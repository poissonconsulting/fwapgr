test_that("fwa_function informative error invalid function_id", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  expect_chk_error(fwa_function("not_a_function", parameters = parameters),
                   "API request failed \\[404\\]: Function not found: postgisftw.not_a_function")
})

test_that("fwa_function informative error invalid transform", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  expect_chk_error(fwa_function("fwa_locatealong", parameters = parameters,
                     transform = "not_a_transform"),
                   "API request failed \\[400\\]: Invalid value for parameter transform: not_a_transform")
})

test_that("fwa_function informative error bounding box", {

  parameters <- list(
    blue_line_key = 356308001,
    downstream_route_measure = 0
  )

  expect_chk_error(fwa_function("fwa_locatealong", parameters = parameters,
                                bbox = 1),
                   "API request failed \\[400\\]: Invalid value for parameter bbox: 1")
})
