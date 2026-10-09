#' Fetch IDP Admin1 Data
#'
#' Retrieve IDP data at Admin 1 level based on specified parameters.
#' At least one of the following parameters must be provided: operation, admin0_name, or admin0_pcode.
#'
#' @param operation Optional; Name of the DTM operation for which the data was collected.
#' @param admin0_name Optional; Name of the country where the data was collected.
#' @param admin0_pcode Optional; Country code (ISO 3166-1 alpha-3).
#' @param admin1_name Optional; Name of level 1 administrative boundaries.
#' @param admin1_pcode Optional; Place code of level 1 administrative boundaries.
#' @param from_reporting_date Optional; Start date for the reporting period (format: 'YYYY-MM-DD').
#' @param to_reporting_date Optional; End date for the reporting period (format: 'YYYY-MM-DD').
#' @param from_round_number Optional; Starting round number for the data collection range.
#' @param to_round_number Optional; Ending round number for the data collection range.
#' @return A data frame containing the IDP Admin1 data matching the specified criteria.
#' @export
#' @examplesIf !identical(Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"), "")
#' # Fetch IDP data at Admin Level 1
#' idp_admin1_df <- baseline_get_admin1(admin0_name = "Sudan", admin1_name = "Blue Nile")
#' head(idp_admin1_df)
#' @importFrom httr2 request req_perform req_url_query resp_status resp_body_json req_headers_redacted

baseline_get_admin1 <- function(
    operation = NULL,
    admin0_name = NULL,
    admin0_pcode = NULL,
    admin1_name = NULL,
    admin1_pcode = NULL,
    from_reporting_date = NULL,
    to_reporting_date = NULL,
    from_round_number = NULL,
    to_round_number = NULL
) {
  api_url <- "https://dtmapi.iom.int/v3/displacement/admin1"

  query_params <- list(
    Operation = operation,
    CountryName = admin0_name,
    Admin0Pcode = admin0_pcode,
    Admin1Name = admin1_name,
    Admin1Pcode = admin1_pcode,
    FromReportingDate = from_reporting_date,
    ToReportingDate = to_reporting_date,
    FromRoundNumber = from_round_number,
    ToRoundNumber = to_round_number
  )

  tryCatch({
    response <-
      request(api_url) |>
      req_headers_redacted("Cache-Control" = "no-cache",
                           "Ocp-Apim-Subscription-Key" = baseline_get_subscription_key()
                          ) |>
      req_url_query(!!!query_params) |>
      req_perform()

    if (resp_status(response) != 200) {
      stop("Failed to fetch data. Status code: ", resp_status(response))
    }

    # Retrieve content as parsed JSON: simplifyVector helps to later return a dataframe.
    json_data <- resp_body_json(response, simplifyVector = TRUE)

    if (json_data$isSuccess) {
      return(as.data.frame(json_data$result))
    } else {
      # Handle API-specific errors
      stop("API error: ", json_data$errorMessages[1])
    }

  }, error = function(e) {
    # Handle and report errors
    stop("API request failed: ", e$message)
  })
}
