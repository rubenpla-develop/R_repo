library(hflights)
library(data.table)

##DT[i, j, by]
##  |
##  |_____ i -> WHERE  
##  |_____ j -> SELECT 
##  |_____ by -> GROUPBY

DT <- as.data.table(hflights)

DT[Month==10,mean(na.omit(AirTime)), by=UniqueCarrier]

## '.N' it's a sign equal to length(DT) result 
DT[.N-2]

## we avoid null values on 'ArrDelay' table field
DT[, mean(na.omit(ArrDelay))]

## when selecting several colimns to do some stuff in 'j' part, you need to use .() notation, equals
## to 'list()'.
## It RETURNS a DATA TABLE instead of a vector
DT[, .(mean(na.omit(ArrDelay)), mean(na.omit(ArrDelay)))]

