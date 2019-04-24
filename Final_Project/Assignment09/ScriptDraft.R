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

#Make a table with all these results
avgVarBreeds <- cbind(failureRatesBreed, solveTimeBreed, umbReacBreed, vocNovBreed)
#Name "Mean" columns
names(avgVarBreeds)[2] <- "failure"
names(avgVarBreeds)[4] <- "problemSolveZ"
names(avgVarBreeds)[6] <- "umbReactZ"
names(avgVarBreeds)[8] <- "vocalZ"
#Remove extra "Breed" columns
breedsPerf <- avgVarBreeds[, !duplicated(colnames(avgVarBreeds))]
#Add p-values from Anova Test to table by creating a new row
newrow <- c("P-Value", failureAOVP[1], solveAOVP[1], umbAOVP[1], vocAOVP[1])
breedsPerfandP <- rbind(breedsPerf, newrow)



#Let's see if there's a relationship between umbrella reaction score and success for the overall population 
umbFailure <- puppyData %>%
    group_by( Failure ) %>%
    summarise (meanUm = mean(ZPAUmResponse))

