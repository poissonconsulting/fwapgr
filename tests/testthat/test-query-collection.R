test_that("collection works with default values ", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  x <- fwa_query_collection(collection_id,
    limit = 10
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x, "tbl_df")
  expect_s3_class(x$geometry, "sfc_MULTILINESTRING")
  expect_identical(sf::st_crs(x)$epsg, 4326L)
  expect_identical(colnames(sf::st_coordinates(x)), c("X", "Y", "L1", "L2"))
})

# filter
test_that("collection filter works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  filter <- list(gnis_name_1 = "Trout Lake")

  x <- fwa_query_collection(collection_id,
    filter = filter
  )
  expect_s3_class(x, "sf")
  expect_true(all(x$gnis_name_1 == "Trout Lake"))

  colnames <- c(
    "area_ha", "blue_line_key", "feature_code", "fwa_watershed_code",
    "gnis_id_1", "gnis_id_2",
    "gnis_id_3", "gnis_name_1", "gnis_name_2",
    "gnis_name_3", "left_right_tributary", "local_watershed_code",
    "localcode_ltree", "waterbody_key", "waterbody_key_50k",
    "waterbody_key_group_code_50k",
    "waterbody_poly_id", "waterbody_type", "watershed_code_50k",
    "watershed_group_code", "watershed_group_code_50k",
    "watershed_group_id", "watershed_key", "wscode_ltree", "geometry"
  )

  expect_identical(
    colnames(x), colnames
  )
  expect_snapshot_data(x[setdiff(colnames, "geometry")], "trout_lake")
})

# sortby
test_that("collection sortby works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  sortby <- c("blue_line_key")

  x <- fwa_query_collection(collection_id,
    limit = 1,
    sortby = sortby
  )

  x2 <- fwa_query_collection(collection_id,
    limit = 1
  )
  expect_true(x$blue_line_key < x2$blue_line_key)
})

test_that("collection sortby descending works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  sortby <- c("+blue_line_key")
  sortby_desc <- c("-blue_line_key")

  x <- fwa_query_collection(collection_id,
    limit = 1,
    sortby = sortby_desc
  )
  x2 <- fwa_query_collection(collection_id,
    limit = 1,
    sortby = sortby
  )
  expect_true(x$blue_line_key > x2$blue_line_key)
})

# bbox
test_that("collection bounding box gets everything intersecting bounding box", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  bbox <- c(-117.46, 50.6, -117.4601, 50.6001)

  x <- fwa_query_collection(collection_id,
    bbox = bbox
  )
  expect_identical(x$gnis_name_1, "Trout Lake")
  expect_identical(
    sort(colnames(x)),
    c(
      "area_ha", "blue_line_key", "feature_code", "fwa_watershed_code",
      "geometry", "gnis_id_1", "gnis_id_2", "gnis_id_3", "gnis_name_1", "gnis_name_2",
      "gnis_name_3", "left_right_tributary", "local_watershed_code",
      "localcode_ltree", "waterbody_key", "waterbody_key_50k", "waterbody_key_group_code_50k",
      "waterbody_poly_id", "waterbody_type", "watershed_code_50k",
      "watershed_group_code", "watershed_group_code_50k", "watershed_group_id",
      "watershed_key", "wscode_ltree"
    )
  )
})

# properties
test_that("collection properties works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  properties <- c("blue_line_key", "gnis_name")

  x <- fwa_query_collection(collection_id,
    limit = 1,
    properties = properties
  )
  expect_identical(colnames(x), c(properties, "geometry"))
})

# transform
test_that("collection transform works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  filter <- list(gnis_name_1 = "Kootenay Lake")

  x <- fwa_query_collection(collection_id,
    filter = filter,
    transform = c("ST_Simplify", 50000)
  )

  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 1L)
  expect_identical(nrow(sf::st_coordinates(sf::st_cast(x$geometry, "POINT"))), 4L)
})

test_that("collection transform to get bbox works", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  transform <- "collect|envelope"
  properties <- "geometry"

  x <- fwa_query_collection(collection_id,
    transform = transform,
    properties = properties
  )

  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 1L)
  expect_identical(nrow(sf::st_coordinates(sf::st_cast(x$geometry, "POINT"))), 5L)
})

