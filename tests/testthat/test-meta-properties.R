test_that("fwa_meta_properties works", {
  properties <- fwa_meta_properties("whse_basemapping.fwa_stream_networks_sp")
  expect_s3_class(properties, "tbl_df")
  expect_snapshot_data(properties, "properties")
})

