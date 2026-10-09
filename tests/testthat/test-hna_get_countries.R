test_that("hna_get_countries works", {
  skip_on_cran()

  hna_countries <- hna_get_countries()

  expect_s3_class(hna_countries, "data.frame")
  expect_true(nrow(hna_countries) > 0)
})
