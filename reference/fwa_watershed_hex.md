# Freshwater Atlas Watershed Hex

Gets a 25m hexagon grid covering the fundamental watershed in which the
river metre lies.

## Usage

``` r
fwa_watershed_hex(
  blue_line_key,
  downstream_route_measure = 0,
  limit = 10000,
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

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_watershedhex.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
if (FALSE) { # \dontrun{
fwa_watershed_hex(356308001, downstream_route_measure = 10000)
} # }
```
