test_that("multiplication works", {
  rlang::local_options(nocache = TRUE)

  sf <- fwa_watershed_hex(356308001, downstream_route_measure = 10000, limit = 1000)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf$geometry, "sfc_MULTIPOLYGON")
  expect_identical(nrow(sf), 996L)
  expect_identical(colnames(sf), c("hex_id", "geometry"))
})
