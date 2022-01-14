test_that("fwa_watershed_at_measure works", {
  sf <- fwa_watershed_at_measure(356308001,
    downstream_route_measure = 10000,
    properties = "area_ha"
  )
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_POLYGON")
  expect_identical(nrow(sf), 1L)
  expect_identical(names(sf), c("area_ha", "geometry"))
})
