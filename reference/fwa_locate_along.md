# Freshwater Atlas Locate Along

Gets the point on a stream corresponding to the river metre (downstream
route measure).

## Usage

``` r
fwa_locate_along(
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

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_locatealong.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
fwa_locate_along(356308001, downstream_route_measure = 10000)
#> Simple feature collection with 1 feature and 0 fields
#> Geometry type: POINT
#> Dimension:     XYZ
#> Bounding box:  xmin: -121.9504 ymin: 49.15144 xmax: -121.9504 ymax: 49.15144
#> z_range:       zmin: 10.5 zmax: 10.5
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 1
#>                      geometry
#> *                 <POINT [°]>
#> 1 Z (-121.9504 49.15144 10.5)
```
