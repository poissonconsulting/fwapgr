test_that("operation functions work", {
  table = "fwa_stream_networks_sp"
  sql = "gnis_name = 'Cowichan River'"
  x <- fwa_bbox(table, filter = sql)
  x <- fwa_centroid(table, filter = sql)
})
