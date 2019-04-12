#########################
##### PROBLEM 1 + 2 #####
#########################

#Import Data
cusackData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F )

#Load ggplot
library("ggplot2")

#Make Bar Plot
myPlot <- ggplot(cusackData, aes(x = Species)) + 
    geom_bar() + ### make it a bar plot
    theme(axis.text.x = element_text(angle = 90)) ### rotate labels on x axis

#####################
##### PROBLEM 3 #####
#####################

#Sort factor by level frequency
cusackData$Species <- reorder(cusackData$Species, cusackData$Species, FUN = length)


#Make plot
myPlot2 <- ggplot(cusackData, aes(x = Species, color = Species)) + 
    geom_bar() +
    coord_flip() + ###flip the axes
    scale_x_discrete(limits = rev(levels(cusackData$Species))) + ###reverse order
    scale_y_log10() + ###transform asix to log 10 scale
    theme(legend.position = "none")




