#' Fetch All Countries
#'
#' Retrieve all countries for which DTM data is publicly available through the API.
#'
#' @return A data frame containing the list of all countries.
#' @export
#' @examplesIf !identical(Sys.getenv("DTM_SUBSCRIPTION_KEY"), "")
#' countries_df <- get_all_countries()
#' head(countries_df)
#' @importFrom httr2 request req_perform resp_status resp_body_json req_headers_redacted

get_all_countries <- function() {

  tryCatch({
    api_url <- "https://dtmapi.iom.int/v3/displacement/country-list"

    response <- 
      request(api_url) |>
      req_headers_redacted("Cache-Control" = "no-cache",
                           "Ocp-Apim-Subscription-Key" = get_subscription_key()
                          ) |>
      req_perform()

    # Check if the request was successful
    if (resp_status(response) != 200) {
      stop("Failed to fetch data. Status code: ", resp_status(response))
    }

    json_data <- resp_body_json(response, simplifyVector = TRUE)
    df <- as.data.frame(json_data$result) # as.data.frame() for consistency's sake.

    return(df)

  }, error = function(e) {
    # Handle and report errors
    stop("API request failed: ", e$message)
  })
}
