#Set working directory to directory with cusack dataset
setwd("~/Desktop/CompBio/compBioSandbox/CompBio_on_git/Datasets/Cusack_et_al")

#Import
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

#Move to Lab 9 directory
setwd("~/Desktop/CompBio/CompBioLabsAndHomework/Labs/Lab09")

##### Problem 1 #####
##### Testing strptime function#####
#Determine formatting codes 
#Test for one value
oneDate <- camData$DateTime[1]

newDate <- strptime(oneDate, format = '%d/%m/%Y %H:%M' )

#Test for vector of values
smallVec <- camData$DateTime[1:5]

newDatesVec <- strptime(smallVec, format = '%d/%m/%Y %H:%M')

##### Test on whole date time vector #####
#Create dateTime vector
dateTimeVec <- camData$DateTime
allDates <- strptime(dateTimeVec, format = '%d/%m/%Y %H:%M', tz = "GMT") 

##### Problem 2 #####
##### Find which years are in the 2 year format
##### we know that time is stored in computer since 1/1/1970 and if year is read as 0013 or 0014 then it will be negative time since then
twoYrs <- as.numeric(allDates) < 0
wrongYrs <- which(twoYrs == TRUE)

##### Problem 3 #####
#fix errors
#use vectorization to change only 2 yr dates
allDates[wrongYrs] <- strptime(dateTimeVec[wrongYrs], format = "%d/%m/%y %H:%M", tz = "GMT")



    
    