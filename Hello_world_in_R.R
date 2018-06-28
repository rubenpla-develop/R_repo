library(hflights)
library(data.table)

##DT[i, j, by]
##  |
##  |_____ i -> WHERE  
##  |_____ j -> SELECT 
##  |_____ by -> GROUPBY

## [1] create data table from hflights and making request with 'where', 'select' & 'groupBy' params
DT <- as.data.table(hflights)

DT[Month==10,mean(na.omit(AirTime)), by=UniqueCarrier]

## [2] '.N' it's a sign equal to length(DT) result 
DT[.N-2]

## [3] we avoid null values on 'ArrDelay' table field
DT[, mean(na.omit(ArrDelay))]

## [4] when selecting several columns to do some stuff in 'j' part, you need to use .() notation, equals
## to 'list()'.
## It RETURNS a DATA TABLE instead of a vector
DT[, .(mean(na.omit(DepDelay)), mean(na.omit(ArrDelay)))]

## [5] Another useful feature which requires the ‘.()’ notation allows you to rename columns inside
## the DT[…] command.
DT[, .(Avg_ArrDelay = mean(na.omit(ArrDelay)))]

## [6] We'll do the same as above in [4] but renaming result fields
DT[, .(Avg_DepDelay = mean(na.omit(DepDelay)), Avg_ArrDelay = mean(na.omit(ArrDelay)))]

##[6b] Show list of Carriers (only unique values, as a vector)
DT[, unique(na.omit(UniqueCarrier))]

##[6c] Show list of Carriers (onely unique values, as a Data table)
DT[, .(Carriers = unique(na.omit(UniqueCarrier)))]

## [7] We'll try to show Average Dep & Arrive delays for every Carrier
## Aqui realizaras el ejercicio que hicimos el otro dia
