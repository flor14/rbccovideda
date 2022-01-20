show_summary_stat <- function(df, startDate, endDate) {

#' Shows summary statistics for the Covid19 cases in BC stored in the specified dataframe,
#'   for the period specified by startDate and endDate (format: YYYY-MM-DD).
#'
#' @param df:data.frame The dataframe donwloaded from BC CDC dataset with the columns:
#'   "Reported_Date","HA","Sex","Age_Group","Classification_Reported". 
#' @param startDate:string  The start date of the period (no earlier than '2020-01-29').
#' @param endDate:string The end date of the period (no later than today).
#' 
#' @return dataframe  A data frame containing summary statistics with the following columns:
#'   total_cases_count, latest_date, latest_daily_cases_count, 
#'   max_date, max_daily_cases_count, min_date, min_daily_cases_count, 
#'   max_age_group, max_age_group_count, min_age_group, min_age_group_count,
#'   max_region, max_region_count, min_region, min_region_count
#' @export
#'
#' @examples
#' df <- data.frame(Reported_Date=c("2022-01-01", "2022-01-01"), HA=c("Vancouver Coastal", "Vancouver Coastal"),
#'   Sex=c("F", "M"), Age_Group=c("50-59", "50-59"), Classification_Report=c("Lab-diagnosed","Lab-diagnosed"))
#' show_summary_stat(df, "2022-01-01", "2022-01-13")
#' 
#' 
}

