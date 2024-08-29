pkgname <- "dtmapi"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('dtmapi')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("get_all_countries")
### * get_all_countries

flush(stderr()); flush(stdout())

### Name: get_all_countries
### Title: Fetch All Countries
### Aliases: get_all_countries

### ** Examples

## Not run: 
##D # Fetch all countries
##D countries_df <- get_all_countries()
##D head(countries_df)
## End(Not run)



cleanEx()
nameEx("get_all_operations")
### * get_all_operations

flush(stderr()); flush(stdout())

### Name: get_all_operations
### Title: Fetch All Operations
### Aliases: get_all_operations

### ** Examples

## Not run: 
##D # Fetch all operations
##D operations_df <- get_all_operations()
##D head(operations_df)
## End(Not run)



cleanEx()
nameEx("get_idp_admin0_data")
### * get_idp_admin0_data

flush(stderr()); flush(stdout())

### Name: get_idp_admin0_data
### Title: Fetch IDP Admin0 Data
### Aliases: get_idp_admin0_data

### ** Examples

## Not run: 
##D # Fetch IDP data at Admin Level 0
##D idp_admin0_df <- get_idp_admin0_data(CountryName='Ethiopia', FromRoundNumber=1, ToRoundNumber=10)
##D head(idp_admin0_df)
## End(Not run)



cleanEx()
nameEx("get_idp_admin1_data")
### * get_idp_admin1_data

flush(stderr()); flush(stdout())

### Name: get_idp_admin1_data
### Title: Fetch IDP Admin1 Data
### Aliases: get_idp_admin1_data

### ** Examples

## Not run: 
##D # Fetch IDP data at Admin Level 1
##D admin1_data_df <- get_idp_admin1_data(CountryName='Sudan', Admin1Name="Blue Nile")
##D head(admin1_data_df)
## End(Not run)



cleanEx()
nameEx("get_idp_admin2_data")
### * get_idp_admin2_data

flush(stderr()); flush(stdout())

### Name: get_idp_admin2_data
### Title: Fetch IDP Admin2 Data
### Aliases: get_idp_admin2_data

### ** Examples

## Not run: 
##D # Fetch IDP data at Admin Level 2
##D admin2_data_df <- get_idp_admin2_data(Operation='Yemen conflict', CountryName="Yemen")
##D head(admin2_data_df)
## End(Not run)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
