#Set the default working directory and load the project
library(ProjectTemplate)
load.project()

#Load libraries
library(glmnet)

##Import Data
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

## Linear Regression models to predict forestfires burned area
glm_1 <- lm(area ~ ., data = trainData, family = binomial())
par(mfrow=c(2,2))
plot(glm_1)  # Diagnostic plot
summary(glm_1)
confint(glm_1) # Confidence intervals for the model parameters(95% by default)
exp(coef(glm_1))

## Linear Regression model with variables whose Coefficient of Correlation is > 0.50
glm_2 <- lm(area ~ X + Y + DC + DMC + ISI + FFMC, data = trainData, family = binomial())
par(mfrow=c(2,2))
plot(glm_2)
summary(glm_2)
confint(glm_2)
coef(glm_2)
deviance(glm_2)/df.residual(glm_2)

## Linear Regression model with variables of X, Y, temperature, wind and rain
glm_3 <- lm(area ~ X + Y + temp + wind + rain, data=trainData, family = binomial())
par(mfrow=c(2,2))
plot(glm_3)
summary(glm_3)
confint(glm_3)
coef(glm_3)
# Check for overdispersion
deviance(glm_3)/df.residual(glm_3)

## Linear Regression model with variable of DMC(DMC has the most significant p-value)
glm_4 <- lm(area~ DMC, data = trainData, family=binomial())
par(mfrow=c(2,2))
plot(glm_4)
summary(glm_4)
confint(glm_4)
coef(glm_4)
# Check for overdispersion
deviance(glm_4)/df.residual(glm_4)





