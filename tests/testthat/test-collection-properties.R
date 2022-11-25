test_that("fwa_collection_properties works", {
  properties <- fwa_collection_properties("whse_basemapping.fwa_stream_networks_sp")
  expect_s3_class(properties, "tbl_df")
})

test_that("fwa_collection_properties haven't changed for stream networks", {
  properties <- fwa_collection_properties("whse_basemapping.fwa_stream_networks_sp")
  expect_snapshot_data(properties, "properties")
})
