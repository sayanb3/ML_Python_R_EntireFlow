#!/usr/bin/env python
# coding: utf-8

# # Simple Linear Regression

# ## Importing the libraries

# In[1]:


import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# ## Importing the dataset

# In[2]:


dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values


# ## Splitting the dataset into the Training set and Test set

# In[3]:


from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)
#x_train features of independent variable of training set
#y_train features of dependent variable of training set


# ## Training the Simple Linear Regression model on the Training set

# In[7]:


from sklearn.linear_model import LinearRegression
regressor = LinearRegression() #instance of the Linear Regression class
regressor.fit(X_train, y_train) #fit function is used to train our data on the training set. 


# ## Predicting the Test set results

# In[8]:


y_pred = regressor.predict(X_test) #method used to predict the result is predict method on the test data set. 
#Putting the salaries in a vector called y_pred. This prediction is only working on number years of experience so X_test is taken
#


# ## Visualising the Training set results

# In[9]:


plt.scatter(X_train, y_train, color = 'red') #using scatter plot
plt.plot(X_train, regressor.predict(X_train), color = 'blue') #regression line of prediction very close to predicted salaries.
#use plot method.We are visualizing the training set here , also having predicted value of training set from 2nd argument
plt.title('Salary vs Experience (Training set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()


# ## Visualising the Test set results

# In[10]:


plt.scatter(X_test, y_test, color = 'red') #this is for real observation
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salary vs Experience (Test set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()


# In[ ]:


# Making a single prediction (for example the salary of an employee with 12 years of experience)


# Notice that the value of the feature (12 years) was input in a double pair of square brackets. That's because the "predict" method always expects a 2D array as the format of its inputs. And putting 12 into a double pair of square brackets makes the input exactly a 2D array. Simply put:
# 
# 12→scalar 
# 
# [12]→1D array 
# 
# [[12]]→2D array

# In[14]:


print(regressor.predict([[12]]))


# Getting the final linear regression equation with the values of the coefficients

# In[19]:


print(regressor.coef_)


# In[17]:


print(regressor.intercept_)


# Therefore, the equation of our simple linear regression model is:
# 
# Salary=9345.94×YearsExperience+26816.19
# To get these coefficients we called the "coef_" and "intercept_" attributes from our regressor object. Attributes in Python are different than methods and usually return a simple value or an array of values. These are the default attributes of the regressor object.
