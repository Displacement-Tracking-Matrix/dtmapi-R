test_that(
  "baseline_get_admin2 works with only admin0_name param",
  {
    skip_on_cran()

    idp_admin2_df <- baseline_get_admin2(
      admin0_name = "Lebanon"
    )
    expect_s3_class(idp_admin2_df, "data.frame")
    expect_true(nrow(idp_admin2_df) > 0)
  }
)

test_that(
  "baseline_get_admin2 works with operation and admin0_name params",
  {
    skip_on_cran()

    idp_admin2_df <- baseline_get_admin2(
      operation = "Displacement due to conflict",
      admin0_name = "Lebanon"
    )
    expect_s3_class(idp_admin2_df, "data.frame")
    expect_true(nrow(idp_admin2_df) > 0)
  }
)

test_that(
  paste(
    "baseline_get_admin2 works with joint admin0_name, admin1_name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin2_df <- baseline_get_admin2(
      admin0_name = "Lebanon",
      admin1_name = "Beirut",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin2_df, "data.frame")
    expect_true(nrow(idp_admin2_df) > 0)
  }
)

test_that(
  paste(
    "baseline_get_admin2 works with joint admin0_name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin2_df <- baseline_get_admin2(
      admin0_name = "Lebanon",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin2_df, "data.frame")
    expect_true(nrow(idp_admin2_df) > 0)
  }
)
