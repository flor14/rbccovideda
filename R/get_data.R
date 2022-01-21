#' Downloads raw csv COVID-19 case data from BCCDC URL
#'
#' Downloads detailed COVID-19 case data from BCCDC webpage URL (optional
#'   default argument that can be passed in as a string) as a .csv file to
#'   relative path directory (also optional string argument).
#'
#' @param url string A URL from which the .csv file is downloaded to the
#'   relative data folder directory (provided with default value).
#'
#' @param out_folder string A relative path directory comprising two folder
#'   separated by a forward slash ("/") (also provided with default value).
#'
#' @return A data.frame containing downloaded detailed case data.
#' @export
#'
#' @examples
#' get_data()
#' get_data(url = "http://www.bccdc.ca/Health-Info-Site/Documents/
#'   BCCDC_COVID19_Dashboard_Case_Details.csv", out_folder = "data/raw")
get_data <- function(url = paste0("http://www.bccdc.ca/Health-Info-Site/",
    "Documents/BCCDC_COVID19_Dashboard_Case_Details.csv"),
                     out_folder = "data/raw") {}
