test_that("deprecated functions", {
  expect_error(fwa_list_layers())
  expect_error(fwa_bbox("fwa_lakes_poly"))
  expect_error(fwa_feature("fwa_lakes_poly"))
  expect_error(fwa_gnis_streams(gnis_name = "Yakoun River"))
  expect_error(fwa_watershed(blue_line_key = 356308001))
})
