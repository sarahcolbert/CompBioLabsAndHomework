#####################
#Lab Step 1
#####################
#Write a “for loop” that prints the word “hi” to the console 10 times
#store number of times you need to complete task, for this problem, 10
j <- 10
#use for loop
#i is counter/index variable
#"1:j" is range of values for iterator variable
#whatever is inside {} is repeated n times
for (i in 1:j) {
    print("hi")
}

#####################
#Lab Step 2
#####################
#Set up place to store and initialize vector
v <- 8
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
m <- 7
pop <- rep(NA, m)
#store inital population (2000) in first entry of vector
pop[1] <- 2000
#find populations for each step if populations are decreasing by 5%
for(i in 1:m) {
    print(pop[i+1] <- pop[i]-pop[i]*.05)
}


#####################
#Lab Step 4
#####################
#store values
t <- 12
abundance <- rep(NA, t)
abundance[1] <- 2500
K <- 10000
r <- 0.8
#perform discrete-time logistic growth equation
for(i in 1:t){
    print(abundance[i+1] <- abundance[i] + (0.8*abundance[i]*(1-abundance[i])/K))
}
#display population for abundance[12]
print(abundance[12])


###########DONE
# SMF:  there is an error in your formula lin line 53.  Instead of (1-abundance[i])/K at the end, 
# SMF:  you should have (1-(abundance[i]/K)).  Also, note that your loop dynamically grows the abundance 
# SMF:  vector to a length of 13 on the very last trip through the loop

#####################
#Lab Step 5a and 5b
#####################
#Use the rep command to make a vector of 18 zeros
s <- 18
data <- rep(NA, s)
#for values 1-18 determine the results of multiplying each by 3
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

# SMF: note that the structure of your loop, going to u = 18 and then storing data in data1[18+1] on the 
# SMF: last iteration causes your vector to dynamically grow to a length of 19

#####################
#Lab Step 6
#####################
#store variables
#initizalize vector
f <- 20
fib <- rep(1, f)
fib[1] <- 0
#make a vector of the first 20 Fibonacci numbers, where the first number is 0 (zero
for(i in 1:f) {
   (fib[i+2] <- fib[i]+fib[i+1])
}
#display fib 
print(fib)

# SMF: similar to issues above, this loop causes the fib vector to dynamically grow to a length of 22.
# SMF: An easy way to fix this, with the way you have written it, would be to change the for loop to 
# SMF: run from 1:(f-2)


#####################
#Lab Step 7
#####################
#already stored abundance
#store time
time <- seq(0, 12, 1)
#make a plot
plot(time, abundance)

