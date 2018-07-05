library(hflights)
library(data.table)

##DT[i, j, by]
##  |
##  |_____ i -> WHERE  
##  |_____ j -> SELECT 
##  |_____ by -> GROUPBY


##NOTE about html entities 
## SourceS : https://stackoverflow.com/questions/5068951/what-do-lt-and-gt-stand-for
##          http://www.w3.org/TR/html4/sgml/entities.html
##          http://www.w3schools.com/HTML/html_entities.asp
##
# &lt; stands for the less-than sign ( < )
# &gt; stands for the greater-than sign ( > )
# &le; stands for the less-than or equals sign ( ≤ )
# &ge; stands for the greater-than or equals sign ( ≥ )


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

## [8] This exercises focuses on the 'by' part. THe 'by' part is used when we want to calculte the 'j' 
## part grouped by specefic variable(or a manipulation). The 'j' expression is repeated for each 'by' group
DT[, mean(na.omit(DepDelay)), by =Origin]

## [9] Just as with the part 'j', you can do a lot of stuff in the 'by' part. Functions can be used in the
## 'by' part  so that results if the operations  done in teh 'j' part are grouped by some condition specified
## NOTE : the '.()' notation needs to be used when using several columns in the 'by' part
DT[, .(Avg_DepDelay_byWeekDays = mean(na.omit(DepDelay))), by = .(Origin, Weekdays = DayOfWeek < 6)]



