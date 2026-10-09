# Fetch IDP Admin0 Data

Retrieve IDP data at Admin 0 level based on specified parameters. At
least one of the following parameters must be provided: operation,
admin0_name, or admin0_pcode.

## Usage

``` r
baseline_get_admin0(
  operation = NULL,
  admin0_name = NULL,
  admin0_pcode = NULL,
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

- from_reporting_date:

  Optional; Start date for the reporting period (format: 'YYYY-MM-DD').

- to_reporting_date:

  Optional; End date for the reporting period (format: 'YYYY-MM-DD').

- from_round_number:

  Optional; Starting round number for the data collection range.

- to_round_number:

  Optional; Ending round number for the data collection range.

## Value

A data frame containing the IDP Admin0 data matching the specified
criteria.

## Examples

``` r
if (FALSE) { # !identical(Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"), "")
# Fetch IDP data at Admin Level 0
idp_admin0_df <- baseline_get_admin0(admin0_name = "Ethiopia",
                                     from_round_number = 1, 
                                     to_round_number = 10)
head(idp_admin0_df)
}
```
