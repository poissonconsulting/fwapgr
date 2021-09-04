test_that("fwa_collection offset works", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"

  x <- fwa_collection(collectionid, offset = 0, limit = 2)
  z <- fwa_collection(collectionid, offset = 1, limit = 1)
  expect_true(identical(x$geometry[2], z$geometry))
})

test_that("fwa_collection offset doesn't work higher number!!!", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"

  x <- fwa_collection(collectionid, offset = 100, limit = 2)
  z <- fwa_collection(collectionid, offset = 100+1, limit = 1)
  expect_false(identical(x$geometry[2], z$geometry))
})

test_that("fwa_collection offset works at 99,999", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"
  expect_silent(fwa_collection(collectionid, offset = 99999, limit = 1))
})

test_that("fwa_collection offset errors at 100,000", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"
  expect_error(fwa_collection(collectionid, offset = 100000),
               "`offset` must be less than 100000")
})

test_that("fwa_collection offset errors at 100,001", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"
  expect_error(fwa_collection(collectionid, offset = 100001))
  expect_error(fwa_collection(collectionid, offset = 100000),
               "`offset` must be less than 100000")
})

test_that("fwa_collection", {
  collectionid <- "whse_basemapping.fwa_stream_networks_sp"

  ### fwa_collection
  bbox <- c(-122.01, 49.11, -121.86, 49.16)
  properties <- c("blue_line_key", "gnis_name")
  filter <- list(gnis_name = "Chilliwack Creek")

  # default vals
  y <- fwa_collection(collectionid, filter = filter)
  expect_true(all(y$gnis_name == "Chilliwack Creek"))
  expect_is(y, "sf")
  # including coordinates
  expect_identical(colnames(sf::st_coordinates(y)), c("X", "Y", "Z", "L1"))

  # check columns
  x <- fwa_collection(collectionid, filter = filter, properties = properties)
  expect_is(x, "sf")
  expect_identical(c(properties, "geometry"), names(x))

  # check filter and bounds
  x <- fwa_collection(collectionid, filter = filter, bbox = bbox)
  expect_is(x, "sf")
  expect_true(nrow(x) > 0)
  expect_true(all(x$gnis_name == "Chilliwack Creek"))

  # returns features within bounds of lake table
  x <- fwa_collection("whse_basemapping.fwa_lakes_poly", bbox = bbox)
  expect_is(x, "sf")
  expect_identical(sort(unique(x$gnis_name_1)), c("Ryder Lake", "Sardis Pond"))

  # check filter  when outside of bounds
  filter <- list(gnis_name_1 = 'Sardis Pond')
  x <- fwa_collection("whse_basemapping.fwa_lakes_poly", filter = filter, bbox = bbox)
  expect_is(x, "sf")
  expect_identical(nrow(x), 1L)

  # check bbox outside feature
  filter <- list(gnis_name = "Sangan River")
  x <- fwa_collection(collectionid, filter = filter, bbox = bbox)
  expect_is(x, "sf")
  expect_identical(nrow(x), 0L)

  ### check transform
  # test multiple args
  filter <- list(gnis_name = "Chilliwack Creek")
  z <- fwa_collection(collectionid, filter = filter, transform = c("ST_Simplify", 1000))
  expect_is(z, "sf")
  # expect a triangle
  expect_true(length(unlist(z$geometry)) < length(unlist(y$geometry)))

})
