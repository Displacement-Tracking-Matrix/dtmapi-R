#' Fetch HNA Admin2 Data
#'
#' Retrieve Household Needs Assessment data at Admin 2 level based on specified parameters.
#' At least one of the following parameters must be provided:
#' admin0_name or admin0_pcode.
#'
#' @param admin0_name Optional; Name of the country where the data was collected.
#' @param admin0_pcode Optional; Country code (ISO 3166-1 alpha-3).
#' @param population_group Optional; A specific subpopulation (e.g. internally
#'   displaced persons).
#' @param year Optional; Year of data collection.
#' @param page Optional; Pagination, to fetch a certain chunk of the data.
#' @return A list of one data frame and a sub-list.
#'   The former holds the requested data, and the latter is
#'   contains metadata on pagination.
#' @export
#' @examplesIf !identical(Sys.getenv("HNA_DTM_SUBSCRIPTION_KEY"), "")
#' # Fetch HNA data at Admin Level 2
#' hna_admin2 <- hna_get_admin2(admin0_name = "Mozambique", year = 2025)
#' head(hna_admin2)
#' @importFrom httr2 request req_perform req_url_query
#' @importFrom httr2 resp_status resp_body_string req_headers_redacted

hna_get_admin2 <- function(
    admin0_name = NULL,
    admin0_pcode = NULL,
    population_group = NULL,
    year = NULL,
    page = NULL
) {
  api_url <- "https://dtmapi.iom.int/HNA/v1/admin2"

  query_params <- list(
    Admin0Name = admin0_name,
    Admin0Pcode = admin0_pcode,
    PopulationGroup = population_group,
    Year = year,
    Page = page
  )

  tryCatch({
    response <- request(api_url) |>
      req_headers_redacted(
        "Cache-Control" = "no-cache",
        "Ocp-Apim-Subscription-Key" = hna_get_subscription_key()
      ) |>
      req_url_query(!!!query_params) |>
      req_perform()

    if (resp_status(response) != 200) {
      stop("Failed to fetch data. Status code: ", resp_status(response))
    }

    # simplifyVector = TRUE helps to later return a data frame.
    json_data <- resp_body_json(response, simplifyVector = TRUE)

    if (json_data$isSuccess) {
      json_data$result$data <- as.data.frame(
        json_data$result$data
      )
      return(json_data$result)
    } else {
      stop("API error: ", json_data$errorMessages[1])
    }

  }, error = function(e) {
    stop("API request failed: ", e$message)
  })
}
