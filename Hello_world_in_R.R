library(hflights)
library(data.table)

DT <- as.data.table(hflights)

DT[Month==10,mean(na.omit(AirTime)), by=UniqueCarrier]

## '.N' it's a sign equal to length(DT) result 
DT[.N-2]

DT[, mean(na.omit(ArrDelay))]