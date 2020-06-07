test_that("api feature calls work", {
  blk <- 356308001
  table <- "fwa_stream_networks_sp"
  filter_sql <- "gnis_name = 'Sangan River'"

  ### fwa_watershed
  expect_error(fwa_watershed("chiliwack"), class = "chk_error")
  x <- fwa_watershed(blk)
  expect_true(nrow(x) == 1)
  # need alternative windows/mac consistent way to check epsg
  # expect_identical(attr(x$geometry, "crs")$input, "4326")
  expect_is(x, "sf")

  # check transform
  # x <- fwa_watershed(blk, epsg = 3005)
  # expect_identical(attr(x$geometry, "crs")$input, "EPSG:3005")

  ### fwa_feature
  columns <- c("blue_line_key", "gnis_name")
  bounds <- c(-122.01, 49.11, -121.86, 49.16)

  # default vals
  x <- fwa_feature(table, filter = filter_sql)
  expect_true(all(x$gnis_name == "Chilliwack Creek"))
  # expect_identical(attr(x$geometry, "crs")$input, "4326")
  expect_is(x, "sf")
  expect_identical(c("geometry"), names(x))

  # check transform
  # x <- fwa_feature(table, filter = filter_sql,  epsg = 3005)
  # expect_identical(attr(x$geometry, "crs")$input, "EPSG:3005")

  # check columns
  x <- fwa_feature(table, filter = filter_sql, columns = columns)
  expect_identical(c(columns, "geometry"), names(x))

  # check bounds (bounds are from chiliwack so should return nothing)
  x <- fwa_feature(table, filter = filter_sql, bounds = bounds)
  expect_identical(nrow(x), 0L)

  # check null filter and lakes table
  x <- fwa_feature("fwa_lakes_poly", bounds = bounds)

  # check other schema
  x <- fwa_feature("wbdhu12", bounds = bounds,
                   schema = "usgs")

  expect_is(x, "sf")
  expect_identical(nrow(x), 2L)

  ### fwa_bbox
  x <- fwa_bbox("fwa_lakes_poly")
  expect_identical(length(x), 4L)
  expect_true(all(is.numeric(x)))
  expect_is(x, "bbox")

  # different schema
  x <- fwa_bbox("wbdhu12", schema = "usgs")
  expect_identical(length(x), 4L)
  expect_true(all(is.numeric(x)))
  expect_is(x, "bbox")
})
