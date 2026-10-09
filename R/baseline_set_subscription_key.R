#' Set the user's Baseline API subscription key in order to make the API calls.
#'
#' The API subscription key will be stored as an environment variable named
#' "BASELINE_DTM_SUBSCRIPTION_KEY".
#' @param key
#' Either NULL or a string representing the key. NULL is preferable: using it
#' will prompt the user to type the subscription key in a graphical user
#' interface that masks it.
#' @return Nothing. Creates / overwrites an environment variable
#' as a side effect.
#' @export
#' @examples
#' \dontrun{
#' # Generally, calling `baseline_set_subscription_key()` without the key as an
#' # argument is best, as the user can then be prompted to input the key without
#' # typing it directly into the console, making it more secure and less
#' # likely to exposed.
#' baseline_set_subscription_key()
#' }
#' @param ...
#' Any argument here is ignored. It exists solely to discourage typing in the
#' subscription key directly,
#' e.g. `baseline_set_subscription_key("mysubscriptionkeyhere")`, since doing
#' so will only result in the user being prompted to type the subscription key
#' in a graphical user interface. Rather, if the user wishes to set the
#' subscription key through the console / by programmatic means, then the user
#' must explicitly pass the argument to the `key` parameter as a
#' named parameter.
#' E.g. `baseline_set_subscription_key(key = "mysubscriptionkeyhere")`.
#'
#' @importFrom askpass askpass

baseline_set_subscription_key <- function(..., key = NULL) {
  if (is.null(key)) {
    message_to_user <- "Please enter your baseline API subscription key."
    Sys.setenv("BASELINE_DTM_SUBSCRIPTION_KEY" = askpass(message_to_user))
  } else {
    Sys.setenv("BASELINE_DTM_SUBSCRIPTION_KEY" = key)
  }
}
