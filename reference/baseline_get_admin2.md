# Fetch IDP Admin2 Data

Retrieve IDP data at Admin 2 level based on specified parameters. At
least one of the following parameters must be provided: operation,
admin0_name, or admin0_pcode.

## Usage

``` r
baseline_get_admin2(
  operation = NULL,
  admin0_name = NULL,
  admin0_pcode = NULL,
  admin1_name = NULL,
  admin1_pcode = NULL,
  admin2_name = NULL,
  admin2_pcode = NULL,
  from_reporting_date = NULL,
  to_reporting_date = NULL,
  from_round_number = 0,
  to_round_number = 0
)
```

## Arguments

- operation:

  Optional; Name of the DTM operation for which the data was collected.

- admin0_name:

  Optional; Name of the country where the data was collected.

- admin0_pcode:

  Optional; Country code (ISO 3166-1 alpha-3).

- admin1_name:

  Optional; Name of level 1 administrative boundaries.

- admin1_pcode:

  Optional; Place code of level 1 administrative boundaries.

- admin2_name:

  Optional; Name of level 2 administrative boundaries.

- admin2_pcode:

  Optional; Place code of level 2 administrative boundaries.

- from_reporting_date:

  Optional; Start date for the reporting period (format: 'YYYY-MM-DD').

- to_reporting_date:

  Optional; End date for the reporting period (format: 'YYYY-MM-DD').

- from_round_number:

  Optional; Starting round number for the data collection range.

- to_round_number:

  Optional; Ending round number for the data collection range.

## Value

A data frame containing the IDP Admin2 data matching the specified
criteria.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"), "")
# Fetch IDP data at Admin Level 2
idp_admin2_df <- baseline_get_admin2(operation = "Yemen conflict", admin0_name = "Yemen")
head(idp_admin2_df)
}
```
