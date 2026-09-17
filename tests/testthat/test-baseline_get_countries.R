test_that("baseline_get_countries works", {
  skip_on_cran()

  countries_df <- baseline_get_countries()
  expect_s3_class(countries_df, "data.frame")
  expect_true(nrow(countries_df) > 0)
})
