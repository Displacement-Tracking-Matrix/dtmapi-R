# Fetch HNA Admin2 Data

Retrieve Household Needs Assessment data at Admin 2 level based on
specified parameters. At least one of the following parameters must be
provided: admin0_name or admin0_pcode.

## Usage

``` r
hna_get_admin2(
  admin0_name = NULL,
  admin0_pcode = NULL,
  population_group = NULL,
  year = NULL,
  page = NULL
)
```

## Arguments

- admin0_name:

  Optional; Name of the country where the data was collected.

- admin0_pcode:

  Optional; Country code (ISO 3166-1 alpha-3).

- population_group:

  Optional; A specific subpopulation (e.g. internally displaced
  persons).

- year:

  Optional; Year of data collection.

- page:

  Optional; Pagination, to fetch a certain chunk of the data.

## Value

A list of one data frame and a sub-list. The former holds the requested
data, and the latter is contains metadata on pagination.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
# Fetch HNA data at Admin Level 2
hna_admin2_df <- hna_get_admin2(admin0_name = "Mozambique", year = 2025)
head(hna_admin2)
}
```
