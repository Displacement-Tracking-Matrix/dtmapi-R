# test_that("baseline_get_admin2 works with only admin name param", {
#   skip_on_cran()
#
#   hna_admin2 <- hna_get_admin2(
#     admin0name = "Mozambique"
#   )
#   expect_s3_class(hna_admin2$data, "data.frame")
#   expect_true(nrow(hna_admin2$data) > 0)
#   expect_false(is.data.frame(hna_admin2$pagination))
#   expect_type(hna_admin2$pagination, "list")
# })
#
# test_that(
#   "baseline_get_admin2 works with joint admin name and pagination params",
#   {
#     skip_on_cran()
#
#     hna_admin2 <- hna_get_admin2(
#       admin0name = "Mozambique"
#     )
#     expect_s3_class(hna_admin2$data, "data.frame")
#     expect_true(nrow(hna_admin2$data) > 0)
#     expect_false(is.data.frame(hna_admin2$pagination))
#     expect_type(hna_admin2$pagination, "list")
#   }
# )

test_that(
  "hna_get_admin2 works with joint admin name and year params",
  {
    skip_on_cran()

    hna_admin2 <- hna_get_admin2(
      admin0name = "Mozambique",
      year = 2025
    )
    expect_s3_class(hna_admin2$data, "data.frame")
    expect_true(nrow(hna_admin2$data) > 0)
    expect_false(is.data.frame(hna_admin2$pagination))
    expect_type(hna_admin2$pagination, "list")
  }
)
