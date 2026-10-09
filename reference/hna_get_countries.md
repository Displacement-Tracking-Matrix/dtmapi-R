# Fetch All Countries (HNA)

Retrieve all countries for which DTM Household Needs Assessment (HNA)
data is publicly available through the API.

## Usage

``` r
hna_get_countries()
```

## Value

A data frame containing the list of all countries covered.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
countries_df <- hna_get_countries()
head(countries_df)
}
```
