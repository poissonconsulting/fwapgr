test_that("api meta functions work", {

  ## list layers
  x <- fwa_lookup_layers()
  expect_is(x, "tbl")
  expect_identical(names(x), c("f_table_catalog", "f_table_schema", "f_table_name",
                               "f_geometry_column", "coord_dimension", "srid", "type"))

  ## list columns
  x <- fwa_lookup_columns("fwa_stream_networks_sp")
  expect_is(x, "tbl")
  expect_identical(names(x), c("field_name", "field_type"))
})
