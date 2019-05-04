#' @title Binomial Distribution function
#' @description Returns dataframe with probability distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return dataframe with number of successes and probability
#' with two classes, bindis and data.frame
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials,prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials,prob)
  prob_df <- data.frame(success,probability)
  prob_df <- data.frame(prob_df)
  colnames(prob_df) <- c('success','probability')
  class(prob_df) <- c('bindis','data.frame')
  return(prob_df)
}

#' @export
plot.bindis <- function(distr) {
  barplot(
    distr$probability,
    names.arg = distr$success,
    xlab='successes',
    ylab='probability'
  )
}

#' @title Cumulative Binomial Distribution function
#' @description Returns dataframe with probability
#' distribution and cumulative probability
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return dataframe with number of successes, probability,
#' and cumulative probability with two classes, bindis and data.frame
#' @export
#' @examples
#' bin_cumulative(trials=5,prob=0.5)
bin_cumulative <- function(trials,prob) {
  prob_cum <- bin_distribution(trials,prob)
  prob_cum$cumulative <- cumsum(prob_cum$probability)
  class(prob_cum) <- c('bincum','data.frame')
  return(prob_cum)
}

#' @export
plot.bincum <- function(distr) {
  plot(
    x= distr$success,
    y= distr$cumulative,
    type = 'o',
    xlab='successes',
    ylab='probability'
  )
  lines(distr$success,distr$cumulative)
}
