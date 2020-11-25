# fwapgr 0.1.0.9001

- Add `end_measure = NULL` argument to `fwa_locate_along_interval()` and rename start to start_measure.
- replace fwa_stream_at_measure with fwa_watershed_stream to be consistent with API function names
- add transform argument to fwa_collection
- rename column argument to properties
- add limit, offset, bbox, properties, and transform arguments to API function wrappers
- replaced fwa_list_tables with fwa_meta_collections and no longer separates table and schema from collection_id
- replace fwa_list_columns with fwa_meta_properties and accepts collection_id not table and schema
- fwa_nearest_stream removed from API. Replaced with fwa_index_point.
- Moved wrapper functionality to freshwateratlasbc.
- fwa_search_gnis_streams() and fwa_list_gnis_streams() now take gnis_name = ".*" instead of NULL as default argument
- test back to R 3.6


# fwapgr 0.1.0.9000

- Allow `fwa_collection()` to accept 'whse_fish' schema.

# fwapgr 0.1.0

- Added several new functions to access new API at 'hillcrestgeo.ca/fwapg' (`fwa_collection`, `fwa_stream_gnis`, `fwa_watershed_at_measure`, `fwa_stream_at_measure`, `fwa_watershed_hex`, `fwa_nearest_stream`).
- Defunct several functions using old API at 'hillcrestgeo.ca/fwa/v1' (`fwa_feature`, `fwa_watershed`, `fwa_gnis_streams`).

# fwapgr 0.0.1

- Initial release.
