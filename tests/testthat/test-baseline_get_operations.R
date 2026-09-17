test_that("baseline_get_operations works", {
  skip_on_cran()

  operations_df <- baseline_get_operations()
  expect_s3_class(operations_df, "data.frame")
  expect_true(nrow(operations_df) > 0)
})
