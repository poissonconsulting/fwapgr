with_mock_api({
  test_that("API functions work", {

    ### nearest stream
    x <- -124.6
    y <- 54.8
    srid <- 4326

    df <- fwa_nearest_stream(x = x, y = y, srid = srid)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_POINT")
    expect_identical(nrow(df), 1L)
    expect_identical(119, round(df$distance_to_stream))

    ### watershed_at_measure
    blk <- 356308001
    drm <- 0
    drm2 <- 10000

    df <- fwa_watershed_at_measure(blk, downstream_route_measure = drm)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_POLYGON")
    expect_identical(nrow(df), 1L)

    df2 <- fwa_watershed_at_measure(blk, downstream_route_measure = drm2)
    expect_true(df$area_ha > df2$area_ha)

    ### stream at measure
    df <- fwa_stream_at_measure(blk, downstream_route_measure = drm)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_MULTILINESTRING")
    expect_identical(nrow(df), 1L)

    df2 <- fwa_stream_at_measure(blk, downstream_route_measure = drm2)
    expect_true(df$linear_feature_id != df2$linear_feature_id)

    ### watershed hex
    df <- fwa_watershed_hex(blk, downstream_route_measure = drm2)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_MULTIPOLYGON")
    expect_identical(nrow(df), 996L)

    ### locate along
    df <- fwa_locate_along(blk, downstream_route_measure = drm2)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_POINT")
    expect_identical(nrow(df), 1L)

    ### locate along interval
    df <- fwa_locate_along_interval(blk, interval = 100, start = 10000)
    expect_is(df, "sf")
    expect_is(df$geometry, "sfc_POINT")
    expect_identical(nrow(df), 93L)

  })
})


