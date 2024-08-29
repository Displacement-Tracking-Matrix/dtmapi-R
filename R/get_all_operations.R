library(httr)
library(jsonlite)

#' Fetch All Operations
#'
#' Retrieve all operations for which DTM data is publicly available through the API.
#'
#' @return A data frame containing the list of all operations.
#' @export
#' @examples
#' # Fetch all operations
#' operations_df <- get_all_operations()
#' head(operations_df)
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom config get
get_all_operations <- function() {

  tryCatch({
    # Load configuration
    api_url <- "https://dtmapi.iom.int/api/Common/GetAllOperationList"

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
