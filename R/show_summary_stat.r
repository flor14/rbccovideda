#' Show summary statistics of BC covid data
#'
#' Show summary statistics for the Covid19 cases in BC
#'   for the period specified by startDate and endDate (format: YYYY-MM-DD).
#'
#' @param startDate string  The start date of the period (no earlier than '2020-01-29').
#' @param endDate string The end date of the period (no later than today).
#'
#' @return pandas.DataFrame containing summary statistics with the following columns:
#'   total_cases_count, latest_date, latest_daily_cases_count,
#'   max_date, max_daily_cases_count, min_date, min_daily_cases_count,
#'   max_age_group, max_age_group_count, min_age_group, min_age_group_count,
#'   max_region, max_region_count, min_region, min_region_count
#' @export
#'
#' @examples
#' show_summary_stat("2022-01-01", "2022-01-13")
#'
show_summary_stat <- function(startDate, endDate) {

}

