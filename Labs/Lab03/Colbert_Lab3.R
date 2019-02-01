#Lab Step #3: Make variables for number of bags of chips you start with and number of guests you have coming
InitialNumbChipBags <- 5
NumbGuests <- 8

#Lab Step #5: Make variable for expected average amount of chip bags eaten per guest
AvgBagsEaten <- 0.4

#Lab Step #7: Calculate amount of leftover chip bags assuming you eat 0.4 bags as well
LeftoverChipBags <- InitialNumbChipBags - AvgBagsEaten*(NumbGuests + 1)

#Lab Step #8: Make a vector of each person's ranking of the star wars episodes
Self <- c(7,6,5,1,2,3,4)
Penny <- c(5,7,6,3,1,2,4)
Jenny <- c(4,3,2,7,6,5,1)
Lenny <- c(1,7,3,4,6,5,2)
Stewie <- c(6,7,5,4,3,1,2)

#Lab Step #9: Use indexing to store Penny’s ranking for Episode IV in a new variable; make another variable for Lenny’s rank of Episode IV
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Lab Step #10: Make a matrix out of all the ranking vectors
EpisodesRankings <- cbind(Self, Penny, Jenny, Lenny, Stewie)

#Lab Step #11: Inspect Structure of PennyIV, Penny and EpisodesRankings
str (PennyIV)
str (Penny)
str (EpisodesRankings)
#Comparisons: Each outputs significantly different amounts of information. PennyIV's structure is just 'num' and then the rank, while Penny's structure has 'num' but then the line continues to show that there are 7 values and what those values are in order. EpisodesRankings does the same thing but indicates that there is more information and the names of the vectors that the information is stored in. 

#Lab Step #12: Make a data frame using the vectors
#Method1 using all vectors
DataFrame1 <- data.frame(Self, Penny, Jenny, Lenny, Stewie)
#Method2 using matrix
DataFrame2 <- as.data.frame(EpisodesRankings)

#Lab Step #13: Compare outputs of step 10 and step 12
dim(EpisodesRankings)
dim(DataFrame1)
#Dimensions are the same
str(EpisodesRankings)
str(DataFrame1)
#structure of the data fram made using data.frame looks much cleaner and more readable than the matrix made using cbind
all(EpisodesRankings == DataFrame1)
#all elements of the matrix and data frame are equal
typeof(EpisodesRankings)
typeof(DataFrame1)
#Episodes Rankings is displayed as "double" and the data frame is classified as a list, I don't exactly know what these mean

#Lab Step #14: Make a vector of the Episode names as Roman numerals 
EpisodeNames <- c("I","II","III","IV","V","VI","VII")

#Lab Step #15: Name the rows of the matrix and data frame
row.names(EpisodesRankings) <- EpisodeNames
row.names(DataFrame1) <- EpisodeNames

#Lab Step #16: access third row of matrix
EpisodesRankings[3,]

#Lab Step #17: access fourth column of data frame
DataFrame1[,4]

#Lab Step #18: access self ranking for episode 5
DataFrame1[5,1]

#Lab Step #19: access penny's ranking for episode 2
DataFrame1[2,2]

#Lab Step #20: Access everyone’s rankings for episodes IV – VI
EpisodesRankings[4:6,]

#Lab Step #21: Access everyone’s rankings for episodes II, V, and VII
EpisodesRankings[c(2,5,7),]

#Lab Step #22: Access rankings for just Penny, Jenny, and Stewie for just episodes IV and VI
EpisodesRankings[c(4,6), c(2,3,5)]

#Lab Step #23: Switch Lenny’s rankings for Episodes II and V
NewV <- EpisodesRankings[2,4]
NewII <- EpisodesRankings[5,4]
EpisodesRankings[2,4] <- NewII
EpisodesRankings[5,4] <- NewV
#Check
EpisodesRankings[,4]

#Lab Step #24: Accessing by methods other than indexing
EpisodesRankings["III", "Penny"]
DataFrame1["III", "Penny"]

#Lab Step #25: Undo swap from step 23 using other method
NewV <- EpisodesRankings["II","Lenny"]
NewII <- EpisodesRankings["V","Lenny"]
EpisodesRankings["II","Lenny"] <- NewII
EpisodesRankings["V","Lenny"] <- NewV
#Check
EpisodesRankings[,"Lenny"]

#Lab Step #26: Swap Lenny's second and fifth episode rankings using $ method in data frame
NewV <- DataFrame1$Lenny[2]
NewII <- DataFrame1$Lenny[5]
DataFrame1$Lenny[2] <- NewII
DataFrame1$Lenny[5] <- NewV
#Check
DataFrame1$Lenny
