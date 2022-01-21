#' Plots the number of Covid19 cases with respect to the condition(per Age Group
#' or Region) using histogram for the period specified by startDate and endDate
#'
#' @param startDate string the start date of the period (no earlier than '2020-01-29')
#'
#' @param endDate string the end date of the period (no later than today)
#'
#' @param condition string available condition - Age, Region
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' bccovideda.plotHistByCond("2021-01-01", "2021-12-31", "Age")
#' bccovideda.plotHistByCond("2021-01-01", "2021-12-31", "Region")
plot_hist_by_cond <- function(startDate, endDate, condition) {

}
