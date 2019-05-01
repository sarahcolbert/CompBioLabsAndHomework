###################################
####### SUBSETTING THE DATA #######
###################################


#Import Puppy Data
guideDogData <- read.csv("puppyData.csv", stringsAsFactors = F)

#Subset Columns with Data we want (puppy number, failure, breed)
guideDogData <- guideDogData[, c(1,2,9)]

#Import Puppy Z Scores Data
puppyZScores <- read.csv("puppyZScores.csv", stringsAsFactors = F)

#Subset Columns with Data we want (z scores for solving, vocalizing, umbrella response)
puppyZScores <- puppyZScores[, c(17,29,30)]

#Merge guideDogData and puppyZScores data frames horizontally
rawPuppyData <- cbind(guideDogData, puppyZScores)

#Remove puppies with missing data
puppyData <- rawPuppyData[complete.cases(rawPuppyData), ]


######################################
####### PERFORMING ANOVA TESTS #######
######################################

#load necessary libraries
library("dplyr")
library("broom")
library("ggplot2")

#Create a function to find average of a variable by breed
avgByBreedFunc <- function(x){
    breedAvg <- aggregate(list (Mean = x), list(Breed = puppyData$PupBreed), mean)
    return ( breedAvg )
}


#Create a function to perform an ANOVA test to find p-value
anovaFunc <- function(y){
    breedA <- aov( y ~ puppyData$PupBreed)
    tidy(breedA)$p.value
}


#Use functions to analyze failure rate for each breed
failureRatesBreed <- avgByBreedFunc(puppyData$Failure)
failureAOVP <- anovaFunc(puppyData$Failure)

#Use functions to analyze average time to complete multi-step problem solving task for each breed
solveTimeBreed <- avgByBreedFunc(puppyData$ZPATorSolve)
solveAOVP <- anovaFunc(puppyData$ZPATorSolve)

#Use functions to analyze average initial reaction to umbrella for each breed
umbReacBreed <- avgByBreedFunc(puppyData$ZPAUmResponse)
umbAOVP <- anovaFunc(puppyData$ZPAUmResponse)

#Use functions to analyze average initial reaction to umbrella for each breed
vocNovBreed <- avgByBreedFunc(puppyData$ZNovLatVoc)
vocAOVP <- anovaFunc(puppyData$ZNovLatVoc)

#Make a table that includes the avg failure rate, and variable z scores for each breed
avgVarBreeds <- cbind(failureRatesBreed, solveTimeBreed, umbReacBreed, vocNovBreed)

#Name "Mean" columns more specifically
names(avgVarBreeds)[2] <- "failure"
names(avgVarBreeds)[4] <- "problemSolveZ"
names(avgVarBreeds)[6] <- "umbReactZ"
names(avgVarBreeds)[8] <- "vocalZ"

#Remove extra "Breed" columns
breedsPerf <- avgVarBreeds[, !duplicated(colnames(avgVarBreeds))]

#Add p-values from Anova Test to table by creating a new row
newrow <- c("P-Value", failureAOVP[1], solveAOVP[1], umbAOVP[1], vocAOVP[1])
breedsPerfandP <- rbind(breedsPerf, newrow)

#####################################
####### CREATE PLOTS BY BREED #######
#####################################

#Create a bar graph showing the average rate of failure for each breed
failureBreedPlot <- ggplot(breedsPerf, aes(x = Breed, y = failure)) + 
geom_bar(aes(fill = Breed), stat = "identity") + labs( y = "Average Failure Rate", title = "Breed Average Failure Rate in Guide Dog Program", caption = "based on data from: Effects of maternal investment, temperament, and cognition on guide dog success")

#Create a box plot showing Z-score of breeds for time to complete multi-step problem solving task
solveBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZPATorSolve, color = PupBreed)) + geom_boxplot() + labs (x = "Breed" , y = "Z-score", title = "Time Required to Complete Multi-step Problem Solving Task", caption = "based on data from: Effects of maternal investment, temperament, and cognition on guide dog success")

#Create a box plot showing Z-score of breeds for vocalizing test
vocBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZNovLatVoc, color = PupBreed)) + geom_boxplot() + labs (x = "Breed" , y = "Z-score", title = "Latency to Vocalize when Introduced to a Novel Object", caption = "based on data from: Effects of maternal investment, temperament, and cognition on guide dog success")

#Create a box plot showing Z-score of breeds for initial reaction to umbrella opening
umbBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZPAUmResponse, color = PupBreed)) + geom_boxplot() + labs (y = "Z-score", title = "Initial Reaction to Umbrella Opening", caption = "based on data from: Effects of maternal investment, temperament, and cognition on guide dog success")

###############################
####### DATA ANALYSIS 2 #######
###############################

##From the P-values in table "breedsPerfandP" we see that there was significant differnces between breeds for umbrella reaction scores and the vocalization test
#A tukey HSD test should be performed for these variables

#Tukey test for umbrella reactions
umbAOV <- aov( data = puppyData, ZPAUmResponse ~ PupBreed)
anova(umbAOV)
umbTky <- as.data.frame(TukeyHSD(umbAOV)$PupBreed)
umbTky$pair <- rownames(umbTky)
#Cre


umbHSD <- TukeyHSD(x=umbAOV, 'puppyData$PupBreed', conf.level =0.95)
tky <- as.data.frame(umbHSD)
plot(umbHSD)

#plot tukey results











#Let's see if there's a relationship between umbrella reaction score and success for the overall population 
umbFailure <- puppyData %>%
    group_by( Failure ) %>%
    summarise (meanUm = mean(ZPAUmResponse))

