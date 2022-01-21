#' Plots the line chart of regional Covid19 cases over the period specified by
#' startDate and endDate (format: YYYY-MM-DD). The default argument value
#' for region is 'all', showing the total number of Covid19 cases in BC.
#'
#' @param startDate string the start date of the period (no earlier than '2020-01-29')
#' @param endDate string the end date of the period (no later than today)
#' @param region vector or string = 'all' Default value is string 'all' - displaying all regions.
#' Other available values: combination of list of strings from available regions -
#' Fraser, Vancouver Coastal, Vancouver Island, Interior, Northern, Out of Canada
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' plotLineByDate("2021-01-01", "2021-12-31")
#' plotLineByDate("2021-01-01", "2021-12-31", region = c('Fraser'))
plot_line_by_date <- function(startDate, endDate, region='all') {}
