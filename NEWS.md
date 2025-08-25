# dtmapi (development version)

# dtmapi 0.1.0

* Version 3 of the DTM API requires the use of a valid subscription key in order
to make requests and retrieve data from it. A subscription key may be obtained 
through the [DTM API Portal](https://dtm-apim-portal.iom.int/).

To manage this requirement in the `dtmapi` package, a new function, 
`set_subscription_key()`, is introduced. Calling it without arguments prompts 
the user to enter their subscription key, which will make the key available for
a given R session through the environment variable `DTM_SUBSCRIPTION_KEY`.

The functions which make API calls (such as `get_idp_admin1_data()`) have been
changed to make the subscription key that is assigned to the environment
variable part of the API request, since a valid key is a requirement for 
the API.

* Introduces get_subscription_key(), which is mostly used to develop and test 
the `dtmapi` package, but it may technically be used by users to conveniently 
return the currently available subscription key. HOWEVER, beware that the string
it returns is plain text and is more easily exposed, e.g. exposed to anyone 
visually observing your machine.
