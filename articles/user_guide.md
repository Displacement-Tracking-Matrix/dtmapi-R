# User Guide

## Introduction

The `dtmapi` package provides functions to interact with the
Displacement Tracking Matrix (DTM) API. This vignette demonstrates how
to use the package’s functions to fetch data from the API.

Please note that despite the overarching term DTM API, there are, in
fact, two distinct APIs which are currently available. These are the
Baseline API (which is what simply “the DTM API” *USED* to refer to) and
the Humanitarian Needs Assessment (HNA) API.

Reflecting this, this R package comes with a set of functions that are
clearly named so as to distinguish between these two APIs. Those
prefixed with `baseline_` and those prefixed with `hna_`.

The functions covered include:

- [`baseline_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_countries.md)

- [`baseline_get_operations()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_operations.md)

- [`baseline_get_admin0()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin0.md)

- [`baseline_get_admin1()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin1.md)

- [`baseline_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin2.md)

- [`hna_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_countries.md)

- [`hna_get_catalog()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_catalog.md)

- [`hna_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_admin2.md)

Notice that as a consequence of there being two distinct APIs, there are
also two distinct subscription key-related function pairs. This will
become clear in their respective technical documentations.

## Install Package

The latest version of the `dtmapi` package can be installed directly
from [GitHub](https://github.com/Displacement-Tracking-Matrix/dtmapi-R)
using the following command (make sure the `remotes` package is
installed):

``` r

remotes::install_github("Displacement-Tracking-Matrix/dtmapi-R")
```

## Load Package

After installation, load the package using library():

``` r

library(dtmapi)
```

## Setting the Subscription Keys

After creating a subscription key on <https://dtm-apim-portal.iom.int>,
that key needs to be given to R. The package has two sets of functions,
each with its own subscription key: the `baseline_` functions use the
`BASELINE_DTM_SUBSCRIPTION_KEY` environment variable, and the `hna_`
functions use the `HNA_DTM_SUBSCRIPTION_KEY` environment variable. There
are three main ways to set these, as described below. The examples use
the Baseline key; the HNA key works the same way, with
[`hna_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_set_subscription_key.md)
and `HNA_DTM_SUBSCRIPTION_KEY` in place of
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md)
and `BASELINE_DTM_SUBSCRIPTION_KEY`.

### 1. Using `baseline_set_subscription_key()`: interactive, safe option

By calling
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md),
after which the user is prompted to input the key into a pop-up field.

``` r

baseline_set_subscription_key()
```

Note that if the environment is not interactive, it is likely for the
user to receive an error message instead, such as in the case of using
Google Colab. In such cases see the other options described further
below.

### 2. Using `baseline_set_subscription_key()`: the non-interactive, discouraged option

If the interactive option above fails for the user, such that there is
an error instead of a pop-up, the user may rely on passing their key
directly into
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md)
by naming the `key` parameter.

``` r

# Specifying `key` is required for non-interactive use.
baseline_set_subscription_key(key = "mysubscriptionkey")
```

This is basically using
[`baseline_set_subscription_key()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_set_subscription_key.md)
as a wrapper for setting up the environment variable
`BASELINE_DTM_SUBSCRIPTION_KEY` using base R’s
[`Sys.setenv()`](https://rdrr.io/r/base/Sys.setenv.html), as shown
below:

``` r

Sys.setenv("BASELINE_DTM_SUBSCRIPTION_KEY" = "mysubscriptionkey")
```

Please note that by doing this in, say, a Google Colab script, .R
script, or Jupyter notebook, you are leaving a secret (your subscription
key) exposed and available for anyone to read with ease. This is why
this option is not recommended, but it will allow you to get things
working faster if you are not familiar with managing secrets in a
non-interactive context.

### 3. Setting up the environment variable with good secrets management

If one would like to avoid re-inputting the subscription key for each R
session, and they would like to set the subscription key in a way that
is both non-interactive and safer, then this becomes a matter of knowing
the right secrets management practices depending on where R is being
used (e.g. whether that is in a local desktop, a cloud-based programming
environment, a server, etc.).

In the vast majority of cases, the approach is the fundamentally the
same: anything that directly stores your key should be **separate from
the rest of your code**, and your code accesses the key through an
**environment variable**. That is the main principle to the most common
way to manage your secrets. What differs by where R is being used is
*how* this principle is applied. Below, the user guide will mostly focus
on how this is handled when using a code editor such as VSCode, RStudio,
or Positron, as this is the most common case. If these do not reflect
your circumstance or use-case, then researching how to manage secrets
generally for that circumstance should suffice, as the only thing
specific about doing so for the `dtmapi` package is just the names of
the environment variables, `BASELINE_DTM_SUBSCRIPTION_KEY` and
`HNA_DTM_SUBSCRIPTION_KEY`.

**Using a code editor such as VSCode or RStudio on a desktop:**

Use a `.Renviron` file to set the keys. You can create it from scratch,
and its contents should look something like this:

    BASELINE_DTM_SUBSCRIPTION_KEY = "mysubscriptionkey"
    HNA_DTM_SUBSCRIPTION_KEY = "myothersubscriptionkey"
    Some_Other_Env_Var = "something else if desired"

For this to work robustly, your `.Renviron` should be in the same
*working directory* that you would like to use for your R sessions
(i.e. it should be in the same location or folder that you would like
your R sessions to use as a default). You can see which folder that
currently is by running:

``` r

getwd()
```

This is important to know because, if your R session can start in the
same working directory that the `.Renviron` file is located in, then the
environment variables specified there are automatically loaded for your
R session!

Usually, your choice of working directory is best managed by creating an
*R project* or equivalent (such as *VS Code workspaces*). That is to
say, one should have a dedicated folder for their specific project, the
R sessions they run should make that folder the working directory, and
`.Renviron` should be placed there as well. For more information,
depending on whether you use RStudio, VSCode, or Positron, see: [Using
RStudio
Projects](https://support.posit.co/hc/en-us/articles/200526207-Using-RStudio-Projects),
[What is a VS Code
Workspace?](https://code.visualstudio.com/docs/editing/workspaces), or
[Launching Positron in a
workspace](https://positron.posit.co/migrate-rstudio-rproj.html#launching-positron-in-a-workspace).

If one is unfamiliar and struggling to create the .Renviron file, then
one quick way to proceed with editing the `.Renviron` file or placing it
in their project directory (if they have one) is by calling the
following line of code (make sure the `usethis` package is installed):

``` r

usethis::edit_r_environ("project")
```

Or, if one is not using an R project or equivalent, then this is an
option as well, though using the general user directory is not
recommended as it is likely to get lost:

``` r

usethis::edit_r_environ("user")
```

Remember: NEVER SHARE THE `.RENVIRON` FILE.

## Get All Countries

The
[`baseline_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_countries.md)
function retrieves a list of all countries from the DTM API.

``` r

# Fetch all countries
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

## Get All Operations

The
[`baseline_get_operations()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_operations.md)
function retrieves a list of all operations from the DTM API.

``` r

# Fetch all operations
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

## Get IDP Data at Admin Level 0

The
[`baseline_get_admin0()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin0.md)
function retrieves Internally Displaced Persons (IDP) data aggregated at
the country level.

``` r

# Fetch IDP data at Admin Level 0
idp_admin0_df <-
  baseline_get_admin0(admin0_name = "Ethiopia",
                      from_round_number = 0,
                      to_round_number = 10)

# Display the first few rows of the data frame
head(idp_admin0_df)
#>                operation admin0Name admin0Pcode numPresentIdpInd
#> 1 Countrywide monitoring   Ethiopia         ETH             7823
#> 2 Countrywide monitoring   Ethiopia         ETH            21668
#> 3 Countrywide monitoring   Ethiopia         ETH            15420
#> 4 Countrywide monitoring   Ethiopia         ETH           772924
#> 5 Countrywide monitoring   Ethiopia         ETH           308300
#> 6 Countrywide monitoring   Ethiopia         ETH             6984
#>         reportingDate yearReportingDate monthReportingDate roundNumber
#> 1 2017-12-31T00:00:00              2017                 12           8
#> 2 2017-12-31T00:00:00              2017                 12           8
#> 3 2017-12-31T00:00:00              2017                 12           8
#> 4 2017-12-31T00:00:00              2017                 12           8
#> 5 2017-12-31T00:00:00              2017                 12           8
#> 6 2017-12-31T00:00:00              2017                 12           8
#>   displacementReason numberMales numberFemales idpOriginAdmin1Name
#> 1           Conflict        4088          3735                Afar
#> 2           Conflict       11490         10178              Amhara
#> 3           Conflict        7046          8374             Gambela
#> 4           Conflict      375655        397269              Oromia
#> 5           Conflict      152469        155831              Somali
#> 6           Conflict        3170          3814              Tigray
#>   idpOriginAdmin1Pcode assessmentType
#> 1                 ET02             SA
#> 2                 ET03             SA
#> 3                 ET12             SA
#> 4                 ET04             SA
#> 5                 ET05             SA
#> 6                 ET01             SA
```

## Get IDP Data at Admin Level 1

The
[`baseline_get_admin1()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin1.md)
function retrieves IDP data aggregated at Admin Level 1.

``` r

# Fetch IDP data at Admin Level 1
idp_admin1_df <-
  baseline_get_admin1(admin0_name = "Sudan",
                      admin1_name = "Blue Nile",
                      from_reporting_date = "2020-01-01",
                      to_reporting_date = "2024-08-15")
#> Error in `value[[3L]]()`:
#> ! API request failed: HTTP 500 Internal Server Error.

# Display the first few rows of the data frame
head(idp_admin1_df)
#> Error:
#> ! object 'idp_admin1_df' not found
```

## Get IDP Data at Admin Level 2

The
[`baseline_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/baseline_get_admin2.md)
function retrieves IDP data aggregated at Admin Level 2.

``` r

# Fetch IDP data at Admin Level 2
idp_admin2_df <-
  baseline_get_admin2(operation = "Displacement due to conflict",
                      admin0_name = "Lebanon")

# Display the first few rows of the data frame
head(idp_admin2_df)
#>      id                    operation admin0Name admin0Pcode        admin1Name
#> 1   162 Displacement due to conflict    Lebanon         LBN Baalbek-El Hermel
#> 2  1106 Displacement due to conflict    Lebanon         LBN Baalbek-El Hermel
#> 3  2378 Displacement due to conflict    Lebanon         LBN       El Nabatieh
#> 4  3207 Displacement due to conflict    Lebanon         LBN             North
#> 5  4256 Displacement due to conflict    Lebanon         LBN Baalbek-El Hermel
#> 6 12152 Displacement due to conflict    Lebanon         LBN     Mount Lebanon
#>   admin1Pcode  admin2Name admin2Pcode numPresentIdpInd       reportingDate
#> 1         LB8     Baalbek        LB21               20 2023-10-15T00:00:00
#> 2         LB8     Baalbek        LB21               95 2023-10-15T00:00:00
#> 3         LB4 El Nabatieh        LB44              207 2023-10-15T00:00:00
#> 4         LB5  El Batroun        LB52                3 2023-10-15T00:00:00
#> 5         LB8     Baalbek        LB21               31 2023-10-15T00:00:00
#> 6         LB3       Chouf        LB33               16 2023-10-15T00:00:00
#>   yearReportingDate monthReportingDate roundNumber displacementReason
#> 1              2023                 10           2           Conflict
#> 2              2023                 10           2           Conflict
#> 3              2023                 10           2           Conflict
#> 4              2023                 10           2           Conflict
#> 5              2023                 10           2           Conflict
#> 6              2023                 10           1           Conflict
#>   numberMales numberFemales idpOriginAdmin1Name idpOriginAdmin1Pcode
#> 1          NA            NA               South                  LB6
#> 2          NA            NA              Beirut                  LB1
#> 3          NA            NA         El Nabatieh                  LB4
#> 4          NA            NA         El Nabatieh                  LB4
#> 5          NA            NA       Mount Lebanon                  LB3
#> 6          NA            NA               South                  LB6
#>   assessmentType
#> 1             BA
#> 2             BA
#> 3             BA
#> 4             BA
#> 5             BA
#> 6             BA
```

## Get All Countries (HNA)

The
[`hna_get_countries()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_countries.md)
function retrieves a list of all countries covered by the DTM Household
Needs Assessment (HNA) API.

``` r

# Fetch all HNA countries
hna_countries_df <- hna_get_countries()

# Display the first few rows of the data frame
head(hna_countries_df)
#>   admin0Pcode  admin0Name                  populationGroup
#> 1         SDN       Sudan IDP, IDP returnee, Non displaced
#> 2         SSD South Sudan IDP, IDP returnee, Non displaced
#> 3         MOZ  Mozambique IDP, IDP returnee, Non displaced
#> 4         NGA     Nigeria IDP, IDP returnee, Non displaced
#>                    years
#> 1       2022, 2024, 2025
#> 2 2022, 2023, 2024, 2025
#> 3       2022, 2024, 2025
#> 4                   2022
```

## Get the HNA Data Catalog

The
[`hna_get_catalog()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_catalog.md)
function retrieves the HNA data catalog, which provides information on
the indicators available in the HNA API, including their name,
description, and data type.

``` r

# Fetch the HNA data catalog
hna_catalog_df <- hna_get_catalog()

# Display the first few rows of the data frame
head(hna_catalog_df)
#>                     indicator_category
#> 1              Reason for displacement
#> 2         Food Consumption Score (FCS)
#> 3         Household Hunger Scale (HHS)
#> 4         Household Hunger Scale (HHS)
#> 5 Reduced Coping Strategy Index (rCSI)
#> 6 Reduced Coping Strategy Index (rCSI)
#>                                                 indicator_name
#> 1 pct_hh_m2671_hh_ddc_disp_reason_primary_disaster_non_climate
#> 2                                      mean_i0007_hh_fcs_score
#> 3                          pct_hh_i0006_hh_hhs_category_severe
#> 4                     pct_hh_i0006_hh_hhs_category_very_severe
#> 5                         pct_hh_i0002_hh_rcsi_category_phase1
#> 6                         pct_hh_i0002_hh_rcsi_category_phase2
#>                                                                                                                  description
#> 1 Percentage of IDP households that reported a non-climate-related disaster (e.g., landslide) as the reason for displacement
#> 2                                                      Mean (average) food consumption score. The score ranges from 0 to 112
#> 3                                                   Percentage of households whose household hunger scale category is Severe
#> 4                                              Percentage of households whose household hunger scale category is Very Severe
#> 5                                          Percentage of households whose reduced coping strategy index falls within Phase 1
#> 6                                          Percentage of households whose reduced coping strategy index falls within Phase 2
#>   data_type
#> 1     Float
#> 2     Float
#> 3     Float
#> 4     Float
#> 5     Float
#> 6     Float
```

## Get HNA Data at Admin Level 2

The
[`hna_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_admin2.md)
function retrieves HNA data at Admin Level 2. Unlike the other
functions, it returns a list of two elements: `data`, a data frame
holding the requested data, and `pagination`, a list containing metadata
on pagination.

``` r

# Fetch HNA data at Admin Level 2
hna_admin2 <-
  hna_get_admin2(admin0_name = "Nigeria",
                 year = 2025)

# Display the first few rows of the data
head(hna_admin2$data)
#> data frame with 0 columns and 0 rows

# Display the pagination metadata
hna_admin2$pagination
#> $currentPage
#> [1] 1
#> 
#> $totalPages
#> [1] 0
#> 
#> $totalItems
#> [1] 0
#> 
#> $hasNextPage
#> [1] FALSE
#> 
#> $hasPreviousPage
#> [1] FALSE
```

## Function Arguments

Here are the descriptions for the arguments used in the functions of the
`dtmapi` package to get data.

### Baseline Arguments

For the `baseline_` functions that get IDP data, at least one of the
following parameters must be provided: operation, admin0_name, or
admin0_pcode.

- **operation**: Optional; Name of the DTM operation for which the data
  was collected.

- **admin0_name**: Optional; Name of the country where the data was
  collected.

- **admin0_pcode**: Optional; Country code (ISO 3166-1 alpha-3).

- **admin1_name**: Optional; Name of level 1 administrative boundaries.

- **admin1_pcode**: Optional; Place code of level 1 administrative
  boundaries.

- **admin2_name**: Optional; Name of level 2 administrative boundaries.

- **admin2_pcode**: Optional; Place code of level 2 administrative
  boundaries.

- **from_reporting_date**: Optional; Start date for the reporting period
  (format: ‘YYYY-MM-DD’).

- **to_reporting_date**: Optional; End date for the reporting period
  (format: ‘YYYY-MM-DD’).

- **from_round_number**: Optional; Starting round number for the data
  collection range.

- **to_round_number**: Optional; Ending round number for the data
  collection range.

### HNA Arguments

For
[`hna_get_admin2()`](https://displacement-tracking-matrix.github.io/dtmapi-R/reference/hna_get_admin2.md),
at least one of the following parameters must be provided: admin0_name
or admin0_pcode.

- **admin0_name**: Optional; Name of the country where the data was
  collected.

- **admin0_pcode**: Optional; Country code (ISO 3166-1 alpha-3).

- **population_group**: Optional; A specific subpopulation
  (e.g. internally displaced persons).

- **year**: Optional; Year of data collection.

- **page**: Optional; Pagination, to fetch a certain chunk of the data.
