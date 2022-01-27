library(tidyverse)
library(here)

#' Show summary statistics of BC covid data
#'
#' Show summary statistics for the Covid19 cases in BC
#'   for the period specified by startDate and endDate (format: YYYY-MM-DD).
#'
#' @param startDate string  The start date of the period (no earlier than '2020-01-29').
#' @param endDate string The end date of the period (no later than today).
#'
#' @return A tibble containing summary statistics with the following columns:
#'   total_cases_count, latest_date, latest_daily_cases_count,
#'   max_date, max_daily_cases_count, min_date, min_daily_cases_count,
#'   max_age_group, max_age_group_count, min_age_group, min_age_group_count,
#'   max_region, max_region_count, min_region, min_region_count
#' @export
#'
#' @examples
#' show_summary_stat("2022-01-01", "2022-01-13")
show_summary_stat <- function(startDate, endDate) {
  # Constant
  earliest_date_value = "2020-01-29"

  # Input Validation
  if(!is.character(startDate))
    stop("startDate should be a string")
  if(!is.character(endDate))
    stop("endDate should be a string")
  if(is.na(as.Date(startDate, format="%Y-%m-%d")))
    stop("startDate is not in valid date format")
  if(is.na(as.Date(endDate, format="%Y-%m-%d")))
    stop("endDate is not in valid date format")
  start_date <- as.Date(startDate, format="%Y-%m-%d")
  end_date <- as.Date(endDate, format="%Y-%m-%d")
  earliest_date = as.Date(earliest_date_value, format="%Y-%m-%d")

  if(start_date > end_date)
    stop("startDate should not be later than endDate")
  if(start_date < earliest_date)
    stop("startDate should not be earlier than 2020-01-29")
  if(end_date > today())
    stop("endDate should not be later than today")


  ## TODO
  df <- get_data()

  df <- read.csv(here("R", "case_data_sample.csv"))


  # total_cases_count
  total_cases_count <- nrow(df)

  # count by Reported Date
  df_by_count <- df |>
    group_by(Reported_Date) |>
    summarize(count = n())


  # latest_date, latest_daily_cases_count
  bycount_len <- nrow(df_by_count)
  latest_record <- df_by_count |>
    slice(bycount_len)
  latest_date <- latest_record$Reported_Date
  latest_daily_cases_count <- latest_record$count

  # max_date, max_daily_cases_count
  max_daily_cases_count <- max(df_by_count$count)
  index <- which.max(df_by_count$count)
  max_date <- df_by_count |>
    slice(index) |>
    pull(Reported_Date)

  # min_date, min_daily_cases_count
  min_daily_cases_count <- min(df_by_count$count)
  index <- which.min(df_by_count$count)
  min_date <- df_by_count |>
    slice(index) |>
    pull(Reported_Date)


  # count by Age Group
  df_by_age <- df |>
    group_by(Age_Group) |>
    summarize(count = n())


  # max_age_group, max_age_group_count
  max_age_group_count <- max(df_by_age$count)
  index <- which.max(df_by_age$count)
  max_age_group <- df_by_age |>
    slice(index) |>
    pull(Age_Group)

  # min_age_group, min_age_group_count
  min_age_group_count <- min(df_by_age$count)
  index <- which.min(df_by_age$count)
  min_age_group <- df_by_age |>
    slice(index) |>
    pull(Age_Group)

  # count by region
  df_by_region <- df |>
    group_by(HA) |>
    summarize(count = n())

  # max_region, max_region_count
  max_region <- max(df_by_region$count)
  index <- which.max(df_by_region$count)
  max_region_count <- df_by_region |>
    slice(index) |>
    pull(HA)

  # min_region, min_region_count
  min_region <- min(df_by_region$count)
  index <- which.min(df_by_region$count)
  min_region_count <- df_by_region |>
    slice(index) |>
    pull(HA)


  # write summary tibble
  df_summary <- tibble(total_cases_count=total_cases_count,
                       latest_date=latest_date,
                       latest_daily_cases_count=latest_daily_cases_count,
                       max_date=max_date,
                       max_daily_cases_count=max_daily_cases_count,
                       min_date=min_date,
                       min_daily_cases_count=min_daily_cases_count,
                       max_age_group=max_age_group,
                       max_age_group_count=max_age_group_count,
                       min_age_group=min_age_group,
                       min_age_group_count=min_age_group_count,
                       max_region=max_region,
                       max_region_count=max_region_count,
                       min_region=min_region,
                       min_region_count=min_region_count
  )
  return(df_summary)
}
