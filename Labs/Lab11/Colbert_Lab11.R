##################################
####### PART 1: SETTING UP #######
##################################

#Import wood density data csv 
woodDensityData <- read.csv("woodDensityData.csv", stringsAsFactors = F)

#Rename fourth column
colnames(woodDensityData)[4] <- "WoodDensity"

#Rename sixth column just bc I don't like the period in it idk
colnames(woodDensityData)[6] <- "RefNumb"

#########################################
####### PART 2: WORKING WITH DATA #######
#########################################

####### Step 4 #######
#Where's the NA?
which(is.na(woodDensityData$WoodDensity))
#We found it! It's in row 12150

#No magic numbers
deleteNA <- which(is.na(woodDensityData$WoodDensity))

#Reassign woodDensityData with NA removed
woodDensityData <- woodDensityData[-c(deleteNA), ]

#Check to make sure it's removed
which(is.na(woodDensityData))


####### Step 5 #######
#Collapse each species into a single point using dplyr
#load dplyr
library("dplyr")
#group tables
#make sure there are three columns: binomial, family, and mean wood density 
#assign to new data frame
speciesDensityData <- woodDensityData %>%
    group_by( Binomial, Family ) %>%
    summarise( meanDensity = mean(WoodDensity))

####### Step 5 METHOD 2 #######
#Collapse each species into a single point using base R functions
speciesDensityData2 <- aggregate(woodDensityData$WoodDensity, list(woodDensityData$Binomial, woodDensityData$Family), mean)


####### Step 6 #######
#Now collapse each family into a single point
familyDensityData <- speciesDensityData %>%
    group_by( Family ) %>%
    summarise( famMeanDensity = mean(meanDensity))

#sort by mean density and assign to new data frame
sortedFamDensityData <- familyDensityData[order(familyDensityData$famMeanDensity), ]

#6c: 
#Set threshold
num <- 8
#Find families with 8 highest avg densities
topFams <- head(sortedFamDensityData, num)
topFamsTable <- table(topFams$Family)
topFamsName <- names(topFamsTable)
#Find families with 8 lowest avg densities
bottomFams <- tail(sortedFamDensityData, num)
bottomFamsTable <- table(bottomFams$Family)
bottomFamsName <- names(bottomFamsTable)


################################
####### PART 3: PLOTTING #######
################################
library("ggplot2")

####### Step 7 #######
#subset data for lowest 8 densities 
keepRows <- (speciesDensityData$Family %in% topFamsName)
cat(paste("\nNumber of observations kept = ", sum(keepRows), "\n"))
topFamsData <- speciesDensityData[keepRows, ]

allTopdf <- as.data.frame(topFamsData)

#subset data for highest 8 densities
keepRows1 <- (speciesDensityData$Family %in% bottomFamsName)
cat(paste("\nNumber of observations kept = ", sum(keepRows1), "\n"))
bottomFamsData <- speciesDensityData[keepRows1, ]

allBottomdf <- as.data.frame(bottomFamsData)

#Make plots for lowest 8 and highest 8 densities
#lowest
#ALSO YAY PRETTY COLORS!
plot1 <- ggplot(allTopdf, aes(x = Family, y = meanDensity, color = Family)) +
    geom_boxplot() +
    facet_wrap(facets = ~Family, scale="free")
#Add some labels
plot1 <- plot1 + labs(y = "Density (g/cm^3)", 
                      title = "Wood densities of individual species from the families with the lowest average densities", 
                      caption = "based on data from: Towards a worldwide wood economics spectrum")
#Remove tick text because it's cluttery and ugly!
plot1 <- plot1 + theme(axis.ticks.x = element_blank(), 
                       axis.text.x = element_blank())
#highest 
plot2 <- ggplot(allBottomdf, aes(x = Family, 
                                 y = meanDensity, 
                                 color = Family)) +
    geom_boxplot() +
    facet_wrap(facets = ~Family, 
               scale="free")
#once again, add labels
plot2 <- plot2 + labs(y = "Density (g/cm^3)", 
                      title = "Wood densities of individual species from the families with the highest average densities", 
                      caption = "based on data from: Towards a worldwide wood economics spectrum")
#Remove tick text because it's cluttery and ugly!
plot2 <- plot2 + theme(axis.ticks.x = element_blank(),
                       axis.text.x = element_blank())

####### Step 8 #######
#one plot with 8 lowest
plot3 <- ggplot(allTopdf, aes(x = Family, 
                              y = meanDensity, 
                              color = Family)) +
    geom_boxplot() +
    coord_flip()
plot3 <- plot3 + labs(y = "Density (g/cm^3)", 
                      title = "Families with lowest average densities", 
                      caption = "based on data from: Towards a worldwide wood economics spectrum")

#one plot with 8 highest
plot4 <- ggplot(allBottomdf, aes(x = Family, 
                                 y = meanDensity, 
                                 color = Family)) +
    geom_boxplot() +
    coord_flip()
plot4 <- plot4 + labs(y = "Density (g/cm^3)", 
                      title = "Families with highest average densities", 
                      caption = "based on data from: Towards a worldwide wood economics spectrum")


