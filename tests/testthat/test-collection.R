test_that("fwa_collection works default values", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  collection <- fwa_collection(collection_id, limit = 10)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
  expect_s3_class(collection$geometry, "sfc_MULTILINESTRING")
  expect_identical(colnames(sf::st_coordinates(collection)), c("X", "Y", "L1", "L2"))
  collection <- tibble::as_tibble(collection)
  collection$geometry <- NULL

  expect_snapshot_data(collection, "default10")
})

test_that("fwa_collection properties works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  properties <- c("blue_line_key", "gnis_name")

  collection <- fwa_collection(collection_id, limit = 1, properties = properties)
  expect_identical(colnames(collection), c(properties, "geometry"))
})

test_that("fwa_collection filter works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  filter <- list(gnis_name_1 = "Trout Lake")

  collection <- fwa_collection(collection_id, filter = filter)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
  expect_true(all(collection$gnis_name_1 == "Trout Lake"))
  collection <- tibble::as_tibble(collection)
  collection$geometry <- NULL
  expect_snapshot_data(collection, "trout_lake")
})
#
# test_that("fwa_collection bounding box works", {
#   collection_id <- "whse_basemapping.fwa_lakes_poly"
#
#   bbox <- c(-122.01, 49.11, -121.86, 49.16)
#
#   # returns features within bounds of lake table
#   collection <- fwa_collection(collection_id, bbox = bbox)
#   expect_identical(sort(unique(collection$gnis_name_1)), c("Ryder Lake", "Sardis Pond"))
# })
#


test_that("fwa_collection offset works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_collection(collection_id, limit = 2)
  expect_identical(collection$id, c('1', '2'))
  collection2 <- fwa_collection(collection_id, offset = 1, limit = 1)
  expect_identical(collection2$id, collection$id[2])
})

test_that("fwa_collection offset works with higher numbers", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_collection(collection_id, offset = 997, limit = 2)
  collection2 <- fwa_collection(collection_id, offset = 998, limit = 1)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection2, "sf")
  skip("fwa_collection offset often doesn't work with higher numbers!!!!")
  expect_true(identical(collection2$id, collection$id[2]))
})

test_that("fwa_collection offset works at 99,999", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  expect_silent(fwa_collection(collection_id, offset = 99999, limit = 1))
})

test_that("fwa_collection offset errors at 100,000", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  expect_error(
    fwa_collection(collection_id, offset = 100000),
    "`offset` must be less than 100000"
  )
})

test_that("fwa_collection offset errors above 100,000", {
  collection_id <- "whse_basemapping.fwa_stream_networks_sp"
  expect_error(fwa_collection(collection_id, offset = 100001))
  expect_error(
    fwa_collection(collection_id, offset = 100000),
    "`offset` must be less than 100000"
  )
})

test_that("fwa_collection", {
  collection_id <- "whse_basemapping.fwa_stream_networks_sp"

  ### fwa_collection
  bbox <- c(-122.01, 49.11, -121.86, 49.16)
  properties <- c("blue_line_key", "gnis_name")
  filter <- list(gnis_name = "Chilliwack Creek")

  # check filter  when outside of bounds
  filter <- list(gnis_name_1 = "Sardis Pond")
  x <- fwa_collection("whse_basemapping.fwa_lakes_poly", filter = filter, bbox = bbox)
  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 1L)

  # check bbox outside feature
  filter <- list(gnis_name = "Sangan River")
  x <- fwa_collection(collection_id, filter = filter, bbox = bbox)
  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 0L)

  ### check transform
  # test multiple args
  filter <- list(gnis_name = "Chilliwack Creek")
  z <- fwa_collection(collection_id, filter = filter, transform = c("ST_Simplify", 1000))
  expect_s3_class(z, "sf")
  # expect a triangle
#  expect_true(length(unlist(z$geometry)) < length(unlist(y$geometry)))
})
