test_that("baseline_get_admin2 works", {
  skip_on_cran()

  idp_admin2_df <- baseline_get_admin2(
    Operation = "Displacement due to conflict",
    CountryName = "Lebanon"
  )
  expect_s3_class(idp_admin2_df, "data.frame")
  expect_true(nrow(idp_admin2_df) > 0)
})
