test_that("fwa_meta_collections works", {
  collections <- fwa_meta_collections()
  expect_s3_class(collections, "tbl_df")
  expect_identical(names(collections), c("collection_id", "description", "extent", "links"))
})

test_that("fwa_meta_collections collection_id values haven't changed", {
  collections <- fwa_meta_collections()
  expect_snapshot_data(collections["collection_id"], "collections")
})