#Set Working Directory
setwd("~/Desktop/CompBio/CompBioLabsAndHomework/Labs/Lab05")

#LAB 05 PART1

#Step 1: 
#Store the value 9 in the variable x
x <- 9
#Use if-else statement to determine if x is larger than 5, then print message stating x is larger than 5 if that is true
if ( x > 5 ) {
    print("x is larger than 5")
} else {
    print("x is smaller than 5")
}

#Step 2: import the file "Vector1.csv"
Vector1 <- read.csv("Vector1.csv")

#Step 2a: Use a for loop that checks each value in Vector1 and replaces every negative value with NA
#turn data frame "Vector1" into readable vector "myNewVec"
CoolNewVec <- Vector1$x
for ( i in 1:length(CoolNewVec)) {
    if ( CoolNewVec[i] < 0){
        CoolNewVec[i] <- NA
    }
}

#Step 2b: Use logical indexing to replace all NA values with NaN
CoolNewVec[ is.na(CoolNewVec)] <- NaN

#Step 2c: Replace all NaN values with a zero using numerical indexing
CoolNewVec[ which(is.na(CoolNewVec))] <- 0

#Step 2d+e: Determine how many of the values from the imported data fall in the range between 50 and 100. Create a vector of these values. 
LowerLim <- 50
UpperLim <- 100
Vec1 <- which( CoolNewVec >= LowerLim & CoolNewVec <= UpperLim)
FiftyToOneHundred <- CoolNewVec[Vec1]

#Step 2f: Save vector "FiftyToOneHundred" to file named "FiftyToOneHundred.csv"
write.csv(FiftyToOneHundred, 'FiftyToOneHundred.csv')

#Step 3: import the file "CO2_data_cut_paste.csv"
CO2Data <- read.csv("CO2_data_cut_paste.csv")
#create vector from data for just Gas
CO2Gas <- CO2Data$Gas

#Step 3a: Determine which year in the data was the first that gas emissions were non-zero
#Create threshold
zero <- 0
nonzero <- which( CO2Gas > zero )
nonzero #from output we see that first nonzero gas emissions was in column 135
#Determine what year is in column 135
CO2Data$Year[135]
#1885 is the first year that gas emissions were non-zero

#Step 3b: Determine which years in the data total emissions were between 200 and 300 mil metric tons of carbon
#create a vector from data for total emissions
CO2Total <- CO2Data$Total
#Create thresholds 
MinTotal <- 200
MaxTotal <- 300
#Determine which years are in this range
CO2Data$Year[which( CO2Total > MinTotal & CO2Total < MaxTotal)]
#Total emissions were between 200 and 300 million metric tons of carbon between the years 1879 and and 1887


#################
#PART 2#
#################

#Step 1: Set up parameter values 
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

#Step 2: Create a time vector, abundace of prey vector (n) and abundance of predator vector (t) 
t <- 1000
time <- seq(1, t, 1)
n <- rep(1, t)
p <- rep(1, t)
n[1] <- initPrey
p[1] <- initPred

#Step 3: Use a for loop to demonstrate the predator prey model using the above parameters
#Step 4: Write a code to check if predators kill off all prey resulting in negative values and replace all negative values with 0
for(i in 2:t){
    print(n[i] <- n[i-1] + (r * n[i-1]) - (a * n[i-1] * p[i-1]))
    print(p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1]) - (m * p[i-1]))
    if (n[i] < 0 ) {
        n[i] <- 0
    }
}


#Step 5: Make a plot of the abundances of prey and predators over time
plot(time, n)
lines (time, p)    
    
#Step 6: Put results into a matrix named myResults with the columns "TimeStep", "PreyAbundance", and "PredatorAbundance"
myResults <- matrix(1:3000, ncol=3)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
rownames(myResults) <- c()

#Step 7: Write matrix to a csv
write.csv(x = myResults, file = "PredPreyResults.csv")

###############
#BONUS
###############

