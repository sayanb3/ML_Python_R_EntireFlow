#Simple Linear Regression 

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#Taking 20 observation in Train and 10 in Test
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting SLR into the Training Set
#means salary is proportional to years of exp. Then we need to specfic 
#on which data this will apply. Its training set here.
regressor=lm(formula = Salary ~ YearsExperience,
             data=training_set)
summary(regressor)

#Predict the Test set value
y_pred=predict(regressor, newdata=test_set)
View(y_pred)

#Visualizing the Training set results
#install.packages('ggplot2')
library(ggplot2)
#1st observation points 2nd the regression lines , then title n labels
#to use ggplot we first type ggplot in parenthesis and then add each of these components 
#step by step
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             colour='red') + #plotting obs points of train set
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            colour='blue') + 
  #x will be years of exp of training set,as we need pred of salaries for training set years exp
  #y will be the training set predicted salaries
   
  ggtitle('Salary versus Experience for Training Set') +
  xlab('Years of Experience') + #this is used for labels
  ylab('Salary')

#Visualizing the Test set results
library(ggplot2)
#1st observation points 2nd the regression lines , then title n labels
#to use ggplot we first type ggplot in parenthesis and then add each of these components 
#step by step
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             colour='red') + #plotting obs points of train set
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            colour='blue') + 
  ggtitle('Salary versus Experience for Test Set') +
  xlab('Years of Experience') + #this is used for labels
  ylab('Salary')


