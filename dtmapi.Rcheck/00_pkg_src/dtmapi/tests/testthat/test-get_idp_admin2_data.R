library(testthat)
library(dtmapi)

test_that("get_idp_admin2_data works", {
  skip_on_cran()  # Skip test on CRAN

  admin2_data_df <- get_idp_admin2_data(Operation="Displacement due to conflict", CountryName='Lebanon')
  expect_s3_class(admin2_data_df, "data.frame")
  expect_true(nrow(admin2_data_df) > 0)
})
