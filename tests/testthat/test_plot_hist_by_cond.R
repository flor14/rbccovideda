#' Check if errors are raised when incorrect inputs are used

testthat::test_that("Arguments need to be wrapped by quotation marks", {
  expect_error(plot_hist_by_cond(2021-01-01, 2021-12-31, Age))
})

testthat::test_that("condition need to be wrapped by quotation marks", {
  expect_error(plot_hist_by_cond("2021-01-01", "2021-12-31", Region))
})

testthat::test_that("dates need to be wrapped by quotation marks", {
  expect_error(plot_hist_by_cond(2021-01-01, 2021-12-31, "Age"))
})

testthat::test_that("dates need to be wrapped by quotation marks", {
  expect_error(plot_hist_by_cond("2021-01-01", 2021-12-31, "Region"))
})

testthat::test_that("The first letter of condition should be capitalized", {
  expect_error(plot_hist_by_cond("2021-01-01", "2021-12-31", "age"))
})

testthat::test_that("The first letter of condition should be capitalized", {
  expect_error(plot_hist_by_cond("2021-01-01", "2021-12-31", "region"))
})

#' Check if the correct plot type is used

testthat::test_that("Plot should use geom_bar as the mark", {
  age_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")
  region_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Region")
  expect_true("GeomBar" %in% c(class(age_plot$layers[[1]]$geom)))
  expect_true("GeomRect" %in% c(class(region_plot$layers[[1]]$geom)))
})

testthat::test_that("Plot should use correct y variable.", {
  age_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")
  region_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Region")
  expect_true(rlang::get_expr(age_plot$mapping$y)
              == "factor(Age_Group, levels = rev(age_order))")
  expect_true(rlang::get_expr(region_plot$mapping$y)
              == "factor(HA, levels = rev(region_order))")
})

#' Check if the correct plot labels and titles are used

testthat::test_that("Correct plot labels should be used", {
  age_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")
  region_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Region")
  expect_true(age_plot$labels$x == "Number of Cases")
  expect_true(age_plot$labels$y == "Age Group")
  expect_true(region_plot$labels$x == "Number of Cases")
  expect_true(region_plot$labels$y == "Region")
})

testthat::test_that("Correct plot titles should be used", {
  age_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Age")
  region_plot <- plot_hist_by_cond("2021-01-01", "2021-12-31", "Region")
  expect_true(age_plot$labels$title == "Number of Cases by Age Group")
  expect_true(region_plot$labels$title == "Number of Cases by Region")
})

