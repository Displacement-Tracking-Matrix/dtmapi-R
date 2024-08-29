library(testthat)
library(dtmapi)

test_that("get_idp_admin1_data works", {
  skip_on_cran()  # Skip test on CRAN

  admin1_data_df <- get_idp_admin1_data(CountryName='Sudan', Admin1Name="Blue Nile", FromReportingDate='2020-01-01', ToReportingDate='2024-08-15')
  expect_s3_class(admin1_data_df, "data.frame")
  expect_true(nrow(admin1_data_df) > 0)
})
