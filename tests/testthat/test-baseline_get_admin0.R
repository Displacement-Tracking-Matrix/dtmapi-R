test_that("baseline_get_admin0 works", {
  skip_on_cran()

  idp_admin0_df <- baseline_get_admin0(
    CountryName = "Ethiopia",
    FromRoundNumber = 1,
    ToRoundNumber = 10
  )
  expect_s3_class(idp_admin0_df, "data.frame")
  expect_true(nrow(idp_admin0_df) > 0)
})
