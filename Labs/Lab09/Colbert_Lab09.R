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

##### Problem 1 #####
##### Test on whole date time vector #####
#Create dateTime vector
dateTimeVec <- camData$DateTime
formattedDateTime <- strptime(dateTimeVec, format = '%d/%m/%Y %H:%M') 

##### Problem 2 #####
##I feel like this would be so much easier in the shell with grep and awk or idk!!!!??????/fdsiahgiojfg

#Didn't work, showed NA's 
##formattedDateTimeNew <- strptime (dateTimeVec, format = '%y-%m-%d %H:%M:%S')

#Also didn't work
#wrongDates <- subset(formattedDateTime, formattedDateTime$x < as.POSIXlt('2013-01-01 00:00'))

#Poor Attempt at Using a For loop
#vecLength <- length(dateTimeVec)
#for (i in 1:vecLength){
    #if(dateTimeVec[i] = format( %d/%m/%y %H:%M )){
       # twoYrDateTimes <- dateTimeVec[i], format = '%d/%m/%Y %H:%M')
   # }
#}

#Well this isn't going well...time do something DRASTIC!
#AKA Start Over and Break it down smaller
#let's find which ones are in the 2 yr vs 4 yr format
twoYrformattedDateTime <- strptime(dateTimeVec, format = '%d/%m/%y %H:%M') 
#any that is NA is in the 4 yr format, any that was translated is in the 2 yr format
twoYr <- rep(NA, 5645)
for (i in 1:)
    
    
    
    