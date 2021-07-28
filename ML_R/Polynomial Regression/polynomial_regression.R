# Polynomial Regression

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

# Fitting Linear Regression to the dataset. This is LR model.
#training the model on whole data set as its small
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

# Fitting Polynomial Regression to the dataset. This is PR model.
#adding a data frame to add a new column in this data set.Will be level squared
#all values of level column in our dataset and then take square of these levels
#similary take cube and so on.
dataset$Level2 = dataset$Level^2 
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualising the Linear Regression results
# install.packages('ggplot2')
library(ggplot2)
ggplot() + #this initiates the plot
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + #these are the real observation points
                               #geom_point
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') + #prediction component with geom_line function
                               #predic the LR result so use lin_reg as the regressor
                               #newdataset is our dataset on which we want the predictions
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Polynomial Regression results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualising the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new result with Linear Regression
#we will make prediction on single level. 1st argu is the regressor we want to predict with
#2nd argument is the new data which is a single observation. 6.5 level does not exist
#so we need to create a new data frame for this level
predict(lin_reg, data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
#we need to inout all the levels as we have created 4 levels
predict(poly_reg, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4 = 6.5^4))