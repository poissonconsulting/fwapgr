test_that("fwa_query_collection works with default values", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  collection <- fwa_query_collection(collection_id, limit = 10)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
  expect_s3_class(collection$geometry, "sfc_MULTILINESTRING")
  expect_identical(sf::st_crs(collection)$epsg, 4326L)
  expect_identical(colnames(sf::st_coordinates(collection)), c("X", "Y", "L1", "L2"))

  expect_snapshot_data(collection, "default10")
})

test_that("fwa_query_collection epsg can be set", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  collection <- fwa_query_collection(collection_id, limit = 10, epsg = 3153)
  expect_identical(sf::st_crs(collection)$epsg, 3153L)
})

test_that("fwa_query_collection properties works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  properties <- c("blue_line_key", "gnis_name")

  collection <- fwa_query_collection(collection_id, limit = 1, properties = properties)
  expect_identical(colnames(collection), c(properties, "geometry"))
})

test_that("fwa_query_collection filter works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  filter <- list(gnis_name_1 = "Trout Lake")

  collection <- fwa_query_collection(collection_id, filter = filter)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection, "tbl_df")
  expect_true(all(collection$gnis_name_1 == "Trout Lake"))

  expect_identical(
    colnames(collection),
    c("id", "area_ha", "blue_line_key", "feature_code", "fwa_watershed_code",
      "gnis_id_1", "gnis_id_2", "gnis_id_3", "gnis_name_1", "gnis_name_2",
      "gnis_name_3", "left_right_tributary", "local_watershed_code",
      "localcode_ltree", "waterbody_key", "waterbody_key_50k", "waterbody_key_group_code_50k",
      "waterbody_poly_id", "waterbody_type", "watershed_code_50k",
      "watershed_group_code", "watershed_group_code_50k", "watershed_group_id",
      "watershed_key", "wscode_ltree", "geometry"))

  expect_snapshot_data(collection, "trout_lake")
})

test_that("fwa_query_collection bounding box gets everything overlapping bounding box", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  bbox <- c(-117.46, 50.6, -117.4601, 50.6001)

  collection <- fwa_query_collection(collection_id, bbox = bbox)
  expect_identical(collection$gnis_name_1, "Trout Lake")
  expect_identical(
    colnames(collection),
    c("id", "area_ha", "blue_line_key", "feature_code", "fwa_watershed_code",
      "gnis_id_1", "gnis_id_2", "gnis_id_3", "gnis_name_1", "gnis_name_2",
      "gnis_name_3", "left_right_tributary", "local_watershed_code",
      "localcode_ltree", "waterbody_key", "waterbody_key_50k", "waterbody_key_group_code_50k",
      "waterbody_poly_id", "waterbody_type", "watershed_code_50k",
      "watershed_group_code", "watershed_group_code_50k", "watershed_group_id",
      "watershed_key", "wscode_ltree", "geometry"))
})

test_that("fwa_query_collection bounding box and filter work together", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  bbox <- c(-117.46, 50.6, -117.4601, 50.6001)
  filter <- list(gnis_name_1 = "kootenay lake")

  collection <- fwa_query_collection(collection_id, filter = filter, bbox = bbox)
  expect_s3_class(collection, "sf")
  expect_identical(nrow(collection), 0L)
  skip("fwa_query_collection all columns missing except geometry when no rows")
  expect_identical(
    colnames(collection),
    c("id", "area_ha", "blue_line_key", "feature_code", "fwa_watershed_code",
      "gnis_id_1", "gnis_id_2", "gnis_id_3", "gnis_name_1", "gnis_name_2",
      "gnis_name_3", "left_right_tributary", "local_watershed_code",
      "localcode_ltree", "waterbody_key", "waterbody_key_50k", "waterbody_key_group_code_50k",
      "waterbody_poly_id", "waterbody_type", "watershed_code_50k",
      "watershed_group_code", "watershed_group_code_50k", "watershed_group_id",
      "watershed_key", "wscode_ltree", "geometry"))
})

test_that("fwa_query_collection transform works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  filter <- list(gnis_name_1 = "Kootenay Lake")

  collection <- fwa_query_collection(collection_id, filter = filter, transform = c("ST_Simplify", 50000))
  expect_s3_class(collection, "sf")
  expect_identical(nrow(collection), 1L)
  expect_identical(nrow(sf::st_coordinates(sf::st_cast(collection$geometry, "POINT"))), 4L)
})

test_that("fwa_query_collection informative error invalid collection", {
  expect_chk_error(fwa_query_collection("not_a_collection"),
                   "API request failed \\[404\\]: Collection not found: not_a_collection")
})

test_that("fwa_query_collection informative error invalid transform", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  expect_chk_error(fwa_query_collection(collection_id,
                                  transform = "not_a_transform"),
                   "API request failed \\[400\\]: Invalid value for parameter transform: not_a_transform")
})

test_that("fwa_query_collection informative error invalid bbox", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"
  expect_chk_error(fwa_query_collection(collection_id, bbox = 1),
                   "API request failed \\[400\\]: Invalid value for parameter bbox: 1")
})

test_that("fwa_query_collection informative error invalid bbox", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"
  expect_chk_error(fwa_query_collection(collection_id, filter = c(1)),
                   "^`filter` must be named\\.$")
})

test_that("fwa_query_collection offset works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_query_collection(collection_id, limit = 2)
  expect_identical(collection$id, c('1', '2'))
  collection2 <- fwa_query_collection(collection_id, offset = 1, limit = 1)
  expect_identical(collection2$id, collection$id[2])
})

test_that("fwa_query_collection offset works with higher numbers", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_query_collection(collection_id, offset = 997, limit = 2)
  collection2 <- fwa_query_collection(collection_id, offset = 998, limit = 1)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection2, "sf")
  expect_true(identical(collection2$id, collection$id[2]))
})

test_that("fwa_query_collection offset works with really big number", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_query_collection(collection_id, offset =  9999, limit = 2)
  collection2 <- fwa_query_collection(collection_id, offset = 10000, limit = 1)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection2, "sf")
  expect_true(identical(collection2$id, collection$id[2]))
})

test_that("fwa_query_collection offset works with offset more than limit", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  collection <- fwa_query_collection(collection_id, offset = 10000, limit = 2)
  collection2 <- fwa_query_collection(collection_id, offset = 10001, limit = 1)
  expect_s3_class(collection, "sf")
  expect_s3_class(collection2, "sf")
  skip("offset doesn't work when offset more than limit!")
  expect_true(identical(collection2$id, collection$id[2]))
})

test_that("fwa_query_collection offset works at 99,999", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  expect_silent(fwa_query_collection(collection_id, offset = 99999, limit = 1))
})

test_that("fwa_query_collection offset errors at 100,000", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  expect_error(
    fwa_query_collection(collection_id, offset = 100000),
    "API request failed \\[400\\]: Invalid value for parameter offset: 1e\\+05"
  )
})

test_that("fwa_query_collection offset errors at 100,001", {
  collection_id <- "whse_basemapping.fwa_named_streams"
  skip("fwa_query_collection offset doesn't error at 100,001")
  expect_error(
    fwa_query_collection(collection_id, offset = 100001),
    "API request failed \\[400\\]: Invalid value for parameter offset: 1e\\+05"
  )
})
