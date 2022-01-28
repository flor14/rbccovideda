#' Line plot of Covid19 cases
#'
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
#' plot_line_by_date("2021-01-01", "2021-12-31")
#' plot_line_by_date("2021-01-01", "2021-12-31", region = c('Fraser'))
plot_line_by_date <- function(startDate, endDate, region='all') {

   # get the data
   covid <- rbccovideda::get_data()

   # check date format
   if (is.na(as.Date(startDate, "%Y-%m-%d")) || is.na(as.Date(endDate, "%Y-%m-%d"))){
     stop("Incorrect date format, should be YYYY-MM-DD")
   }

   # check input type
   if (!is.character(startDate)) {
     stop("'startDate' should be character.")
   }
   if (!is.character(endDate)) {
     stop("'endDate' should be character.")
   }
   if (!is.character(region)) {
     stop("'region' should be character vector.")
   }

   # check argument values
   if (endDate > max(covid$Reported_Date)) {
     stop("'endDate' cannot be later than the day the package is called.")
   }

   if (startDate < covid$Reported_Date[1]) {
     stop("'startDate' cannot be earlier than the day the first case was recorded.")
   }

   if (startDate > endDate) {
     stop("'endDate' cannot be earlier than the 'startDate'.")
   }
   if (length(region) == 1 &
       !(region[1] == 'all' || (region %in% unique(covid$HA)))) {
     stop("'region' must be valid BC region - Either combination of `Fraser, Vancouver Coastal, Vancouver Island, Interior, Northern, Out of Canada` or `all`")
   }

   if (length(region) != 1 & !(all(region %in% unique(covid$HA)))) {
     stop("'region' must be valid BC region - Either combination of `Fraser, Vancouver Coastal, Vancouver Island, Interior, Northern, Out of Canada` or `all`")
   }

   if (length(region) < 1) {
     stop("region cannot be an empty list")
   }


   # Change the format to Date
   covid$Reported_Date <- as.Date(covid$Reported_Date, "%Y-%m-%d")

   # filter the data
   if (length(region) == 1 & region[1] == "all") {
     mask <- covid |>
       dplyr::filter(Reported_Date >= "2021-01-01" &
                     Reported_Date <= "2021-12-31")
   } else {
     mask <- covid |>
       dplyr::filter(HA %in% region &
                       Reported_Date >= "2020-01-01" &
                       Reported_Date < "2021-12-30")
   }

   # keep the filtered data
   plot_data <- mask

   # get the minimum and max date for scaling
   min <- plot_data$Reported_Date[1]
   max <- max(plot_data$Reported_Date)

   # Generate the line plots
   line_plot <- ggplot2::ggplot(plot_data,
                                ggplot2::aes(x = Reported_Date,
                                             color = HA)) +
     ggplot2::geom_line(stat = 'count') +
     ggplot2::scale_x_date(limits = c(min, max), labels = scales::date_format('%Y-%m-%d')) +
     ggplot2::labs(x = "Date",
                   y = "Number of Cases",
                   color = "Region",
                   title = "Number of COVID19 cases over time")

   return(line_plot)
}

