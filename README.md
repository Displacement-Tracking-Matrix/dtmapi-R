<br>

<p align="center">
  <img alt="DTM Logo" src="https://dtm.iom.int/themes/custom/dtm_global/logo.svg" width="400">
</p>

-----------------

# dtmapi

## About
`dtmapi` is a R package developed by [Displacement Tracking Matrix (DTM)](https://dtm.iom.int/). This package allows the humanitarian community, academia, media, government, and non-governmental organizations to utilize the data collected by DTM. It provides non-sensitive Internally Displaced Person (IDP) figures, aggregated at the country, Admin 1 (states, provinces, or equivalent), and Admin 2 (smaller subnational administrative areas) levels. Country Name and Operation can be found in this [data coverage](https://dtm.iom.int/data-and-analysis/dtm-api/data-coverage) matrix. 

## Installation
`dtmapi` can be installed as below:
```sh
install.packages("devtools")
devtools::install_github("Displacement-Tracking-Matrix/dtmapi-R")
```

## Load Package
After installation, load the package using library():
```sh
library(dtmapi)
```

## Usage
Here's a quick example to get you started:
```python
import dtmapi

# Get all countries for which DTM data is publicly available through the API.
countries_df <- get_all_countries()
head(countries_df)

# Get all operations for which DTM data is publicly available through the API.
operations_df <- get_all_operations()
head(operations_df)

# Get IDP Admin 0 Data for Ethiopia from Round 1 to Round 10
idp_admin0_df <- get_idp_admin0_data(CountryName='Ethiopia', FromRoundNumber=1, ToRoundNumber=10)
head(idp_admin0_df)

# Get IDP Admin 1 Data for Sudan from reporting date 2020-01-01 to 2024-08-15
admin1_data_df <- get_idp_admin1_data(CountryName='Sudan', Admin1Name="Blue Nile", FromReportingDate='2020-01-01', ToReportingDate='2024-08-15')
head(admin1_data_df)

# Get IDP Admin 2 Data for Lebanon
admin2_data_df <- get_idp_admin2_data(Operation="Displacement due to conflict", CountryName='Lebanon')
head(admin2_data_df)
```
## Documentation
Comprehensive documentation is available at [dtmapi.readthedocs.io](https://dtmapi.readthedocs.io/en/latest/index.html).

## Source Code
The source code for `dtmapi` is available on [GitHub](https://github.com/Displacement-tracking-Matrix/dtmapi-R).

Feel free to explore the repository, contribute, or raise any issues you may encounter.

## Contact
For any questions or feedback, please reach out to us at [dtmsupport@iom.int](mailto:dtmsupport@iom.int).
