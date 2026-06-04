# Query Freshwater Atlas Collection

Query a collection from the freshwater atlas.

## Usage

``` r
fwa_collection(
  collection_id,
  filter = NULL,
  limit = 10000,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)

fwa_query_collection(
  collection_id,
  filter = NULL,
  limit = 10000,
  offset = 0,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  sortby = NULL,
  groupby = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)
```

## Arguments

- collection_id:

  A character string of the collection id.

- filter:

  A named vector or list of the filter(s) to apply, where the list names
  correspond to column names and the list values correspond to the
  desired value, e.g. `list(gnis_name = "Sangan River")`.

- limit:

  A positive whole number indicating the maximum number of features to
  return.

- bbox:

  A vector of four numbers indicating bounding box to limit output
  features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.

- properties:

  A vector of strings of the column names to include. If NULL (default),
  all columns are retained.

- transform:

  A character vector with the name of the [*valid
  transform*](https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29)
  function followed by the parameter values (e.g. c("ST_Simplify", 100))

- epsg:

  A positive whole number of the epsg to transform features to.

- nocache:

  A flag specifying whether or not to cache results.

- offset:

  A positive whole number indicating the offset of start of returned
  results.

- sortby:

  A string that sorts the response items by a property. Default is
  ascending but property name can be prepended with '-' to indicate
  descending.

- groupby:

  A string of the property name (i.e., column name) to group response
  features by. This would typically be used with an aggregate transform
  function.

## Value

An sf object.

## Functions

- `fwa_collection()`: Query Freshwater Atlas Collection

  **\[soft-deprecated\]**

## See also

Other collections:
[`fwa_collection_properties()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collection_properties.md),
[`fwa_collections()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collections.md)

## Examples

``` r
collection_id <- "whse_basemapping.fwa_approx_borders"
filter <- list(border = "USA_49")
fwa_query_collection(collection_id, filter = filter)
#> Simple feature collection with 1 feature and 2 fields
#> Geometry type: LINESTRING
#> Dimension:     XY
#> Bounding box:  xmin: -123.3 ymin: 49.00024 xmax: -114.06 ymax: 49.00025
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 3
#>   approx_border_id border                                               geometry
#> *            <dbl> <chr>                                        <LINESTRING [°]>
#> 1               10 USA_49 (-123.3 49.00025, -123.29 49.00025, -123.28 49.00025,…

collection_id <- "whse_basemapping.fwa_stream_networks_sp"
filter <- list(gnis_name = "Sangan River")
fwa_query_collection(collection_id, filter = filter)
#> Simple feature collection with 21 features and 26 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: -131.9972 ymin: 53.94994 xmax: -131.9168 ymax: 54.0332
#> z_range:       zmin: 1 zmax: 67
#> Geodetic CRS:  WGS 84
#> # A data frame: 21 × 27
#>    blue_line_key blue_line_key_50k downstream_route_mea…¹ edge_type feature_code
#>  *         <int>             <int>                  <dbl>     <dbl> <chr>       
#>  1     360879896               130                 16588.      1000 GA24850140  
#>  2     360879896                11                  1266.      1000 GA24850000  
#>  3     360879896               130                 17516.      1050 GA24850140  
#>  4     360879896                11                 13068.      1000 GA24850000  
#>  5     360879896                11                  6808.      1000 GA24850000  
#>  6     360879896                11                  7384.      1000 GA24850000  
#>  7     360879896                11                 13911.      1000 GA24850000  
#>  8     360879896                11                 13776.      1000 GA24850000  
#>  9     360879896                11                 12161.      1000 GA24850000  
#> 10     360879896                11                  4721.      1000 GA24850000  
#> # ℹ 11 more rows
#> # ℹ abbreviated name: ¹​downstream_route_measure
#> # ℹ 22 more variables: feature_source <chr>, fwa_watershed_code <chr>,
#> #   gnis_id <int>, gnis_name <chr>, gradient <dbl>, left_right_tributary <chr>,
#> #   length_metre <dbl>, linear_feature_id <int>, local_watershed_code <chr>,
#> #   localcode_ltree <chr>, stream_magnitude <dbl>, stream_order <dbl>,
#> #   upstream_route_measure <dbl>, waterbody_key <dbl>, …
```
