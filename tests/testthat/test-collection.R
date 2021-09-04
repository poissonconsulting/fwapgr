test_that("fwa_collection works default values", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  collection <- fwa_collection(collection_id, limit = 10)
  expect_s3_class(collection, "sf")
  collection <- tibble::as_tibble(collection)
  collection$geometry <- NULL

  expect_snapshot_data(collection, "collection_default")
})

test_that("fwa_collection offset works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_collection(collection_id, limit = 2)
  expect_identical(collection$id, c('1', '2'))
  collection2 <- fwa_collection(collection_id, offset = 1, limit = 1)
  expect_identical(collection2$id, collection$id[2])
})

test_that("fwa_collection offset doesn't work with higher numbers!!!!", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_collection(collection_id, offset = 997, limit = 2)
  collection2 <- fwa_collection(collection_id, offset = 998, limit = 1)
  expect_false(identical(collection2$id, collection$id[2])) ## this should be true
})

test_that("fwa_collection offset works at 99,999", {
  collection_id <- "whse_basemapping.fwa_stream_networks_sp"
  expect_silent(fwa_collection(collection_id, offset = 99999, limit = 1))
})

test_that("fwa_collection offset errors at 100,000", {
  collection_id <- "whse_basemapping.fwa_stream_networks_sp"
  expect_error(
    fwa_collection(collection_id, offset = 100000),
    "`offset` must be less than 100000"
  )
})

test_that("fwa_collection offset errors at 100,001", {
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

  # default vals
  y <- fwa_collection(collection_id, filter = filter)
  expect_true(all(y$gnis_name == "Chilliwack Creek"))
  expect_s3_class(y, "sf")
  # including coordinates
  expect_identical(colnames(sf::st_coordinates(y)), c("X", "Y", "Z", "L1"))

  # check columns
  x <- fwa_collection(collection_id, filter = filter, properties = properties)
  expect_s3_class(x, "sf")
  expect_identical(c(properties, "geometry"), names(x))

  # check filter and bounds
  x <- fwa_collection(collection_id, filter = filter, bbox = bbox)
  expect_s3_class(x, "sf")
  expect_true(nrow(x) > 0)
  expect_true(all(x$gnis_name == "Chilliwack Creek"))

  # returns features within bounds of lake table
  x <- fwa_collection("whse_basemapping.fwa_lakes_poly", bbox = bbox)
  expect_s3_class(x, "sf")
  expect_identical(sort(unique(x$gnis_name_1)), c("Ryder Lake", "Sardis Pond"))

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
  expect_true(length(unlist(z$geometry)) < length(unlist(y$geometry)))
})
