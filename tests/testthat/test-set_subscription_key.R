test_that("DTM API subscription key environment variable is changed.", {

  withr::local_envvar(DTM_SUBSCRIPTION_KEY = Sys.getenv("DTM_SUBSCRIPTION_KEY"))
  subscription_key_input <- "dummyValue"
  set_subscription_key(key = subscription_key_input)
  expect_equal(Sys.getenv("DTM_SUBSCRIPTION_KEY"), subscription_key_input)
})
