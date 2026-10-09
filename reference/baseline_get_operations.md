# Fetch All Operations

Retrieve all operations for which DTM data is publicly available through
the API.

## Usage

``` r
baseline_get_operations()
```

## Value

A data frame containing the list of all operations.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"), "")
# Fetch all operations
operations_df <- baseline_get_operations()
head(operations_df)
}
```
