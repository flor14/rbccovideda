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
#' plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")
#' plot_hist_by_cond("2021-01-01", "2021-12-31", "Region")
plot_hist_by_cond <- function(startDate, endDate, condition) {

  `%!in%` <- Negate(`%in%`)

  # test input type
  if (!is.character(startDate)) {
    stop("'startDate' should be string.")
  }
  if (!is.character(endDate)) {
    stop("'endDate' should be string.")
  }

  # test input value
  if (!is.character(condition)) {
    stop("'condition' should be either 'Age' or 'Region'.")
  }
  if (condition %!in% c("Age", "Region")) {
    stop("'condition' should be either 'Age' or 'Region'.")
  }
  if (ymd(startDate) >= ymd(endDate)) {
    stop("startDate should not be later than endDate")
  }
  if (ymd(startDate) < ymd("2020-01-29")) {
    stop("startDate should not be earlier than '2020-01-29'")
  }

  covid <- get_data()

  temp <- covid |>
    subset(Reported_Date >= ymd(startDate) & Reported_Date <= ymd(endDate))

  age_order <- c(
    "90+", "80-89", "70-79", "60-69", "50-59", "40-49",
    "30-39", "20-29", "10-19", "<10"
  )
  region_order <- c(
    "Fraser", "Vancouver Coastal", "Vancouver Island",
    "Interior", "Northern", "Out of Canada"
  )

  if (condition == "Age") {
    plot <- temp |>
      ggplot() +
      aes(y = factor(Age_Group, level = rev(age_order))) +
      geom_bar(stat = 'count') +
      ggtitle("Number of Cases by Age Group") +
      labs(x = "Number of Cases",
           y = "Age Group") +
      theme(text =  element_text(size = 20))
  }

  if (condition == "Region") {
    plot <- temp |>
      ggplot() +
      aes(y = factor(HA, level = rev(region_order))) +
      geom_bar(stat = 'count') +
      ggtitle("Number of Cases by Region") +
      labs(x = "Number of Cases",
           y = "Region") +
      theme(text =  element_text(size = 20))
  }

  return(plot)
}
