# dtmapi

  

![DTM Logo](reference/figures/dtm_global_logo.svg)

------------------------------------------------------------------------

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

Please note that despite the overarching term DTM API, there are, in
fact, two distinct APIs which are currently available. These are the
Baseline API (which is what simply “the DTM API” *USED* to refer to) and
the Humanitarian Needs Assessment (HNA) API. Reflecting this, the
functions in `dtmapi` are clearly named so as to distinguish between
these two APIs: those prefixed with `baseline_` and those prefixed with
`hna_`.

Please find more information about [DTM API
here.](https://dtm.iom.int/data-and-analysis/dtm-api)

## Installation

The latest version of the `dtmapi` package can be installed directly
from [GitHub](https://github.com/Displacement-Tracking-Matrix/dtmapi-R)
as follows (make sure the `remotes` package is installed):

``` r

remotes::install_github("Displacement-Tracking-Matrix/dtmapi-R")
```

## Pre-Requisites

Using `dtmapi` requires a subscription key. To obtain one, register with
the [DTM API Portal](https://dtm-apim-portal.iom.int/signin) and follow
the instructions there.

As a consequence of there being two distinct APIs, there are also two
distinct subscription keys: the `baseline_` functions use the
`BASELINE_DTM_SUBSCRIPTION_KEY` environment variable, and the `hna_`
functions use the `HNA_DTM_SUBSCRIPTION_KEY` environment variable.

The subscription key is secret and should not be exposed. Once it is
obtained, the subscription key should be set for your current R session,
assuming that the `dtmapi` package is installed. To do this, the
relevant environment variable needs to be defined. This can be done
either interactively or non-interactively. The examples below use the
Baseline key; the HNA key works the same way, with
[`hna_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_set_subscription_key.md)
in place of
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md).

The interactive option is to call
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md),
like so:

``` r

dtmapi::baseline_set_subscription_key()
```

At this point, the user will be prompted to input the key (hidden) into
a pop-up field.

Some environments are non-interactive, and so running the above will
likely result in an error. In such a case, the subscription key may be
set non-interactively, by specifying the `key` parameter, like so:

``` r

# Specifying `key` is required for non-interactive use.
dtmapi::baseline_set_subscription_key(key = "mysubscriptionkey")
```

However, this option is discouraged and should be avoided as much as
possible, because it blatantly exposes the subscription key. The best
option would be to engage in good secrets management practices, such as
by using a .Renviron file (if applicable). Basic secrets management, and
the issue of setting the subscription key in general, is elaborated on
in more detail in
[`vignette("user_guide")`](https://displacement-tracking-matrix.github.io/dtmapi-R/articles/user_guide.md).

## Usage

When the Baseline subscription key is set, data on internal displacement
may be retrieved through any of the following functions:

- [`baseline_get_admin0()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin0.md)
- [`baseline_get_admin1()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin1.md)
- [`baseline_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin2.md)

These all retrieve data from the DTM API and return said data in the
form of data frames.

Certain parameters have to be specified to any of these, the most
important of which are either the `admin0_name` or the `operation`. For
information on the other parameters and indeed all functions in
`dtmapi`, [see the documentation
here.](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/index.html)

As a representative example of the earlier mentioned functions, see the
following use of
[`baseline_get_admin1()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin1.md):

``` r

# Load the package
library(dtmapi)

idp_admin1_df <- baseline_get_admin1(admin0_name = "Sudan",
                                     from_reporting_date = "2020-01-01",
                                     to_reporting_date = "2024-08-15")

# Display the first few rows of the data frame
head(idp_admin1_df)
#>      id       operation admin0Name admin0Pcode     admin1Name admin1Pcode
#> 1 20177 Darfur conflict      Sudan         SDN Central Darfur        SD06
#> 2 20178 Darfur conflict      Sudan         SDN Central Darfur        SD06
#> 3 29481 Darfur conflict      Sudan         SDN South Kordofan        SD07
#> 4 20254 Darfur conflict      Sudan         SDN    East Darfur        SD05
#> 5 20255 Darfur conflict      Sudan         SDN    East Darfur        SD05
#> 6 20256 Darfur conflict      Sudan         SDN    East Darfur        SD05
#>   numPresentIdpInd       reportingDate yearReportingDate monthReportingDate
#> 1           349709 2020-01-30T00:00:00              2020                  1
#> 2            27500 2020-01-30T00:00:00              2020                  1
#> 3           217683 2020-01-30T00:00:00              2020                  1
#> 4            92867 2020-01-30T00:00:00              2020                  1
#> 5             6230 2020-01-30T00:00:00              2020                  1
#> 6              600 2020-01-30T00:00:00              2020                  1
#>   roundNumber displacementReason numberMales numberFemales idpOriginAdmin1Name
#> 1           1           Conflict          NA            NA      Central Darfur
#> 2           1           Conflict          NA            NA        North Darfur
#> 3           1           Conflict          NA            NA      South Kordofan
#> 4           1           Conflict          NA            NA         East Darfur
#> 5           1           Conflict          NA            NA        North Darfur
#> 6           1           Conflict          NA            NA        South Darfur
#>   idpOriginAdmin1Pcode assessmentType
#> 1                 SD06             BA
#> 2                 SD02             BA
#> 3                 SD07             BA
#> 4                 SD05             BA
#> 5                 SD02             BA
#> 6                 SD03             BA
```

Since the available country names or operation names are often necessary
to know of, they can be obtained by using the
[`baseline_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_countries.md)
and
[`baseline_get_operations()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_operations.md)
functions, which do not take any arguments.

``` r

# Load the package
library(dtmapi)
countries_df <- baseline_get_countries()

# Display the first few rows of the data frame
head(countries_df)
#>                         admin0Name admin0Pcode
#> 1                      Afghanistan         AFG
#> 2              Antigua and Barbuda         ATG
#> 3                    Bahamas (the)         BHS
#> 4                       Bangladesh         BGD
#> 5                            Benin         BEN
#> 6 Bolivia (Plurinational State of)         BOL
```

``` r

# Load the package
library(dtmapi)

operations_df <- baseline_get_operations()

# Display the first few rows of the data frame
head(operations_df)
#>                           operation operationStatus           admin0Name
#> 1                   Aceh earthquake        Inactive            Indonesia
#> 2            Armed Clashes in Sudan          Active                Sudan
#> 3  Armed Clashes in Sudan (Monthly)          Active                Sudan
#> 4 Armed Clashes in Sudan (Overview)          Active                Sudan
#> 5               Arrivals in Armenia        Inactive  Republic of Armenia
#> 6                As-Sweida Conflict          Active Syrian Arab Republic
#>   admin0Pcode
#> 1         IDN
#> 2         SDN
#> 3         SDN
#> 4         SDN
#> 5         ARM
#> 6         SYR
```

When the HNA subscription key is set, HNA data at Admin Level 2 may be
retrieved through
[`hna_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_admin2.md).
Unlike the `baseline_` functions, it returns a list of two elements:
`data`, a data frame holding the requested data, and `pagination`, a
list containing metadata on pagination.

``` r

# Load the package
library(dtmapi)

hna_admin2 <- hna_get_admin2(admin0_name = "Nigeria",
                             year = 2025)

# Display the first few rows of the data
head(hna_admin2$data)
#> data frame with 0 columns and 0 rows
```

The countries covered by the HNA API, and the indicators available in
it, can be obtained by using the
[`hna_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_countries.md)
and
[`hna_get_catalog()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_catalog.md)
functions, which do not take any arguments.

## User Guide

The information given here is further elaborated on in the user guide to
getting started with `dtmapi`, which is accessible through
[`vignette("user_guide")`](https://displacement-tracking-matrix.github.io/dtmapi-R/articles/user_guide.md).

## Source Code

The source code for `dtmapi` is available on
[GitHub](https://github.com/Displacement-tracking-Matrix/dtmapi-R).

Feel free to explore the repository, contribute, or raise any issues you
may encounter.

## Contact

For any questions or feedback, please reach out to us at
<dtmdataconsolidation@iom.int>.
