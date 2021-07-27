#importing  the dataset
dataset = read.csv('Data.csv')

#taking care of missing data of Age and Salary
#1st block will return true if value in age column is missing and if its missing then
#we have to calculate the average with the second parameter of ifelse
#3rd parameter we have to return if value is not true means not missing
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm=TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm=TRUE)),
                     dataset$Salary)


#Encoding Categorical Variables Country and Purchase Column
#using 1 from France and like that
dataset$Country = factor(dataset$Country, 
                         levels = c('France','Spain','Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased, 
                         levels = c('Yes', 'No'),
                         labels = c(1, 0))

#Splitting data between training and Test set
#install.packages('caTools') . This library needed to make a good split
#Split returns True/False for each of the observations. TRUE goes to Train set
#FALSE goes to Test set

library(caTools)
set.seed(123)
split=sample.split(dataset$Purchased , SplitRatio=0.8)
training_set=subset(dataset, split==TRUE)
test_set=subset(dataset, split==FALSE)


#Feature Scaling
#exclude categorical columns because those are factor values and not exact numeric values
#indexes of Age and Salary only
training_set[,2:3]=scale(training_set[,2:3])
test_set[,2:3]=scale(test_set[,2:3])









