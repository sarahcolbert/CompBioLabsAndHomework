#output to new file with only header line and columns 2-4
cut -f 2-4 -d , PredPreyData.csv | grep time > Last10PredPrey.csv
#add last 10 lines of data of columns 2-4 to previously made file
cut -f 2-4 -d , PredPreyData.csv | tail >> Last10PredPrey.csv
