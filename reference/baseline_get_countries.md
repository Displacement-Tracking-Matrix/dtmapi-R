# Fetch All Countries

Retrieve all countries for which DTM data is publicly available through
the API.

## Usage

``` r
baseline_get_countries()
```

## Value

A data frame containing the list of all countries.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"), "")
countries_df <- baseline_get_countries()
head(countries_df)
}
```
