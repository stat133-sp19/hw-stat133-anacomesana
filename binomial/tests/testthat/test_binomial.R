#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################


context("Binomial Functions")

#bin_choose()
test_that("bin_choose function works as expected",{
  k <- 4
  n <- 10
  expect_equal(bin_choose(n,k),210)
  expect_length(bin_choose(n,k),1)
  expect_type(bin_choose(n,k), 'double')
})
test_that("bin_choose function works as expected",{
  k <- 10
  n <- 4
  expect_error(bin_choose(n,k),'k cannot be greater than n')
})

#bin_probability()
test_that("bin_probability() function works as expected",{
  success <- 4
  prob <- 0.5
  trials <- 10
  expect_is(bin_probability(success,trials,prob),'numeric')
})
test_that("bin_probability() function works as expected",{
  success <- 5
  prob <- 0.1
  trials <- 2
  expect_error(bin_probability(success,trials,prob),'successes must be less that or equal to trials')
})
test_that("bin_probability() function works as expected", {
  success <- 1
  prob <- c(0.3,0.2)
  trials <- 10
  expect_error(bin_probability(success,trials,prob),"probability must be numberic and of length 1")
})

#bin_distribution()
test_that("bin_distribution() function works as expected",{
  t1 <- data.frame(list(
    success = 0:5,
    probability = c(
      0.03125,
      0.15625,
      0.31250,
      0.31250,
      0.15625,
      0.03125)))
  class(t1) <- c("bindis", "data.frame")
  expect_equal(bin_distribution(5, 0.5), t1, tolerance = 0.001)
})

test_that("bin_distribution() function works as expected",{
  t2 <- data.frame(list(
    success = 0:3,
    probability = c(
      0.512,
      0.384,
      0.096,
      0.008)))
  class(t2) <- c("bindis", "data.frame")
  expect_equal(bin_distribution(3, 0.2), t2, tolerance = 0.001)
})
test_that("bin_distribution() function works as expected",{
  t3 <- data.frame(list(
    success = 0:3,
    probability = c(
      0,
      0,
      0,
      1)))
  class(t3) <- c("bindis", "data.frame")
  expect_equal(bin_distribution(3, 1), t3, tolerance = 0.001)
  expect_is(bin_distribution(3, 1), c("bindis", "data.frame"))
})

#bin_cumulative()
test_that("bin_cumulative() function works as expected",{
  t1 <- data.frame(list(
    success = 0:5,
    probability = c(
      0.03125,
      0.15625,
      0.31250,
      0.31250,
      0.15625,
      0.03125),
    cumulative = c(
      0.03125,
      0.18750,
      0.50000,
      0.81250,
      0.96875,
      1.00000)))
  class(t1) <- c("bincum", "data.frame")
  expect_equal(bin_cumulative(5, 0.5), t1, tolerance = 0.001)
  expect_is(bin_cumulative(5, 0.5), c("bincum", "data.frame"))
  expect_length(bin_cumulative(5, 0.5), 3)
})