# groupby
test_that("collection groupby works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  groupby <- "gnis_name"

  x <- fwa_query_collection(collection_id,
    limit = 10,
    groupby = groupby
  )

  expect_s3_class(x, "sf")
  # without groupby there are duplicate gnis_names
  expect_identical(length(unique(x$gnis_name)), 10L)
  expect_identical(
    colnames(x),
    c("gnis_name", "geometry")
  )
})

test_that("collection bounding box and filter work together", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  bbox <- c(-117.46, 50.6, -117.4601, 50.6001)
  filter <- list(gnis_name_1 = "kootenay lake")

  x <- fwa_query_collection(collection_id,
    filter = filter,
    bbox = bbox
  )
  expect_s3_class(x, "sf")
  expect_identical(nrow(x), 0L)
  # not sure why this is happening - is it an issue?
  skip("fwa_query_collection all columns missing except geometry when no rows")
  expect_identical(
    colnames(x),
    c("geometry")
  )
})

test_that("informative error invalid collection", {
  expect_chk_error(
    fwa_query_collection("not_a_collection"),
    "API request failed \\[404\\]: Collection not found: not_a_collection"
  )
})

test_that("collection informative error invalid transform", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  expect_chk_error(
    fwa_query_collection(collection_id,
      transform = "not_a_transform"
    ),
    "API request failed \\[400\\]: Invalid value for parameter transform: not_a_transform"
  )
})

test_that("collection informative error invalid bbox", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  expect_chk_error(
    fwa_query_collection(collection_id,
      bbox = 1
    ),
    "API request failed \\[400\\]: Invalid value for parameter bbox: 1"
  )
})

test_that("collection informative error invalid bbox", {
  collection_id <- "whse_basemapping.fwa_lakes_poly"

  expect_chk_error(fwa_query_collection(collection_id,
    filter = c(1)
  ))
})

test_that("collection offset works", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  x <- fwa_query_collection(collection_id,
    limit = 2
  )
  expect_identical(x$fwa_stream_networks_label_id, c(1, 2))
  x2 <- fwa_query_collection(collection_id,
    offset = 1,
    limit = 1
  )
  expect_identical(
    x2$fwa_stream_networks_label_id,
    x$fwa_stream_networks_label_id[2]
  )
})

test_that("collection offset works with higher numbers", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  sortby <- "fwa_stream_networks_label_id"
  x <- fwa_query_collection(collection_id,
    offset = 997,
    limit = 2,
    sortby = sortby
  )
  x2 <- fwa_query_collection(collection_id,
    offset = 998,
    limit = 1,
    sortby = sortby
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x2, "sf")
  expect_true(identical(x2$fwa_stream_networks_label_id, x$fwa_stream_networks_label_id[2]))
})

test_that("collection offset works with really big number", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  sortby <- "fwa_stream_networks_label_id"
  x <- fwa_query_collection(collection_id,
    offset = 9999,
    limit = 2,
    sortby = sortby
  )
  x2 <- fwa_query_collection(collection_id,
    offset = 10000,
    limit = 1,
    sortby = sortby
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x2, "sf")

  expect_true(identical(
    x2$fwa_stream_networks_label_id,
    x$fwa_stream_networks_label_id[2]
  ))
})

test_that("collection offset works with offset more than limit", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  sortby <- "fwa_stream_networks_label_id"
  x <- fwa_query_collection(collection_id,
    offset = 10000,
    limit = 2,
    sortby = sortby
  )
  x2 <- fwa_query_collection(collection_id,
    offset = 10001,
    limit = 1,
    sortby = sortby
  )
  expect_s3_class(x, "sf")
  expect_s3_class(x2, "sf")

  expect_true(identical(
    x2$fwa_stream_networks_label_id,
    x$fwa_stream_networks_label_id[2]
  ))
})

test_that("collection offset works at 99,999", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  expect_silent(fwa_query_collection(collection_id,
    offset = 99999, limit = 1
  ))
})

test_that("collection offset works at 100,000", {
  collection_id <- "whse_basemapping.fwa_named_streams"

  expect_silent(fwa_query_collection(collection_id,
    offset = 100000, limit = 1
  ))
})
