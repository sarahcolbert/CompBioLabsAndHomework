#  Implementing a Discrete-Time Logistic Growth Model with Code

The file [Colbert_Lab8.R](https://github.com/brusselsproutshawty/CompBioLabsAndHomework/blob/master/Labs/Lab08/Colbert_Lab8.R) is a script that turns a logistic growth model into a function that generates data on abundance over time that is then plotted and saved in a data file, which can be seen on github [here](https://github.com/brusselsproutshawty/CompBioLabsAndHomework/blob/master/Labs/Lab08/LogGrowthResults.csv).
To model population abundance over time we use this discrete-time logistic equation:
> **n[t] = n[t-1] + (r * n[t-1] * (K - n[t-1])/K)**

