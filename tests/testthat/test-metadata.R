test_that("fwa_meta_collections", {
  x <- fwa_meta_collections()
  expect_is(x, "tbl")
  expect_identical(names(x), c("collection_id", "description", "extent", "links"))

  expect_true(all(
    c("hydrosheds.hybas_lev12_v1c",
      "usgs.wbdhu12",
      "whse_basemapping.fwa_approx_borders",
      "whse_basemapping.fwa_assessment_watersheds_poly",
      "whse_basemapping.fwa_basins_poly",
      "whse_basemapping.fwa_bays_and_channels_poly",
      "whse_basemapping.fwa_bc_boundary",
      "whse_basemapping.fwa_coastlines_sp",
      "whse_basemapping.fwa_glaciers_poly",
      "whse_basemapping.fwa_islands_poly",
      "whse_basemapping.fwa_lakes_poly",
      "whse_basemapping.fwa_linear_boundaries_sp",
      "whse_basemapping.fwa_manmade_waterbodies_poly",
      "whse_basemapping.fwa_named_streams",
      "whse_basemapping.fwa_named_watersheds_poly",
      "whse_basemapping.fwa_obstructions_sp",
      "whse_basemapping.fwa_rivers_poly",
      "whse_basemapping.fwa_stream_networks_sp",
      "whse_basemapping.fwa_watershed_groups_poly",
      "whse_basemapping.fwa_watershed_groups_subdivided",
      "whse_basemapping.fwa_watersheds_poly",
      "whse_basemapping.fwa_wetlands_poly",
      "whse_basemapping.gba_railway_tracks_sp",
      "whse_basemapping.gba_transmission_lines_sp",
      "whse_basemapping.gns_geographical_names_sp",
      "whse_basemapping.transport_line",
      "whse_basemapping.trim_cultural_lines",
      "whse_basemapping.trim_cultural_points",
      "whse_basemapping.trim_ebm_ocean",
      "whse_fish.fiss_fish_obsrvtn_events_sp",
      "whse_fish.fiss_fish_obsrvtn_pnt_distinct",
      "whse_fish.fiss_fish_obsrvtn_pnt_sp",
      "whse_fish.fiss_fish_obsrvtn_unmatched",
      "whse_fish.fiss_obstacles_pnt_sp",
      "whse_fish.pscis_assessment_svw",
      "whse_fish.pscis_design_proposal_svw",
      "whse_fish.pscis_events_barrier",
      "whse_fish.pscis_habitat_confirmation_svw",
      "whse_fish.pscis_points_all",
      "whse_fish.pscis_remediation_svw")
    %in% x$collection_id))



})

test_that("fwa_meta_properties", {
  x <- fwa_meta_properties("whse_basemapping.fwa_stream_networks_sp")
  expect_is(x, "tbl")
  expect_identical(names(x), c("name", "type", "description"))
})
