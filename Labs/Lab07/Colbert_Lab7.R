#set working direct
setwd("~/Desktop/CompBio/CompBioLabsAndHomework/Labs/Lab07")

###### PROBLEM 1 ######
#Define function for triangle area
triangleArea <- function(b,h){
    #base and height, b and h respectively, must be given
    #multiply the base and height by 1/2
    myTriangleArea  <- 0.5*b*h
    
    return( myTriangleArea )
}

#Call function to test
triangleArea(10,9)

###### PROBLEM 2 ######
#Define function that returns the absolute value of a given number, x
#Name function myAbs
myAbs <- function(a){
    #use for loop
    v <- length (a)
    threshold <- 0
    for ( i in 1:v ) {
        if ( a[i] < threshold){
            a[i] <- -a[i]
        }
    }
    return(a)
}
#TEST RUNZZZZZ
myAbs(5)
myAbs(-2.3)
myAbs(c(1.1, 2, 0, -4.3, 9, -12))


###### PROBLEM 3 ######
#Define a function that returns a vector of the first n Fibonacci Numbers
#N must be any integer >= 3
#s represents the desired start value which must either be 0 or 1
fibFunc <- function(n,s){
    if (s==0 & n >= 3 & n==n%/%1 | s==1 &  n >= 3 & n==n%/%1){
        fib <- rep(1, n)
        fib[1] <- s
        #make a vector of the first 20 Fibonacci numbers, where the first number is 0 (zero
        for(i in 1:(n-2)) {
            (fib[i+2] <- fib[i]+fib[i+1])
        }
        #display fib 
        return(fib)
    } else {
        print("n value or start point not valid") #Step 3b error message
    }
}
#TEST RUNZZZZZ
fibFunc(2,1)
fibFunc(6.5,0)
fibFunc(17,1)
fibFunc(3,2)

###### PROBLEM 4 ######
#Step 4a
#Define a function that takes values x and y and returns (x - y) ^ 2
sqDifFunc <- function(x,y){
    sqDif <- (x - y) ^ 2
    return(sqDif)
}
#Test with x=3 and y=5
sqDifFunc(3,5)
sqDifFunc(c(2,4,6), 4)

#Step 4b
#Define a function that finds the mean of a vector
meanFunc <- function(m){
    l <- length(m)
    tot <- sum(m)
    avg <- tot/l
    return(avg)
}
#Tester
meanFunc(c(5,15,10))
#Test with Sam's data
#import data
dataLab7 <- read.csv("DataForLab07.csv")
#create data into a vector
superDuperVector <- dataLab7$x
#test mean function with new data
meanFunc(superDuperVector)

#Step 4c
#Define a function that finds the sum of squares
sumSqFunc <- function(m){
    sumSq <- sum(sqDifFunc(m, meanFunc(m))) #find the sum of the sq differences which uses 
    #the data points and the mean of those data points
    return(sumSq)
}

#Test
#test sum of squares function with lab 7 data
sumSqFunc(superDuperVector)



