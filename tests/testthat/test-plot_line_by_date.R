
# Check if errors are raised when incorrect inputs are used

testthat::test_that("Arguments need to be wrapped by quotation marks", {
  expect_error(plot_line_by_date(2021-01-01, 2021-12-31, Age))
  expect_error(plot_line_by_date("2021-01-01", "2021-12-31", Region))
  expect_error(plot_line_by_date(2021-01-01, 2021-12-31, "Age"))
  expect_error(plot_line_by_date("2021-01-01", 2021-12-31, "Region"))
  expect_error(plot_line_by_date("2021-01-01", 2021-12-31, "Region"))

})

# Check values of the inputs

testthat::test_that("The date format is correct", {
  expect_error(plot_line_by_date("2021/01-01", "2021-12-31"))
  expect_error(plot_line_by_date("2021-01-01", "2021-15-01"))
})

testthat::test_that("The startDate and endDate are valid values", {
  expect_error(plot_line_by_date("2019-01-01", "2021-12-31"))
  expect_error(plot_line_by_date("2021-01-01", "2020-01-01"))
  expect_error(plot_line_by_date("2021-01-01", "2023-01-01"))
})

testthat::test_that("The region is valid value", {
  expect_error(plot_line_by_date("2021-01-01", "2021-12-31", region = c('all', 'Fraser')))
  expect_error(plot_line_by_date("2021-01-01", "2021-12-31", region = c('Hello')))
  expect_error(plot_line_by_date("2021-01-01", "2021-12-31", region = c()))
})

# Check if the correct plot type is used

testthat::test_that("Plot should use geom_line as the mark", {
  all_plot <- plot_line_by_date("2021-01-01", "2021-12-31")
  filter_plot <- plot_line_by_date("2021-01-01", "2021-12-31", region=c('Fraser', 'Interior'))
  expect_true("GeomLine" %in% c(class(all_plot$layers[[1]]$geom)))
  expect_true("GeomLine" %in% c(class(filter_plot$layers[[1]]$geom)))
})

testthat::test_that("Plot should use correct x variable.", {
  all_plot <- plot_line_by_date("2021-01-01", "2021-12-31")
  filter_plot <- plot_line_by_date("2021-01-01", "2021-12-31", c('Fraser', 'Interior'))
  expect_true(rlang::get_expr(all_plot$mapping$x) == "Reported_Date")
  expect_true(rlang::get_expr(filter_plot$mapping$x) == "Reported_Date")
})

# Check if the correct plot labels and titles are used

testthat::test_that("Correct plot labels should be used", {
  all_plot <- plot_line_by_date("2021-01-01", "2021-12-31")
  filter_plot <- plot_line_by_date("2021-01-01", "2021-12-31", region = c('Fraser'))
  expect_true(all_plot$labels$x == "Date")
  expect_true(filter_plot$labels$x == "Date")
  expect_true(all_plot$labels$y == "Number of Cases")
  expect_true(filter_plot$labels$y == "Number of Cases")
  expect_true(all_plot$labels$title == "Number of COVID19 cases over time")
  expect_true(filter_plot$labels$title == "Number of COVID19 cases over time")
})
