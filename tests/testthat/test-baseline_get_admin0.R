test_that(
  paste(
    "baseline_get_admin0 works with joint country_name,",
    "from_round_number, and to_round_number params"
  ),
  {
    skip_on_cran()

    idp_admin0_df <- baseline_get_admin0(
      country_name = "Ethiopia",
      from_round_number = 1,
      to_round_number = 10
    )
    expect_s3_class(idp_admin0_df, "data.frame")
    expect_true(nrow(idp_admin0_df) > 0)
  }
)

test_that(
  paste(
    "baseline_get_admin0 works with joint country_name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin0_df <- baseline_get_admin0(
      country_name = "Ethiopia",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin0_df, "data.frame")
    expect_true(nrow(idp_admin0_df) > 0)
  }
)
