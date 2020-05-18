test_that("api feature calls work", {
  blk <- 356308001
  table <- "fwa_stream_networks_sp"
  filter_sql <- "gnis_name = 'Cowichan River'"
  expect_error(fwa_watershed("chiliwack"), class = "chk_error")
  x <- fwa_watershed(blk, srid = 3005)
  expect_true(nrow(x) == 1)
  expect_identical(attr(x$geometry, "crs")$input, "EPSG:3005")
  expect_is(x, "sf")

  x <- fwa_query(table, filter = filter_sql, limit = 1)
})
