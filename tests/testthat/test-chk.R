test_that("chk_function template", {
  path <- "fwa/v1/list_layers"
  url <- modify_url(api_url(), path = path)
  bad_url <- modify_url(api_url(), path = "fwa/v1/list_la")
  resp <- GET(url)
  bad_resp <- GET(bad_url)

  expect_null(chk_response_json(resp))
  expect_null(chk_response_status(resp))
  expect_invisible(chk_response_json(resp))
  expect_invisible(chk_response_status(resp))

  chk::expect_chk_error(chk_response_status(bad_resp), "FWA API request failed 404.")
  bounds <- c(-122.01, 49.11, -121.86, 49.16)
  chk_bounds(bounds)
  expect_error(chk_bounds(bounds[1:2]), class = "chk_error")
})
