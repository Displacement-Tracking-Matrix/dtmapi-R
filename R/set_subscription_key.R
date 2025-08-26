#' Set the user's API subscription key in order to make the API calls.
#'
#' The API will be stored as an environmental variable named "DTM_API_KEY".
#' @param key 
#' Either NULL or a string representing the key. NULL is preferable: using it 
#' will prompt the user to type the subscription key in a graphical user 
#' interface that masks it.
#' @return Nothing. Creates / overwrites an environmental variable as a side effect.
#' @export
#' @examples
#' \dontrun{
#' # Generally, calling set_subscription_key() without the key as an argument is best, 
#' # as the user can then be prompted to input the key without typing it directly
#' # into the console, making it more secure and less likely to exposed.
#' set_subscription_key()
#' }
#' @param ...
#' Any argument here is ignored. It exists solely to discourage typing in the
#' subscription key directly, 
#' e.g. `set_subscription_key("mysubscriptionkeyhere")`, since doing so will 
#' only result in the user being prompted to type the subscription key in a 
#' graphical user interface. Rather, if the user wishes to set the subscription key 
#' through the console / by programmatic means, then the user must explicitly 
#' pass the argument to the `key` parameter as a named parameter.
#' E.g. `set_subscription_key(key = "mysubscriptionkeyhere")`.
#' 
#' @importFrom askpass askpass

set_subscription_key <- function(..., key = NULL) {
  if (is.null(key)) {
    Sys.setenv("DTM_SUBSCRIPTION_KEY" = askpass("Please enter your subscription key."))
  } else {
    Sys.setenv("DTM_SUBSCRIPTION_KEY" = key)
  }
}