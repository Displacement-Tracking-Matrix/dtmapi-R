test_that(
  paste(
    "baseline_get_admin1 works with joint country_name, admin1name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin1_df <- baseline_get_admin1(
      country_name = "Sudan",
      admin1name = "Blue Nile",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin1_df, "data.frame")
    expect_true(nrow(idp_admin1_df) > 0)
  }
)

test_that(
  paste(
    "baseline_get_admin1 works with joint country_name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin1_df <- baseline_get_admin1(
      country_name = "Sudan",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin1_df, "data.frame")
    expect_true(nrow(idp_admin1_df) > 0)
  }
)

test_that(
  "baseline_get_admin1 works with only country_name param",
  {
    skip_on_cran()

    idp_admin1_df <- baseline_get_admin1(
      country_name = "Sudan",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin1_df, "data.frame")
    expect_true(nrow(idp_admin1_df) > 0)
  }
)
