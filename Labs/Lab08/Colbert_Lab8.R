###### STEP 3 ######
#Create Lab 4's logistic growth model into a function
#Arguments will be: r = growth rate, K = carrying capacity, n = initial population size and t = time (number of generations)
LogGrowthMod <- function(r, K, n, t) {
    time <- seq(1, t, 1)
    abundance <- rep(NA, t)
    abundance[1] <- n
    for(i in 1:(t-1)){
        abundance[i+1] <- abundance[i] + (r*abundance[i]*(1-(abundance[i]/K)))
    } 
    (plot(time, abundance, ##Make a plot of abundance over time with labels
                xlab = "Time",
                ylab = "Abundance"))
    LogGrowthData <- matrix(1:24, ncol=2) 
    LogGrowthData <- cbind(time, abundance) #store time and abundance values in matrix
    colnames(LogGrowthData) <- c("generations", "abundance")
    return(LogGrowthData)
}

#Call the Function with chosen parameter values 
#r = 0.7
#K = 15000
#n = 300
#t = 10
LogGrowthResults <- LogGrowthMod(0.7, 15000, 300, 10)

#Save results in csv file
write.csv(x = LogGrowthResults, file = "LogGrowthResults.csv")




