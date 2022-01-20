#' Downloads detailed COVID-19 case data from default BCCDC webpage URL
#'   (passed in as string) as a .csv file to default relative path directory
#'   (also passed in as string).
#'
#' @param url string A webpage from which .csv file is downloaded to relative
#'   data folder directory, provided wit ha default value.
#'
#' @param out_folder string A relative path directory comprising two folder
#'   separated by a forward slash ("/"), provided with a default value.
#'
#' @return A data.frame containing downloaded detailed case data.
#' @export
#'
#' @examples
#' get_data()
#' get_data(url = "http://www.bccdc.ca/Health-Info-Site/Documents/
#'   BCCDC_COVID19_Dashboard_Case_Details.csv", out = "data/raw")
get_data <- function() {}

#' Title
#'
#' @return
#' @export
#'
#' @examples
show_summaryStat <- function() {}

#' Title
#'
#' @return
#' @export
#'
#' @examples
plot_line_by_date <- function() {}

#' Title
#'
#' @return
#' @export
#'
#' @examples
plot_hist_by_cond <- function() {}
