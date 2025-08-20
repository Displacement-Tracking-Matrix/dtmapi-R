
<!-- README.md is generated from README.Rmd. Please edit that file -->

<br>

<p align="center">

<img alt="DTM Logo" src="https://dtm.iom.int/themes/custom/dtm_global/logo.svg" width="400">
</p>

------------------------------------------------------------------------

# dtmapi

<!-- badges: start -->

[![R-CMD-check](https://github.com/Displacement-Tracking-Matrix/dtmapi-R/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Displacement-Tracking-Matrix/dtmapi-R/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## About

`dtmapi` is an R package developed by [Displacement Tracking Matrix
(DTM)](https://dtm.iom.int/). This package allows the humanitarian
community, academia, media, government, and non-governmental
organizations to utilize the data collected by DTM. It provides
non-sensitive Internally Displaced Person (IDP) figures, aggregated at
the country, Admin 1 (states, provinces, or equivalent), and Admin 2
(smaller subnational administrative areas) levels. Country Names and
Operations can be found in this [data
coverage](https://dtm.iom.int/data-and-analysis/dtm-api/data-coverage)
matrix.

Please find more information about [DTM API
here.](https://dtm.iom.int/data-and-analysis/dtm-api)

## Installation

The `dtmapi` package is available on
[CRAN](https://CRAN.R-project.org/package=dtmapi) and can be installed
as follows:

``` r
install.packages("dtmapi")
```

## Pre-Requisites

Using `dtmapi` requires a subscription key. To obtain one, register with
the [DTM API Portal](https://dtm-apim-portal.iom.int/signin) and follow
the instructions there.

The subscription key is secret and should not be exposed. Once it is
obtained, the subscription key should be set for your current R session,
assuming that the `dtmapi` package is installed. To do this, use run the
following in R:

``` r
dtmapi::set_subscription_key()
```

At this point, the user will be prompted to input the key (hidden) into
a pop-up field.

## Usage

When the subscription key is set, data on internal displacement may be
retrieved through any of the following functions:

- `get_idp_admin_0_data()`
- `get_idp_admin_1_data()`
- `get_idp_admin_2_data()`

These all retrieve data from the DTM API and return said data in the
form of data frames.

Certain parameters have to be specified to any of these, the most
important of which are either the `CountryName` or the `OperationName`.
For information on the other parameters and indeed all functions in the
`dtmapi`, [see the documentation for any of the functions
here.](reference/index.html)

As a representative example of the earlier mentioned functions, see the
following use of `get_idp_admin_1_data()`:

``` r
# Load the package
library(dtmapi)

idp_admin1_df <- get_idp_admin1_data(CountryName = "Sudan",
                                     Admin1Name = "Blue Nile",
                                     FromReportingDate = "2020-01-01",
                                     ToReportingDate = "2024-08-15")

# Display the first few rows of the data frame
head(idp_admin1_df)
#>        id              operation admin0Name admin0Pcode admin1Name admin1Pcode
#> 1 3989697        Darfur conflict      Sudan         SDN  Blue Nile        SD08
#> 2 3989698        Darfur conflict      Sudan         SDN  Blue Nile        SD08
#> 3 3989699        Darfur conflict      Sudan         SDN  Blue Nile        SD08
#> 4 3989700        Darfur conflict      Sudan         SDN  Blue Nile        SD08
#> 5 3968566 Armed Clashes in Sudan      Sudan         SDN  Blue Nile        SD08
#> 6 3968567 Armed Clashes in Sudan      Sudan         SDN  Blue Nile        SD08
#>   numPresentIdpInd       reportingDate yearReportingDate monthReportingDate
#> 1            81693 2021-03-30T00:00:00              2021                  3
#> 2           130958 2021-12-31T00:00:00              2021                 12
#> 3           151156 2022-01-31T00:00:00              2022                  1
#> 4           152656 2022-03-30T00:00:00              2022                  3
#> 5              260 2023-04-28T00:00:00              2023                  4
#> 6              715 2023-05-07T00:00:00              2023                  5
#>   roundNumber         displacementReason numberMales numberFemales
#> 1           2                   Conflict          NA            NA
#> 2           3 Conflict; Natural disaster          NA            NA
#> 3           4                   Conflict          NA            NA
#> 4           5                   Conflict          NA            NA
#> 5           2                   Conflict          NA            NA
#> 6           3                   Conflict          NA            NA
#>   idpOriginAdmin1Name idpOriginAdmin1Pcode assessmentType
#> 1           Blue Nile                 SD08             BA
#> 2           Blue Nile                 SD08             BA
#> 3       Not available        Not available             BA
#> 4           Blue Nile                 SD08             BA
#> 5         West Darfur                 SD04             BA
#> 6            Khartoum                 SD01             BA
```

Since the available country names or operation names are often necessary
to know of, they can be obtained by using the `get_all_countries()` and
`get_all_operations()` functions, which do not take any arguments.

``` r
# Load the package
library(dtmapi)
countries_df <- get_all_countries()

# Display the first few rows of the data frame
head(countries_df)
#>                         admin0Name admin0Pcode
#> 1                      Afghanistan         AFG
#> 2              Antigua and Barbuda         ATG
#> 3                    Bahamas (the)         BHS
#> 4                            Benin         BEN
#> 5 Bolivia (Plurinational State of)         BOL
#> 6                     Burkina Faso         BFA
```

``` r
# Load the package
library(dtmapi)

operations_df <- get_all_operations()

# Display the first few rows of the data frame
head(operations_df)
#>                                   operation operationStatus          admin0Name
#> 1                           Aceh earthquake        Inactive           Indonesia
#> 2                    Armed Clashes in Sudan          Active               Sudan
#> 3          Armed Clashes in Sudan (Monthly)          Active               Sudan
#> 4         Armed Clashes in Sudan (Overview)          Active               Sudan
#> 5                       Arrivals in Armenia        Inactive Republic of Armenia
#> 6 Bahamas (the) - Hurricane Dorian Response        Inactive       Bahamas (the)
#>   admin0Pcode
#> 1         IDN
#> 2         SDN
#> 3         SDN
#> 4         SDN
#> 5         ARM
#> 6         BHS
```

## User Guide

The information given here is further elaborated on in the user guide to
getting started with `dtmapi`, which is available
[here](articles/user_guide.html)

## Source Code

The source code for `dtmapi` is available on
[GitHub](https://github.com/Displacement-tracking-Matrix/dtmapi-R).

Feel free to explore the repository, contribute, or raise any issues you
may encounter.

## Contact

For any questions or feedback, please reach out to us at
<dtmdataconsolidation@iom.int>.
