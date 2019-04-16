#Import Puppy Data
guideDogData <- read.csv("puppyData.csv", stringsAsFactors = F)

#Remove Columns with Data we are not using
guideDogData <- guideDogData[, -c(3, 5:8, 13:26)]

#Import Puppy Z Scores Data
puppyZScores <- read.csv("puppyZScores.csv", stringsAsFactors = F)

#Remove Columns with Data we are not using
puppyZScores <- puppyZScores[, -c(1:4, 6:)]