#' Fetch Household Needs Assessment (HNA) Data Catalog
#'
#' Retrieve the HNA data catalog, which provides information on available
#' indicators in the HNA API, including name, desciption, and data type.
#'
#' @return A data frame representing the data catalog for the HNA.
#' @export
#' @examplesIf !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
#' # Retrieve the HNA data catalog
#' operations_df <- hna_get_catalog()
#' head(operations_df)
#' @importFrom httr2 request req_perform resp_status
#' @importFrom httr2 resp_body_json req_headers_redacted

hna_get_catalog <- function() {
  tryCatch({
    api_url <- "https://dtmapi.iom.int/HNA/v1/catalog"
    response <- request(api_url) |>
      req_headers_redacted(
        "Cache-Control" = "no-cache",
        "Ocp-Apim-Subscription-Key" = hna_get_subscription_key()
      ) |>
      req_perform()

    if (resp_status(response) != 200) {
      stop("Failed to fetch data. Status code: ", resp_status(response))
    }

    json_data <- resp_body_json(response, simplifyVector = TRUE)

    as.data.frame(json_data)

  }, error = function(e) {
    stop("API request failed: ", e$message)
  })
}
