# Freshwater Atlas Index Point

Gets the nearest point on a stream as the crow flies to the coordinates
(within the tolerance).

## Usage

``` r
fwa_index_point(
  x,
  y,
  srid = 4326,
  tolerance = 5000,
  limit = 1,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)
```

## Arguments

- x:

  A number of the x coordinate.

- y:

  A number of the y coordinate.

- srid:

  A positive whole number of the epsg of the coordinates.

- tolerance:

  A number of the tolerance in m.

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

## Value

An sf object.

## Details

To also return the second nearest point on a stream as the crow flies
(within the tolerance) set `limit = 2`.

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_indexpoint.html)

Other functions:
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
fwa_index_point(x = -132.26, y = 53.36)
#> Simple feature collection with 1 feature and 8 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: -132.2547 ymin: 53.35672 xmax: -132.2547 ymax: 53.35672
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 9
#>   bc_ind blue_line_key distance_to_stream downstream_route_measure gnis_name
#> * <lgl>          <int>              <dbl>                    <dbl> <chr>    
#> 1 TRUE       360824839               508.                    1118. NA       
#> # ℹ 4 more variables: linear_feature_id <int>, localcode_ltree <chr>,
#> #   wscode_ltree <chr>, geometry <POINT [°]>
```
