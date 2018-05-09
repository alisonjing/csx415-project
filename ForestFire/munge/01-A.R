library('ProjectTemplate')
load.project()

library(caret)
library(cowplot)
library(rpart)
library(rpart.plot)


## Create the training and test dataset with 80/20 Rule

set.seed(517)
trainRowNumbers <- createDataPartition(df$area, p = 0.7, list = FALSE)
trainData <- df[trainRowNumbers,]
testData <- df[-trainRowNumbers,]

x = trainData[, 1:12]
y = trainData$area



## Validate 80/20 rule by checking size of training datset vs. test data

# Dimension of trainning set
dim(trainData)
# Dimension of test set
dim(testData)





