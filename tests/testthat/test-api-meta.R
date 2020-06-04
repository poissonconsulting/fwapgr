test_that("api meta functions work", {

  ## list layers
  x <- fwa_list_layers()
  expect_is(x, "tbl")
  expect_identical(names(x), c("f_table_catalog", "f_table_schema", "f_table_name",
                               "f_geometry_column", "coord_dimension", "srid", "type"))

  ## list columns
  x <- fwa_list_columns("fwa_stream_networks_sp")
  expect_is(x, "tbl")
  expect_identical(names(x), c("field_name", "field_type"))

  ## list named streams
  x <- fwa_list_gnis_streams()
  expect_identical(x, gnis_stream)
  x <- fwa_list_gnis_streams("sangan")
  expect_true(all(x$gnis_name == "Sangan River"))
  expect_identical(nrow(x), 4L)

  x <- fwa_list_gnis_streams("sangan", ignore_case = FALSE)
  expect_identical(nrow(x), 0L)

  ## search named streams
  x <- fwa_search_gnis_streams()
  expect_true(is.character(x))
  x <- fwa_search_gnis_streams("sangan")
  expect_length(x, 4L)
  expect_true(all(x == "Sangan River"))
  x <- fwa_search_gnis_streams("sangan", ignore_case = FALSE)
  expect_length(x, 0L)

})
