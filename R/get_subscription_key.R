#' Retrieval of an API subscription key from the environment.
#'
#' The DTM API subscription key is returned, provided that it is available in
#' the R session as an environment variable. Users will usually need to set 
#' the DTM_SUBSCRIPTION_KEY environment variable through a .Renviron file (or
#' other means) or by calling `set_subscription_key()`.
#' 
#' On the other hand, if the TESTTHAT environment variable is true, indicating
#' that unit tests are being run by the package maintainers, then the
#' subscription key is returned through different means.
#' @return A string representing a given subscription key for the DTM API.
#' @export
#' @examples
#' \dontrun{
#' # Generally, calling set_subscription_key() without the key as an argument is best, 
#' # as the user can then be prompted to input the key without typing it directly
#' # into the console, making it more secure and less likely to exposed.
#' set_subscription_key()
#' }
#' @importFrom httr2 secret_decrypt
#' @importFrom testthat is_testing
get_subscription_key <- function() {
  key <- Sys.getenv("DTM_SUBSCRIPTION_KEY")
  if (!identical(key, "")) {
    return(key)
  }

  if (is_testing()) {
    return(testing_key())
  } else {
    stop(
      paste("No API key found, please supply with set_subscription_key() or",
            "otherwise specifying the DTM_SUBSCRIPTION_KEY environment variable.")
    )
  }
}

testing_key_encrypted <- "ABlJntCNw5CXFlQEWd9NcuyOB05Agzn7RI4Ua6YMe9kXxqZUpVwHMRpEtnreEFK4"

testing_key <- function() {
  secret_decrypt(encrypted = testing_key_encrypted, 
                 key = "DTMAPIR_KEY" # Environment variable name as a string
                )
}