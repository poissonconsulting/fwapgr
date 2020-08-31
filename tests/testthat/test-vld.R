with_mock_api({
test_that("vld_function_template", {
  path <- "fwapg/collections"
  url <- modify_url(api_url(), path = path)
  resp <- GET(url)

  expect_true(vld_response_json(resp))
  expect_true(vld_response_status(resp))
  expect_true(vld_response_gateway(resp))
})
})
