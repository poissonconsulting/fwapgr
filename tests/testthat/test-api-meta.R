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
  })
})
