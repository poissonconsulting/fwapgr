# Freshwater Atlas Collection's Properties

Get information about a collection's column names.

## Usage

``` r
fwa_collection_properties(
  collection_id,
  nocache = getOption("fwa.nocache", FALSE)
)

fwa_meta_properties(collection_id, nocache = getOption("fwa.nocache", FALSE))
```

## Arguments

- collection_id:

  A character string of the collection id.

- nocache:

  A flag specifying whether or not to cache results.

## Value

A tibble.

## Functions

- `fwa_meta_properties()`: Freshwater Atlas Collection's Properties

  **\[soft-deprecated\]**

## See also

Other collections:
[`fwa_collection()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_query_collection.md),
[`fwa_collections()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collections.md)

## Examples

``` r
fwa_collection_properties("whse_basemapping.fwa_stream_networks_sp")
#> # A tibble: 26 × 3
#>    name                     type   description
#>    <chr>                    <chr>  <chr>      
#>  1 linear_feature_id        number ""         
#>  2 watershed_group_id       number ""         
#>  3 edge_type                number ""         
#>  4 blue_line_key            number ""         
#>  5 watershed_key            number ""         
#>  6 fwa_watershed_code       string ""         
#>  7 local_watershed_code     string ""         
#>  8 watershed_group_code     string ""         
#>  9 downstream_route_measure number ""         
#> 10 length_metre             number ""         
#> # ℹ 16 more rows
```
