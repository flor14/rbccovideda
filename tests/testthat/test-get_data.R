sample_df <- readr::read_csv(
  "../case_data_sample.csv",
  show_col_types = FALSE)

actual_df <- get_data()

testthat::test_that("column names of downloaded data do match those of sample data", {
  expect_equal(
    sample_df |> colnames(),
    actual_df |> colnames()
    )
})

testthat::test_that("data types names of downloaded data do match those of sample data", {
  expect_equal(
    sample_df |> sapply(class),
    actual_df |> sapply(class)
  )
})

testthat::test_that("most recent data from 7 or more days ago", {
  expect_true(
    Sys.Date() - actual_df$Reported_Date |> max() < 7
  )
})
