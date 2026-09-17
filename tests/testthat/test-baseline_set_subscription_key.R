test_that("Baseline DTM API subscription key environment variable changed.", {
  withr::local_envvar(
    DTM_SUBSCRIPTION_KEY = Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY")
  )
  subscription_key_input <- "dummyValue"
  baseline_set_subscription_key(key = subscription_key_input)
  expect_equal(
    Sys.getenv("BASELINE_DTM_SUBSCRIPTION_KEY"),
    subscription_key_input
  )
})
