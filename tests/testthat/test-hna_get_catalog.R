test_that("hna_get_countries works", {
  skip_on_cran()

  hna_catalog <- hna_get_catalog()

  expect_s3_class(hna_catalog, "data.frame")
  expect_true(nrow(hna_catalog) > 0)
})
