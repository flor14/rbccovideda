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
#' get_data(
#'   url = paste0("http://www.bccdc.ca/Health-Info-Site/",
#'     "Documents/BCCDC_COVID19_Dashboard_Case_Details.csv"),
#'   out = "data")
get_data <- function(
  url = paste0("http://www.bccdc.ca/Health-Info-Site/",
               "Documents/BCCDC_COVID19_Dashboard_Case_Details.csv"),
  out_folder = "data") {

  if(!is.character(out_folder)) {
    stop("out_folder must of character type")
  }

  if(sjmisc::str_contains(out_folder, "/")) {
    stop("out_folder cannot contain '/' symbol")
  }

  if(!RCurl::url.exists(url)) {
    stop("url provided does not invalid")
  }

  unlink(here::here(out_folder), recursive = TRUE)
  dir.create(here::here(out_folder))
  out_path <- here::here(out_folder, "case_data.csv")
  downloader::download(url, out_path, mode = "wb")
  cases_df <- readr::read_csv(
    here::here(out_folder, "case_data.csv"),
    show_col_types = FALSE)

  unlink(here::here(out_folder), recursive = TRUE)

  return (cases_df)
}
