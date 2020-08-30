with_mock_api({
  test_that("API collections works", {
    table <- "fwa_stream_networks_sp"

    ### fwa_collection
    columns <- c("blue_line_key", "gnis_name")
    bbox <- c(-122.01, 49.11, -121.86, 49.16)
    columns <- c("blue_line_key", "gnis_name")
    filter <- list(gnis_name = "Chilliwack Creek")

    # default vals
    x <- fwa_collection(table, filter = filter)
    expect_true(all(x$gnis_name == "Chilliwack Creek"))
    expect_is(x, "sf")

    # test wrapper
    y <- fwa_stream_gnis("Chilliwack Creek")
    expect_identical(x, y)

    # check columns
    x <- fwa_collection(table, filter = filter, columns = columns)
    expect_is(x, "sf")
    expect_identical(c(columns, "geometry"), names(x))

    # check filter and bounds
    x <- fwa_collection(table, filter = filter, bbox = bbox)
    expect_is(x, "sf")
    expect_true(nrow(x) > 0)
    expect_true(all(x$gnis_name == "Chilliwack Creek"))

    # returns features within bounds of lake table
    x <- fwa_collection("fwa_lakes_poly", bbox = bbox)
    expect_is(x, "sf")
    expect_identical(sort(unique(x$gnis_name_1)), c("Ryder Lake", "Sardis Pond"))

    # check filter  when outside of bounds
    filter <- list(gnis_name_1 = 'Sardis Pond')
    x <- fwa_collection("fwa_lakes_poly", filter = filter, bbox = bbox)
    expect_is(x, "sf")
    expect_identical(nrow(x), 1L)

    # check other schema
    x <- fwa_collection("wbdhu12", bbox = bbox, schema = "usgs")
    expect_is(x, "sf")
    expect_identical(nrow(x), 2L)

    # check bbox outside feature
    filter <- list(gnis_name = "Sangan River")
    expect_error(fwa_collection(table, filter = filter, bbox = bbox), class = "chk_error")

  })

})

