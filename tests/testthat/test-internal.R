invalid_sf <- function() {
  structure(
    tibble::tibble(area_ha = 1),
    class = c("sf", "tbl_df", "tbl", "data.frame")
  )
}

valid_sf <- function() {
  sf::st_sf(
    area_ha = 1,
    geometry = sf::st_sfc(sf::st_point(c(-120, 50)), crs = 4326)
  ) |>
    tibble::as_tibble() |>
    sf::st_as_sf()
}

test_that("is_valid_sf", {
  expect_true(is_valid_sf(valid_sf()))
  expect_false(is_valid_sf(invalid_sf()))
  expect_false(is_valid_sf(tibble::tibble(area_ha = 1)))
  x <- valid_sf()
  attr(x, "sf_column") <- "geom"
  expect_false(is_valid_sf(x))
})

test_that("invalid responses are retried", {
  calls <- 0L
  waits <- numeric()
  local_mocked_bindings(
    pgf_function_result = function(...) {
      calls <<- calls + 1L
      if (calls < 3L) {
        return(invalid_sf())
      }
      valid_sf()
    },
    .package = "pgfeatureserv"
  )
  local_mocked_bindings(wait_seconds = function(seconds) {
    waits <<- c(waits, seconds)
  })
  x <- fwa_watershed_at_measure(356308001, downstream_route_measure = 1000)
  expect_true(is_valid_sf(x))
  expect_identical(calls, 3L)
  expect_identical(waits, c(1, 2))
})

test_that("valid responses are not retried", {
  calls <- 0L
  local_mocked_bindings(
    pgf_collection_features = function(...) {
      calls <<- calls + 1L
      valid_sf()
    },
    .package = "pgfeatureserv"
  )
  x <- fwa_query_collection("whse_basemapping.fwa_named_streams")
  expect_true(is_valid_sf(x))
  expect_identical(calls, 1L)
})

test_that("persistent invalid responses error", {
  calls <- 0L
  local_mocked_bindings(
    pgf_function_result = function(...) {
      calls <<- calls + 1L
      invalid_sf()
    },
    .package = "pgfeatureserv"
  )
  local_mocked_bindings(wait_seconds = function(seconds) NULL)
  expect_error(
    fwa_watershed_at_measure(356308001, downstream_route_measure = 1000),
    "The API returned a response without a geometry column after 3 attempts"
  )
  expect_identical(calls, 3L)
})
