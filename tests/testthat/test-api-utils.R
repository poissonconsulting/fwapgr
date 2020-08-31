with_mock_api({
  test_that("api utils", {
    path <- "fwapg/collections/whse_basemapping.fwa_stream_networks_sp/items.json"
    query <- list(gnis_name = "Sangan River")
    bad_path <- "fwapg/collections/fwa_stream_networks_sp/"
    expect_error(fwa_api(path, list(1)), class = "chk_error")
    expect_error(fwa_api(1, list(a = 1)), class = "chk_error")
    expect_error(fwa_api(path, 1), class = "chk_error")

    expect_error(fwa_api(bad_path, query), class = "chk_error")

    x <- fwa_api(path, query)
    expect_is(x, "character")

    x <- read_feature(x, 4326)
    expect_is(x, "sf")
  })
})
