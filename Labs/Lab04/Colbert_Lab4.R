#####################
#Lab Step 1
#####################
#Write a “for loop” that prints the word “hi” to the console 10 times
#store number of times you need to complete task, for this problem, 10
j <- 10
#use for loop
# i is index
#whatever is inside {} is repeated n times
for (i in 1:j) {
    print("hi")
}


#####################
#Lab Step 2
#####################
#Write for loop for funtion for 8 weeks 
v <- 8
#initialize vector
res <- rep(NA, v)
#use for loop
#store result inside 'res'
for(i in 1:v) {
    print(res[i] <- 10 + 2.32*i)
}


#####################
#Lab Step 3
#####################
#store and initialize
#store inital population (2000) in first entry of vector
m <- 7
pop <- rep(NA, m)
pop[1] <- 2000
#use for loop
for(i in 1:m) {
    print(pop[i+1] <- pop[i]-pop[i]*.05)
}


#####################
#Lab Step 4
#####################
#perform discrete-time logistic growth equation
#store values
t <- 12
abundance <- rep(NA, t)
abundance[1] <- 2500
K <- 10000
r <- 0.8
#create for loop
for(i in 1:t){
    print(abundance[i+1] <- abundance[i] + (0.8*abundance[i]*(1-abundance[i])/K))
}
#check population for abundance[12]
print(abundance[12])


#####################
#Lab Step 5a and 5b GOOD
#####################
#Use the rep command to make a vector of 18 zeros
s <- 18
data <- rep(NA, s)
#use for loop
for(i in 1:s) {
    print(data[i] <- 3*i)
}


#####################
#Lab Step 5c
#####################
#Make vector with first value being 1 and 17 more values of 0
u <- 18
data1 <- rep(0, u)
data1[1] <- 1


#####################
#Lab Step 5d
#####################
#Write for loop so starting with second value of vector, entry is equal to one plus previous entry
for(i in 1:u) {
    print(data1[i+1] <- 1+2*data1[i])
}


#####################
#Lab Step 6
#####################
#make a vector of the first 20 Fibonacci numbers, where the first number is 0 (zero).
f <- 20
fib <- rep(1, f)
fib[1] <- 0
#make for loop
for(i in 1:f) {
   (fib[i+2] <- fib[i]+fib[i+1])
}
#check fib vector
print(fib)


#####################
#Lab Step 7
#####################
#already stored abundance
#store time
time <- seq(0, 12, 1)
#make a plot
plot(time, abundance)

