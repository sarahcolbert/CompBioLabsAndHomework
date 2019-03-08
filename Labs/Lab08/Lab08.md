# Implementing a Discrete-Time Logistic Growth Model with Code



The file [Colbert_Lab8.R](https://github.com/brusselsproutshawty/CompBioLabsAndHomework/blob/master/Labs/Lab08/Colbert_Lab8.R) is a script containing a function that generates data on abundance over time that is then plotted and saved in a data file, which can be seen on github [here](https://github.com/brusselsproutshawty/CompBioLabsAndHomework/blob/master/Labs/Lab08/LogGrowthResults.csv).



To model population abundance over time we use this discrete-time logistic equation:

>  ****_n[t] = n[t-1] + (r * n[t-1] * (K - n[t-1])/K)_****



where each variable represents a parameter that is put into the argument of the function. The parameters, their meanings and my values are as follows:

* r = growth rate = 0.7
* K = carrying capacity = 15000
* n = initial population size = 300
* t = time/number of generations = 10

To model this equation with these parameters they are placed in the argument of the function _LogGrowthMod_. The code for the function is: 

![Code for logarithmix growth function in r](LogGrowthFuncCode.png)

