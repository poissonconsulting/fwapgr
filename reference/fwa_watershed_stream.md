# Freshwater Atlas Watershed Stream

Gets the upstream stream segment within the fundamental watershed.

## Usage

``` r
fwa_watershed_stream(
  blue_line_key,
  downstream_route_measure = 0,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)
```

## Arguments

- blue_line_key:

  A positive whole number of the stream blue line key.

- downstream_route_measure:

  A positive number of the river metre.

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

This is useful for adding stream network that was not included in the
watershed at measure.

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_watershedstream.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
fwa_watershed_stream(356308001, downstream_route_measure = 10000)
#> Simple feature collection with 1 feature and 1 field
#> Geometry type: MULTILINESTRING
#> Dimension:     XY
#> Bounding box:  xmin: -121.9504 ymin: 49.1401 xmax: -121.9413 ymax: 49.15144
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 2
#>   linear_feature_id                                                     geometry
#> *             <int>                                        <MULTILINESTRING [°]>
#> 1         700730811 ((-121.9504 49.15144, -121.9501 49.15144, -121.9498 49.1513…
```
