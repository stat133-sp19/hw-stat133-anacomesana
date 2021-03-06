#############################################################
## Title: Data Preparation for Shot Charts
## Description: This file will be used during the data 
## preparation stage and will result in the 
## shots-data.summary.txt file in the output folder which
## will then be used in part 4) to obtain shot charts for
## different GSW players.
## Input: The data files for GSW players Iguodala, 
## Green, Durant, Thompson and Curry.
## Output: 
## 1. individual text files like the ones imported, but
## with added columns 'name' and 'minute' and changes to
## 'shot_made_flag' columns.
## 2. shots-data-summary.txt file with aggregated dataframe
## of all shots.
## Author: Ana Comesana
#############################################################


## Reading data sets
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
curry <-  read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)

## Setting up column name
iguodala['name'] = 'Andre Iguodala'
green['name'] = 'Draymond Green'
durant['name'] = 'Kevin Durant'
thompson['name'] = 'Klay Thompson'
curry['name'] = 'Stephen Curry'

## Change shot_made_flag
iguodala_idx_y = which(iguodala['shot_made_flag'] == 'y')
iguodala_idx_n = which(iguodala['shot_made_flag'] == 'n')
iguodala[iguodala_idx_y,'shot_made_flag'] = 'shot_yes'
iguodala[iguodala_idx_n,'shot_made_flag'] = 'shot_no'

green_idx_y = which(green['shot_made_flag'] == 'y')
green_idx_n = which(green['shot_made_flag'] == 'n')
green[green_idx_y,'shot_made_flag'] = 'shot_yes'
green[green_idx_n,'shot_made_flag'] = "shot_no"

durant_idx_y = which(durant['shot_made_flag'] == 'y')
durant_idx_n = which(durant['shot_made_flag'] == 'n')
durant[durant_idx_y,'shot_made_flag'] = 'shot_yes'
durant[durant_idx_n,'shot_made_flag'] = "shot_no"

thompson_idx_y = which(thompson['shot_made_flag'] == 'y')
thompson_idx_n = which(thompson['shot_made_flag'] == 'n')
thompson[thompson_idx_y,'shot_made_flag'] = 'shot_yes'
thompson[thompson_idx_n,'shot_made_flag'] = "shot_no"

curry_idx_y = which(curry['shot_made_flag'] == 'y')
curry_idx_n = which(curry['shot_made_flag'] == 'n')
curry[curry_idx_y,'shot_made_flag'] = 'shot_yes'
curry[curry_idx_n,'shot_made_flag'] = "shot_no"


## Add column minute
iguodala['minute'] = (iguodala$period-1) * 12 + (12-iguodala$minutes_remaining)
green['minute'] = (green$period-1) * 12 + (12-green$minutes_remaining)
durant['minute'] = (durant$period-1) * 12 + (12-durant$minutes_remaining)
thompson['minute'] = (thompson$period-1) * 12 + (12-thompson$minutes_remaining)
curry['minute'] = (curry$period-1) * 12 + (12-curry$minutes_remaining)


## Output summary of dataframes into text files
sink('../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink('../output/draymond-green-summary.txt')
summary(green)
sink()

sink('../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink('../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink('../output/stephen-curry-summary.txt')
summary(curry)
sink()

## Stack tables
shots_data <- rbind(iguodala,green,durant,thompson,curry)

## Exporting assembled table
write.csv(shots_data,"../data/shots-data.csv")

## Output summary of assembled table into text file
sink('../output/shots-data-summary.txt')
summary(shots_data)
sink()

