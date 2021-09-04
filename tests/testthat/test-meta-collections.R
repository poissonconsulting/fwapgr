test_that("fwa_meta_collections are recognised", {
  collections <- fwa_meta_collections()
  expect_s3_class(collections, "tbl")
  expect_identical(names(collections), c("collection_id", "description", "extent", "links"))
  expect_setequal(collections$collection_id, collection_ids())
})
