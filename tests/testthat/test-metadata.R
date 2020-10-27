test_that("fwa_list_tables", {
  x <- fwa_list_tables()
  expect_is(x, "tbl")
  expect_identical(names(x), c("table", "schema", "collection_id", "extent"))

  expect_true(all(
    c("hybas_lev12_v1c", "wbdhu12", "fwa_approx_borders", "fwa_assessment_watersheds_poly",
      "fwa_basins_poly", "fwa_bays_and_channels_poly", "fwa_bc_boundary",
      "fwa_coastlines_sp", "fwa_glaciers_poly", "fwa_islands_poly",
      "fwa_lakes_poly", "fwa_linear_boundaries_sp", "fwa_manmade_waterbodies_poly",
      "fwa_named_streams", "fwa_named_watersheds_poly", "fwa_obstructions_sp",
      "fwa_rivers_poly", "fwa_stream_networks_sp", "fwa_stream_networks_sp_deleteme",
      "fwa_watershed_groups_poly", "fwa_watershed_groups_subdivided",
      "fwa_watersheds_poly", "fwa_wetlands_poly", "gba_railway_tracks_sp",
      "gba_transmission_lines_sp", "gns_geographical_names_sp", "transport_line",
      "trim_cultural_lines", "trim_cultural_points", "trim_ebm_ocean",
      "fiss_fish_obsrvtn_events_sp", "fiss_fish_obsrvtn_pnt_distinct",
      "fiss_fish_obsrvtn_pnt_sp", "fiss_fish_obsrvtn_unmatched", "fiss_obstacles_pnt_sp",
      "pscis_assessment_svw", "pscis_design_proposal_svw", "pscis_events_barrier",
      "pscis_habitat_confirmation_svw", "pscis_points_all", "pscis_remediation_svw")
    %in% x$table))

  expect_true(all(
    c("hydrosheds", "usgs", "whse_basemapping", "whse_fish")
    %in% x$schema))
})

test_that("fwa_list_columns", {
  x <- fwa_list_columns("fwa_stream_networks_sp")
  expect_is(x, "tbl")
  expect_identical(names(x), c("name", "type", "description"))
})
