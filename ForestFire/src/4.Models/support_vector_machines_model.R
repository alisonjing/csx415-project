## Load PACKAGES
library(caret)
library(kernlab)
library(dplyr)
library(ROCR)
library(caret)
library(e1071)

setwd("~/Desktop/CSX415-Data-Science-and-Principles/csx415-project/ForestFire")
library(ProjectTemplate)
load.project()

##import data
source('./src/1.Import/0.read_data.R')

## import the training and test data set
source('./src/2.Munge/model_train.R')

#check training data
head(trainData)
#size of training dataset
dim(trainData)
# check testing data
head(testData)
# size of testing dataset
dim(testData)

## set seed number for results reprodcubility
set.seed(1034)

sum(df$area<5)  # of fire burned area that is less than 5  heactares
# [1] 366
sum(df$area<5)/517
#[1] 0.7079304
sum(df$area>=5) # of fire burned are that is greater or equal to 5 hectares
# [1] 151
sum(df$area>=5)/517
#[1] 0.2920696

# Dataset transformation
df2 <- mutate(df, y=log(area+1))

# Data Normalization 
df_n <- function(x) {
  return((x-min(x)) / (max(x) - min(x)))
}
df2$X <- df_n(df2$X)
df2$Y <- df_n(df2$Y)
df2$month <- df_n(df2$month)
df2$day <- df_n(df2$day)
df2$FFMC <- df_n(df2$FFMC)
df2$DMC <- df_n(df2$DMC)
df2$DC <- df_n(df2$DC)
df2$ISI <- df_n(df2$ISI)
df2$temp <- df_n(df2$temp)
df2$rain <- df_n(df2$rain)
df2$RH <- df_n(df2$RH)
df2$wind <- df_n(df2$wind)

# Splitting the data 
# classify burned area > 5 hectares as large burned area
df$size <- NULL
df$size <- factor(ifelse(df$area <5, 1, 0), 
                  labels = c("small", "large"))

train <- sample(x=nrow(df2), size = 414, replace = FALSE )  # 80/20 Training/Testing dataset split

## Model 1: Measure only meterological metrics: temperature, RH, wind and rain
#A. Support Vector Machine object of class "ksvm" using Polynomial Kernel function
svm_1.poly <- ksvm (area ~ temp + RH + wind + rain, data = df2[train, ], kernel = "polydot", C=1)
svm_1.poly
#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Polynomial kernel function. 
#Hyperparameters : degree =  1  scale =  1  offset =  1 

#Number of Support Vectors : 166 

#Objective Function Value : -59.8273 
#Training error : 1.007019 

#B. Support Vector Machine object of class "ksvm" using Gaussian Radial Basis Kernel function
svm_1.rad <- ksvm (area ~ temp + RH + wind + rain, data=df2[train, ], kernel = "rbfdot", C=1) 
svm_1.rad
#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Gaussian Radial Basis kernel function. 
#Hyperparameter : sigma =  0.596965096503265 

#Number of Support Vectors : 158 

#bjective Function Value : -58.577 
#Training error : 1.000321 

# Model 2: measure all the metrics 
#A: Support Vector Machine object of class "ksvm" using Polynomial Kernel function
svm_2.poly <- ksvm(area ~ ., data = df2[train, ], kernel = "polydot", C=1 )
svm_2.poly 

#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Polynomial kernel function. 
#Hyperparameters : degree =  1  scale =  1  offset =  1 

#Number of Support Vectors : 161 

#Objective Function Value : -41.7297 
#Training error : 0.81218 

#B:Support Vector Machine object of class "ksvm" using Gaussian Radial Basis Kernel function
svm_2.rad <- ksvm(area ~ ., data = df2[train,], kernel = "rbfdot", C=1)
svm_2.rad
#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Gaussian Radial Basis kernel function. 
#Hyperparameter : sigma =  0.0730677199012585 

#Number of Support Vectors : 105 

#Objective Function Value : -34.5981 
#Training error : 0.601779 


#A: Support Vector Machine object of class "ksvm" using Polynomial Kernel function
svm_3.poly <-ksvm(area ~ X + Y + DC + DMC + ISI + FFMC, data=df2[train,], kernel="polydot", C=1)
svm_3.poly
#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Polynomial kernel function. 
#Hyperparameters : degree =  1  scale =  1  offset =  1 

#Number of Support Vectors : 205 

#Objective Function Value : -59.2936 
#Training error : 1.006894 

#B:Support Vector Machine object of class "ksvm" using Gaussian Radial Basis Kernel function
svm_3.rad <-ksvm(area ~ X + Y + DC + DMC + ISI + FFMC, data=df2[train, ], kernel="rbfdot", C=1)
svm_3.rad
#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Gaussian Radial Basis kernel function. 
#Hyperparameter : sigma =  0.209500419874148 

#Number of Support Vectors : 169 

#Objective Function Value : -58.2647 
#Training error : 0.995345 

svm_4.poly <- ksvm(area ~ X + Y + temp + wind + rain, data=df2[train, ], kernel="polydot", C=1)
svm_4.poly

#Support Vector Machine object of class "ksvm" 

#SV type: eps-svr  (regression) 
#parameter : epsilon = 0.1  cost C = 1 

#Polynomial kernel function. 
#Hyperparameters : degree =  1  scale =  1  offset =  1 

#Number of Support Vectors : 195 

#Objective Function Value : -59.2936 
#Training error : 1.006887 


# Testing with training data
pred_svm_1 <- predict(svm_1.rad, newdata = df2[-train, ], type = "response")
table(pred_svm_1, df2[-train, "size"][[1]])

















