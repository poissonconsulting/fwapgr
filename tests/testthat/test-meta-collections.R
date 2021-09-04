test_that("fwa_meta_collections works the values haven't changed", {
  collections <- fwa_meta_collections()
  expect_s3_class(collections, "tbl")
  expect_identical(names(collections), c("collection_id", "description", "extent", "links"))
  expect_snapshot_data(collections[c("collection_id", "description")], "collections")
})

