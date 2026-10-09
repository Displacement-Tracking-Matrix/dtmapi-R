# test_that(
#   paste(
#     "baseline_get_admin1 works with joint admin0_name, admin1_name,",
#     "from_reporting_date, and to_reporting_date params"
#   ),
#   {
#     skip_on_cran()
#
#     idp_admin1_df <- baseline_get_admin1(
#       admin0_name = "Sudan",
#       admin1_name = "Blue Nile",
#       from_reporting_date = "2020-01-01",
#       to_reporting_date = "2024-08-15"
#     )
#     expect_s3_class(idp_admin1_df, "data.frame")
#     expect_true(nrow(idp_admin1_df) > 0)
#   }
# )

test_that(
  paste(
    "baseline_get_admin1 works with joint admin0_name,",
    "from_reporting_date, and to_reporting_date params"
  ),
  {
    skip_on_cran()

    idp_admin1_df <- baseline_get_admin1(
      admin0_name = "Sudan",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin1_df, "data.frame")
    expect_true(nrow(idp_admin1_df) > 0)
  }
)

test_that(
  "baseline_get_admin1 works with only admin0_name param",
  {
    skip_on_cran()

    idp_admin1_df <- baseline_get_admin1(
      admin0_name = "Sudan",
      from_reporting_date = "2020-01-01",
      to_reporting_date = "2024-08-15"
    )
    expect_s3_class(idp_admin1_df, "data.frame")
    expect_true(nrow(idp_admin1_df) > 0)
  }
)
