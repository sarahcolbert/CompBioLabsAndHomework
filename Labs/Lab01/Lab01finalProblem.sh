cut -f 2-4 -d , PredPreyData.csv | grep time > Last10PredPrey.csv
cut -f 2-4 -d , PredPreyData.csv | tail >> Last10PredPrey.csv
