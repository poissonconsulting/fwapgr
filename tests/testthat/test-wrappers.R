test_that("wrapper functions work", {
  ## fwa_stream_network
  gnis <- "Sangan River"
  x <- fwa_gnis_stream_networks(gnis_name = gnis, columns = "gnis_name")
  expect_is(x, "sf")
  expect_identical(nrow(x), 21L)
  expect_true(all(x$gnis_name == gnis))

})
