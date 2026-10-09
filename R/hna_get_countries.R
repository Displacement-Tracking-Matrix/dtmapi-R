#' Fetch All Countries (HNA)
#'
#' Retrieve all countries for which DTM Household Needs Assessment (HNA)
#' data is publicly available through the API.
#'
#' @return A data frame containing the list of all countries covered.
#' @export
#' @examplesIf !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
#' countries_df <- hna_get_countries()
#' head(countries_df)
#' @importFrom httr2 request req_perform resp_status resp_body_json req_headers_redacted

hna_get_countries <- function() {
  tryCatch({
    api_url <- "https://dtmapi.iom.int/HNA/v1/country-list"

    response <-
      request(api_url) |>
      req_headers_redacted("Cache-Control" = "no-cache",
                           "Ocp-Apim-Subscription-Key" = hna_get_subscription_key()
                          ) |>
      req_perform()

    # Check if the request was successful
    if (resp_status(response) != 200) {
      stop("Failed to fetch data. Status code: ", resp_status(response))
    }

    json_data <- resp_body_json(response, simplifyVector = TRUE)
    as.data.frame(json_data$result)

  }, error = function(e) {
    stop(e$message)
  })
}
