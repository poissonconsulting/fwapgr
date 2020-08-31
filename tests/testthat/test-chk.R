with_mock_api({
test_that("chk_function template", {
  path <- "fwapg/collections"
  url <- httr::modify_url(api_url(), path = path)
  bad_url <- httr::modify_url(api_url(), path = "fwa/v1/list_la")
  resp <- httr::GET(url)
  bad_resp <- httr::GET(bad_url)

  expect_null(chk_response_status(resp))
  expect_invisible(chk_response_json(resp))
  expect_invisible(chk_response_status(resp))

  chk::expect_chk_error(chk_response_status(bad_resp))
  bbox <- c(-122.01, 49.11, -121.86, 49.16)
  chk_bbox(bbox)
  expect_error(chk_bbox(bbox[1:2]), class = "chk_error")
})
})
