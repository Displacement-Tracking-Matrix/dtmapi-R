library(httr)
library(jsonlite)
#' Fetch All Countries
#'
#' Retrieve all countries for which DTM data is publicly available through the API.
#'
#' @return A data frame containing the list of all countries.
#' @export
#' @examples
#' # Fetch all countries
#' countries_df <- get_all_countries()
#' head(countries_df)
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom config get
get_all_countries <- function() {

  tryCatch({
    # Retrieve the API URL from the configuration file
    api_url <- "https://dtmapi.iom.int/api/Common/GetAllCountryList"

    # Send GET request to the API
    response <- GET(api_url)

    # Check if the request was successful
    if (status_code(response) != 200) {
      stop("Failed to fetch data. Status code: ", status_code(response))
    }

    # Parse the JSON content and extract the result as a data frame
    data <- content(response, "text")
    df <- fromJSON(data, flatten = TRUE)$result

    # Return the data frame
    return(df)

  }, error = function(e) {
    # Handle and report errors
    stop("API request failed: ", e$message)
  })
}
