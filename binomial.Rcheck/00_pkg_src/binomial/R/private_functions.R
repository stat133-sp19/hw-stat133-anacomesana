# 1.1) Private Checker Functions

# Description: tests if input is valid prob value
# Inputs
#   prob: a probability (numeric)
# Output
#   TRUE if prob between 0 and 1
#   stops otherwise
check_prob <-function(prob) {
  if (!is.numeric(prob)) {
    stop('probability must be numberic and of length 1')
  }
  if (!length(prob)==1) {
    stop('probability must be numberic and of length 1')
  }
  if (prob<0 | prob>1) {
    stop('probability out of bounds [0,1]')
  }
  else {
   return(TRUE)
  }
}


# Description: tests if input is valid number of
# trials value
# Inputs
#   trials: number of trials (numeric)
# Output
#   TRUE if trials non-negative
#   stops otherwise
check_trials <- function(trials) {
  if (length(trials) >1) {
    stop('number of trials must be of length 1')
  }
  if (!is.numeric(trials)){
    stop('number of trials must be positive integer')
  }
  if (trials %% 1 !=  0) {
    stop('number of trials must be positive integer')
  }
  if (trials<0) {
    stop('number of trials must be positive integer')
  }
  else {
    return(TRUE)
  }
}

# Description: tests if input is valid number of
# successes value
# Inputs
#   success: a number of successes (numeric)
#   trials: a number of trials (numeric)
# Output
#   TRUE if successes non-negative and not greater
#   than number of trials
#   stops otherwise
check_success <- function(success,trials) {
  if (!is.numeric(success)) {
    stop('number of successes must be nonnegative integer')
    }
  if (any(success%% 1 != 0)) {
    stop('number of successes must be nonnegative integer')
  }
  if (any(success<0)) {
    stop('number of successes must be nonnegative integer')
  }
  if (any(success >trials)) {
    stop('successes must be less that or equal to trials')
  }
  else {
    return(TRUE)
    }
}

# 1.2) Private Auxiliary Functions

# Description: returns mean of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   mean of the binomial distribution
aux_mean <- function(trials,prob) {
  return(trials * prob)
}

# Description: returns variance of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   variance of the binomial distribution
aux_variance <- function(trials,prob) {
  return(trials*prob*( 1 - prob))
}

# Description: returns mode of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   mode of the binomial distribution
aux_mode <- function(trials,prob) {
  if (prob==1) {
    return(trials)
  }
  else {
  return(as.integer(floor(trials * prob + prob)))
    }
}
# Description: returns skewness of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   skewness of the binomial distribution
aux_skewness <- function(trials,prob) {
  return((1 - 2 * prob)/sqrt(trials*prob*( 1 - prob)))
}

# Description: returns kurtosis of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   kurtosis of the binomial distribution
aux_kurtosis <- function(trials,prob) {
  return((1-6*prob*(1-prob))/(trials * prob * (1-prob)))
}
