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


# Feature Scaling not needed. Since its nothing but a MLR model with polynomial
#terms. 
# training_set = scale(training_set)
# test_set = scale(test_set)


# Fitting SVR to the dataset.
install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
              data = dataset,
              type = 'eps-regression') #since we are doing regression. so this is the type
                                     #we use

# Predicting a new result 
predict(regressor, data.frame(Level = 6.5))

# Visualizing the  SVR Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR Model)') +
  xlab('Level') +
  ylab('Salary')