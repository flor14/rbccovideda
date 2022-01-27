library(testthat)

# test input validation error
test_that("Wrong type of input parameter should throw an error",{
  expect_error(show_summary_stat(1, "2022-01-01"))
  expect_error(show_summary_stat("2022-01-01", 1))
})

test_that("Invalid date format should throw an error",{
  expect_error(show_summary_stat("20200220", "2022-01-01"))
  expect_error(show_summary_stat("2022-01-01", "20200220"))
})

test_that("Invalid startDate and endDate range should throw an error",{
  expect_error(show_summary_stat("2022-02-20", "2021-01-01"))
  expect_error(show_summary_stat("2000-01-01", "2022-01-01"))
  expect_error(show_summary_stat("2000-01-01", "2047-01-01"))
})

# test expected return value
df <- show_summary_stat("2020-02-20", "2022-01-01")
test_that("Return type should be a S3 class tibble", {
  expect_s3_class(df, "tbl_df")
})

summary_cols <- c(
  "total_cases_count", "latest_date", "latest_daily_cases_count",
  "max_date", "max_daily_cases_count", "min_date", "min_daily_cases_count",
  "max_age_group", "max_age_group_count", "min_age_group", "min_age_group_count",
  "max_region", "max_region_count", "min_region", "min_region_count"
)

test_that("Number of columns should be 15", {
  expect_equal(ncol(df), length(summary_cols))
})


