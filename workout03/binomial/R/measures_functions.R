#' @title Binomial Mean function
#' @description Returns the mean of a binomial
#' distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return mean of distribution
#' @export
#' @examples
#' bin_mean(10,0.3)
bin_mean <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials,prob))
}

#' @title Binomial Variance function
#' @description Returns the variance of a binomial
#' distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return variance of distribution
#' @export
#' @examples
#' bin_variance(10,0.3)
bin_variance <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials,prob))
}

#' @title Binomial Mode function
#' @description Returns the mode of a binomial
#' distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return mode of distribution
#' @export
#' @examples
#' bin_mode(10,0.3)
bin_mode <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}

#' @title Binomial Skewness function
#' @description Returns the skewness of a binomial
#' distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return skewness of distribution
#' @export
#' @examples
#' bin_skewness(10,0.3)
bin_skewness <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials,prob))
}


#' @title Binomial Kurtosis function
#' @description Returns the kurtosis of a binomial
#' distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return kurtosis of distribution
#' @export
#' @examples
#' bin_kurtosis(10,0.3)
bin_kurtosis <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}
