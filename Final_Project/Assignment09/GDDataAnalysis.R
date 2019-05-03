###################################
####### SUBSETTING THE DATA #######
###################################

#Import Puppy Data
guideDogData <- read.csv("puppyData.csv", stringsAsFactors = F)

#Subset Columns with Data we want puppy number (column1), failure (column2), breed (column9)
guideDogData <- guideDogData[, c(1,2,9)] 

#Import Puppy Z Scores Data
puppyZScores <- read.csv("puppyZScores.csv", stringsAsFactors = F)

#Subset Columns with Data we want z scores for solving (column17), vocalizing (column29), umbrella response (column30)
puppyZScores <- puppyZScores[, c(17,29,30)]

#Merge guideDogData and puppyZScores data frames horizontally
rawPuppyData <- cbind(guideDogData, puppyZScores)

#Remove puppies with missing data
puppyData <- rawPuppyData[complete.cases(rawPuppyData), ]


###############################
####### ANLYSIS PART 1: #######
#######   ANOVA TESTS   #######
###############################

#load necessary libraries
library("dplyr")
library("broom")
library("ggplot2")
install.packages("cowplot")

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
#Check Table
breedsPerfandP

##################################
####### GRAPHING PART 1:   #######
####### VARIABLES BY BREED #######
##################################

#Create a bar graph showing the average rate of failure for each breed
failureBreedPlot <- ggplot(breedsPerf, aes(x = Breed, y = failure)) + 
geom_bar(aes(fill = Breed), stat = "identity") + labs( y = "Failure Rate", title = "Failure rate in guide dog program by breed", caption = "There were no statistically significant differences between breed failure means \n(F(2,95) = 0.925, p = .4000).") + theme(plot.title = element_text(hjust = 0.50), plot.caption = element_text(hjust = 0, face = "italic")) + theme(legend.position = "none")

#Create a box plot showing Z-score of breeds for time to complete multi-step problem solving task
solveBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZPATorSolve, color = PupBreed)) + geom_boxplot() + labs (x = "Breed" , y = "Z-score", title = "Time required to complete multi-step problem \nsolving task", caption = "There were no statistically significant differences between breed problem solving \nability means (F(2,95) = 2.025, p = .1377).") + theme(plot.title = element_text(hjust = 0.50), plot.caption = element_text(hjust = 0, face = "italic"), legend.position = "none")

#Create a box plot showing Z-score of breeds for vocalizing test
vocBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZNovLatVoc, color = PupBreed)) + geom_boxplot() + labs (x = "Breed" , y = "Z-score", title = "Latency to vocalize when introduced to a novel object", caption = "There were statistically significant differences between breed latency to vocalize \nmeans (F(2,95) = 4.868, p = .0097).") + theme(plot.title = element_text(hjust = 0.50), plot.caption = element_text(hjust = 0, face = "italic"), legend.position = "none")

#Create a box plot showing Z-score of breeds for initial reaction to umbrella opening
umbBreedPlot <- ggplot(puppyData, aes(x = PupBreed, y = ZPAUmResponse, color = PupBreed)) + geom_boxplot() + labs (y = "Z-score", x = "Breed" , title = "Initial reaction to umbrella opening", caption = "There were statistically significant differences between breed umbrella reaction \nscore means (F(2,95) = 7.335, p = .0011).") + theme(plot.title = element_text(hjust = 0.50), plot.caption = element_text(hjust = 0, face = "italic"), legend.position = "none")

#Put all of the previous made plots into one big page
breedPlots <- cowplot::plot_grid(failureBreedPlot, solveBreedPlot, vocBreedPlot, umbBreedPlot, labels = "AUTO")


####################################
######### ANALYSIS PART 2: #########
######### TUKEY HSD TEST   #########
####################################

##From the P-values in table "breedsPerfandP" we see that there was significant differnces between breeds for umbrella reaction scores and the vocalization test
#A tukey HSD test should be performed for these variables

#Tukey test for umbrella reactions
umbBreedAOV <- aov( data = puppyData, ZPAUmResponse ~ PupBreed)
anova(umbBreedAOV)
umbTky <- as.data.frame(TukeyHSD(umbBreedAOV)$PupBreed)
#Plot Tukey Results for umbrella
umbTky$pair <- rownames(umbTky)
umbTky$pair <- c("Golden-German", "Labrador-German", "Labrador-Golden")
umbTkyPlot <- ggplot(umbTky, aes(colour=cut(`p adj`, c(0, 0.05, 1), label=c("p<0.05","Non-Sig")))) + geom_hline(yintercept=0, lty="11") +
    geom_errorbar(aes(pair, ymin=lwr, ymax=upr), width=0.4) +
    geom_point(aes(pair, diff)) +
    labs(colour="", x = "Breed Pairing", y = "Difference in Mean Umbrella Reaction Score", title = "95% Confidence Interval") + theme(plot.title = element_text(hjust = 0.50))

#Tukey test for vocalization scores
vocBreedAOV <- aov( data = puppyData, ZNovLatVoc ~ PupBreed)
anova(vocBreedAOV)
vocTky <- as.data.frame(TukeyHSD(vocBreedAOV)$PupBreed)
#Plot Tukey Results for vocalizaiton
vocTky$pair <- rownames(vocTky)
vocTky$pair <- c("Golden-German", "Labrador-German", "Labrador-Golden")
vocTkyPlot <- ggplot(vocTky, aes(colour=cut(`p adj`, c(0, 0.05, 1), label=c("p<0.05","Non-Sig")))) + 
    geom_hline(yintercept=0, lty="11") +
    geom_errorbar(aes(pair, ymin=lwr, ymax=upr), width=0.4) +
    geom_point(aes(pair, diff)) +
    labs(colour="", x = "Breed Pairing", y = "Difference in Mean Latency to Vocalize Score", title = "95% Confidence Interval") + theme(plot.title = element_text(hjust = 0.50))

tkyPlots <- cowplot::plot_grid(umbTkyPlot, vocTkyPlot, labels = "AUTO")


#############################################
#######    ANALYSIS PART 3: PAIRED    #######
####### T-TEST FOR FAILURE AND TRAITS #######
#############################################
#Perfom a t-test to see if umbrella reaction scores significantly differed for puppies that failed/succeeded
umbFailure <- t.test(ZPAUmResponse ~ Failure, data = puppyData, var.equal = TRUE)
#P-value > 0.05

#Perfom a t-test to see if latency to vocalize scores significantly differed for puppies that failed/succeeded
vocFailure <- t.test(ZNovLatVoc ~ Failure, data = puppyData, var.equal = TRUE)
#P-value < 0.05 so 
Outcome <- as.character(puppyData$Failure)
vocOutcome <- ggplot(puppyData, aes(Outcome, ZNovLatVoc, color=Outcome)) +
    geom_boxplot() +
    labs(y = "Z-score", title = "Latency to vocalize when introduced to novel object and guide dog program outcome", caption = "Puppies that succeeded in the guide dog program had a statistically significant longer latency to vocalize when introduced to \na novel object than puppies that failed (t(96) = 2.8574, p = .0052).") + scale_x_discrete(labels = c("Success", "Failure")) + theme(plot.title = element_text(hjust = 0.50), plot.caption = element_text(hjust = 0, face = "italic"), legend.position = "none")
