test_that("multiplication works", {
  rlang::local_options(nocache = TRUE)

  sf <- fwa_watershed_stream(356308001)
  expect_s3_class(sf, "sf")
  expect_s3_class(sf, "tbl_df")
  expect_s3_class(sf$geometry, "sfc_MULTILINESTRING")
  expect_identical(nrow(sf), 1L)
  expect_identical(colnames(sf), c("linear_feature_id", "geometry"))
  expect_identical(sf$linear_feature_id, 701348697)
})
