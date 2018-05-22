
library("ProjectTemplate")
load.project(data_loading = FALSE, munging = FALSE)

## Determine row to split on : split
set.seed(517)

trainRowNumbers <- createDataPartition(df$area, p = 0.7, list = FALSE)
trainData <- df[trainRowNumbers,]
testData <- df[-trainRowNumbers,]

x = trainData[, 1:12]
y = trainData$area




