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

  chk::expect_chk_error(chk_response_status(bad_resp), "GitHub API request failed 404.")

})
