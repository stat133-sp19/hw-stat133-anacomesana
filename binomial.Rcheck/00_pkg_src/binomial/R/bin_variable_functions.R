
#' @title Binomial Random Variable function
#' @description Returns object of class binvar
#' that is a list of number of trials,
#' and probability of success
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return list of number of trials
#' and probability of success with class binvar
#' @export
#' @examples
#' bin_variable(trials=5,prob=0.5)
bin_variable <- function(trials,prob) {
  check_trials(trials)
  check_prob(prob)
  our_ls <- list(
    'trials' = trials,
    'prob' = prob)
  class(our_ls) = 'binvar'
  return(our_ls)
}

# Print Binomial Variable
#' @export
print.binvar <- function(distr, ...) {
  cat(paste0('"Binomial variable"\n \nParameters \n- number of trials: ',
             distr$trials,
             '\n- prob of success: ',distr$prob))
}

# Summary Binomial Variable
#' @export
summary.binvar <- function(distr) {
  sum_ls = list(
    'trials' = distr$trials,
    'prob' = distr$prob,
    'mean' = aux_mean(distr$trials,distr$prob),
    'variance' = aux_variance(distr$trials,distr$prob),
    'mode' = aux_mode(distr$trials,distr$prob),
    'skewness' = aux_skewness(distr$trials,distr$prob),
    'kurtosis' = aux_kurtosis(distr$trials,distr$prob)
  )
  class(sum_ls) = 'summary.binvar'
  return(sum_ls)
}

# Print Summary Binomial Variable
#' @export
print.summary.binvar <- function(sm) {
  cat(format(paste0(print.binvar(sm),
                    '\n\nMeasures\n- mean: ',
                    sm$mean,
                    '\n- variance:',
                    sm$variance,
                    '\n- mode: ',
                    sm$mode,
                    '\n- skewness: ',
                    sm$skewness,
                    '\n- kurtosis: ',
                    sm$kurtosis)
  )
  )
}
