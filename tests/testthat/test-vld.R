test_that("vld_function_template", {
  path <- "fwa/v1/list_layers"
  url <- modify_url(api_url(), path = path)
  resp <- GET(url)

  expect_true(vld_response_json(resp))
  expect_true(vld_response_status(resp))
  expect_true(vld_response_gateway(resp))
})
