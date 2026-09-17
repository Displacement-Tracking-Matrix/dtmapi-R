test_that("baseline_get_admin1 works", {
  skip_on_cran()

  idp_admin1_df <- baseline_get_admin1(
    CountryName = "Sudan",
    Admin1Name = "Blue Nile",
    FromReportingDate = "2020-01-01",
    ToReportingDate = "2024-08-15"
  )
  expect_s3_class(idp_admin1_df, "data.frame")
  expect_true(nrow(idp_admin1_df) > 0)
})
