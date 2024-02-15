test_that("fwa_collection works with default values", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  collection_id <- "whse_basemapping.fwa_named_streams"
  collection <- fwa_collection(collection_id, limit = 10)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
  expect_s3_class(collection$geometry, "sfc_MULTILINESTRING")
  expect_identical(sf::st_crs(collection)$epsg, 4326L)
  expect_identical(colnames(sf::st_coordinates(collection)), c("X", "Y", "L1", "L2"))

  expect_snapshot_data(collection, "default10")

  collection_id <- "whse_basemapping.fwa_streams_vw"
  collection <- fwa_collection(collection_id, limit = 10)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
})
