# Fetch Household Needs Assessment (HNA) Data Catalog

Retrieve the HNA data catalog, which provides information on available
indicators in the HNA API, including name, desciption, and data type.

## Usage

``` r
hna_get_catalog()
```

## Value

A data frame representing the data catalog for the HNA.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
# Retrieve the HNA data catalog
operations_df <- hna_get_catalog()
head(operations_df)
}
```
