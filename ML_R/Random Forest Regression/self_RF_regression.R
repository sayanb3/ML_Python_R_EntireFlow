#Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]#indexes of columns we want to keep. last 2 columns

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling not needed. Since its nothing but a MLR model with polynomial
#terms. 
# training_set = scale(training_set)
# test_set = scale(test_set)


# Fitting Random Forest Regression to the dataset.
install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],  #gives the data frame with index 1 
                         #as we need the independent variable 
                         y = dataset$Salary, #this is a vector , dependent variable
                         ntree = 500) #we need no of trees for RF algo

#create your regressor here

# Predicting a new result 
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the  Random Forest Regression Model results for higher resolution and smoother curve
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level) , 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level=x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')
