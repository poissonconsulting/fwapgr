with_mock_api({
  test_that("api meta functions work", {

    ## list layers
    x <- fwa_list_tables()
    expect_is(x, "tbl")
    expect_identical(names(x), c("table", "schema", "collection_id", "extent"))

    ## list columns
    x <- fwa_list_columns("fwa_stream_networks_sp")
    expect_is(x, "tbl")
    expect_identical(names(x), c("name", "type", "description"))

    ## list named streams
    x <- fwa_list_gnis_streams()
    expect_identical(x, gnis_stream)
    x <- fwa_list_gnis_streams("sangan")
    expect_true(all(x$gnis_name == "Sangan River"))
    expect_identical(nrow(x), 4L)

    x <- fwa_list_gnis_streams("sangan", ignore_case = FALSE)
    expect_identical(nrow(x), 0L)

    ## search named streams
    x <- fwa_search_gnis_streams()
    expect_true(is.character(x))
    x <- fwa_search_gnis_streams("sangan")
    # check unique
    expect_length(x, 1L)
    expect_true(all(x == "Sangan River"))
    x <- fwa_search_gnis_streams("sangan", ignore_case = FALSE)
    expect_length(x, 0L)

  })
})
