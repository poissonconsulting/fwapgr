with_mock_api({
test_that("wrapper functions work", {
  ## fwa_stream_network
  gnis <- "Yakoun River"
  x <- fwa_gnis_streams(gnis_name = gnis, columns = "gnis_name")
  expect_is(x, "sf")
  expect_identical(nrow(x), 129L)
  expect_true(all(x$gnis_name == gnis))

  x <- fwa_gnis_streams(gnis_name = gnis, columns = "gnis_name", named_streams = TRUE)
  expect_is(x, "sf")
  expect_identical(nrow(x), 1L)
  expect_true(all(x$gnis_name == gnis))
})
})
