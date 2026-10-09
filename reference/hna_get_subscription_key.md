# Retrieval of a HNA API subscription key from the environment.

The HNA DTM API subscription key is returned, provided that it is
available in the R session as an environment variable. Users will
usually need to set the HNA_DTM_SUBSCRIPTION_KEY environment variable
through a .Renviron file (or other means) or by calling
[`hna_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_set_subscription_key.md).

## Usage

``` r
hna_get_subscription_key()
```

## Value

A string representing a given subscription key for the DTM API.

## Details

On the other hand, if the TESTTHAT environment variable is true,
indicating that unit tests are being run by the package maintainers,
then the subscription key is returned through different means.

## Examples

``` r
if (FALSE) { # \dontrun{
# Generally, calling `hna_set_subscription_key()` without the key as an
# argument is best, as the user can then be prompted to input the key without
# typing it directly into the console, making it more secure and less
# likely to be exposed.
hna_set_subscription_key()
} # }
```
