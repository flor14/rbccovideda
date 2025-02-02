
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rbccovideda

<!-- badges: start -->

[![codecov](https://codecov.io/gh/UBC-MDS/rbccovideda/branch/master/graph/badge.svg?token=BHMAm2mkUK)](https://codecov.io/gh/UBC-MDS/rbccovideda)
[![R-CMD-check](https://github.com/UBC-MDS/rbccovideda/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/rbccovideda/actions)
<!-- badges: end -->

**Authors**: Lianna Hovhannisyan, John Lee, Vadim Taskaev, Vanessa Yuen

The British Columbia Center for Disease Control (BCCDC) manages a range
of provincial programs and clinics that contribute to public health and
help control the spread of disease in BC. It administers and distributes
the latest daily data on COVID-19 in British Columbia, which it provides
in csv format along case-, lab- and regional-specific features as well
as in comprehensive ArcGIS format via the [COVID-19
webpage](http://www.bccdc.ca/health-info/diseases-conditions/covid-19/data)
(under “Download the data”). This package leverages daily case-specific
COVID-19 data, allowing users to conveniently download the latest case
data, and - per specified date range interval - compute several key
statistics, visualize time series progression along age-related and
regional parameters, and generate exploratory data analysis in the form
of histogram figures supporting on-demand analysis. COVID-19 case detail
parameters extracted using this package:

-   Reported_Date (in YYYY-MM-DD format)
-   HA (provincial health region, e.g., “Vancouver Coast Health”)
-   Sex (M or F)
-   Age_Group (reported along 10-yr age group bins, e.g., “60-69”)
-   Classification_Reported (diagnosis origin, e.g., “Lab-diagnosed”)

## Installation

You can install the development version of `rbccovideda` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/rbccovideda")
```

## Package Functions

-   `get_data()`

    -   This function downloads the latest detailed daily case-specific
        COVID-19 from BCCDC’s dedicated [COVID-19
        homepage](http://www.bccdc.ca/health-info/diseases-conditions/covid-19/data).
        It returns a dataframe containing the extracted raw data.

-   `show_summary_stat()`

    -   This function computes summary statistics from the available
        case-specific parameters, such as age-related and regional
        aggregate metrics. It returns a dataframe listing key identified
        summary statistics specified per the time interval queried.

-   `plot_line_by_date()`

    -   This function returns a line chart plot of daily case counts,
        based on parameters and grouping selected by the user, per the
        time interval queried.

-   `plot_hist_by_cond()`

    -   This function returns a histogram plot based on parameters and
        grouping selected by the user, per the time interval queried,
        allowing for on-demand exploratory data analysis.

## Usage

`rbccovideda` can be used to download and compute summary statistics,
generate exploratory data analysis histogram plots, and plot time series
chart data as follows:

``` r
## load library
library(rbccovideda)
library(dplyr, warn.conflicts = FALSE)
```

To download and save data from BCCDC, use `get_data()`

``` r
all_data <- get_data()
head(all_data)
#> # A tibble: 6 × 5
#>   Reported_Date HA                Sex   Age_Group Classification_Reported
#>   <date>        <chr>             <chr> <chr>     <chr>                  
#> 1 2020-01-29    Out of Canada     M     40-49     Lab-diagnosed          
#> 2 2020-02-06    Vancouver Coastal F     50-59     Lab-diagnosed          
#> 3 2020-02-10    Out of Canada     F     20-29     Lab-diagnosed          
#> 4 2020-02-10    Out of Canada     M     30-39     Lab-diagnosed          
#> 5 2020-02-18    Interior          F     30-39     Lab-diagnosed          
#> 6 2020-02-24    Fraser            M     40-49     Lab-diagnosed
```

To generate summary statistics, call
`show_summary_stat(startDate, endDate)`

``` r
summary <- show_summary_stat("2022-01-01", "2022-01-31")
# to show the 15-columns tibble in a nice way
glimpse(summary)
#> Rows: 1
#> Columns: 15
#> $ total_cases_count        <int> 327625
#> $ latest_date              <date> 2022-02-01
#> $ latest_daily_cases_count <int> 1695
#> $ max_date                 <date> 2021-12-31
#> $ max_daily_cases_count    <int> 4078
#> $ min_date                 <date> 2020-01-29
#> $ min_daily_cases_count    <int> 1
#> $ max_age_group            <chr> "20-29"
#> $ max_age_group_count      <int> 67347
#> $ min_age_group            <chr> "Unknown"
#> $ min_age_group_count      <int> 90
#> $ max_region               <chr> "Fraser"
#> $ max_region_count         <int> 152269
#> $ min_region               <chr> "Out of Canada"
#> $ min_region_count         <int> 353
```

To plot a histogram by Age, use
`plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")`

``` r
plot_hist_by_cond("2021-01-01", "2021-01-30", "Age")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="80%" />

To plot a time-series line chart, use
`plot_line_by_date(startDate, endDate)`

``` r
plot_line_by_date("2021-01-01", "2021-01-30")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="80%" />

## **Role within R Ecosystem**

Given the relatively adequate accessibility of latest aggregate COVID-19
data combined with its persistent impact on socio-economics since early
2020, there are some 40 related packages found in CRAN at time as of
January 2022. Examples of API wrapper packages that retrieve COVID-19
data include [canadacovid](https://github.com/taylordunn/canadacovid)
and
[covidregionaldata](https://github.com/epiforecasts/covidregionaldata/),
while others provide functions to retrieve data, display summary
statistics and generate plots, such as
[nCov2019](https://github.com/YuLab-SMU/nCov2019) and
[covid19.analytic](https://github.com/mponce0/covid19.analytic). In
contrast to these existing packages, `rbccovideda` provides a simple
user interface that focuses on the localized provincial context of
British Columbia, utilizing features specific to BCCDC’s data
administration conventions for generating a quick overview and on-demand
analysis of trends and statistics pertaining to age-related and regional
case characteristics.

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## Contributors

Group 25 Contributors:

-   Lianna Hovhannisyan: @liannah
-   John Lee: @johnwslee
-   Vadim Taskaev: @vtaskaev1
-   Vanessa Yuen: @imtvwy

## License

The `rbccovideda` project was created by DSCI 524 (Collaborative
Software Development) Group 25 within the Master of Data Science program
at the University of British Columbia (2021-2022). It is licensed under
the terms of the MIT license.

## Credits

[R Packages](https://r-pkgs.org/), DSCI 524 Course Material (UBC MDS)
