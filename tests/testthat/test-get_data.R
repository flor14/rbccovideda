sample_df <- readr::read_csv(
    here::here("tests", "case_data_sample.csv"),
    show_col_types = FALSE)

actual_df <- get_data()

test_that("column names of downloaded data do match those of sample data", {
  expect_equal(
    sample_df |> colnames(),
    actual_df |> colnames()
    )
})

test_that("data types names of downloaded data do match those of sample data", {
  expect_equal(
    sample_df |> sapply(class),
    actual_df |> sapply(class)
  )
})

test_that("most recent data from 7 or more days ago", {
  expect_true(
    Sys.Date() - actual_df$Reported_Date |> max() < 7
  )
})
