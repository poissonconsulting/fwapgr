test_that("api utils", {
  path <- "fwapg/collections/whse_basemapping.fwa_stream_networks_sp/items.json"
  query <- list(gnis_name = "Sangan River")
  bad_path <- "fwapg/collections/fwa_stream_networks_sp/"

  expect_chk_error(fwa_api(path, list(1)))
  expect_chk_error(fwa_api(1, list(a = 1)))
  expect_chk_error(fwa_api(path, 1))
  expect_chk_error(fwa_api(bad_path, query))

  x <- fwa_api(path, query)
  expect_is(x, "character")

  x <- read_feature(x, 4326)
  expect_is(x, "sf")
})
