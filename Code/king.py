## House sales in King County ##

# Importing the data #
import pandas as pd
king = pd.read_csv('https://raw.githubusercontent.com/mcanela-iese/DataSci_UM/master/Data/king.csv')
king.shape
king['id'].duplicated().sum()
king.duplicated().sum()
king.info()
king.iloc[:, 3:18].describe()

# Linear regression model #
y = king['price']
X = king[['bedrooms', 'bathrooms', 'sqft_living', 'sqft_lot', 'floors',
  'waterfront', 'condition', 'sqft_above', 'yr_built', 'yr_renovated',
  'lat', 'long']]
from sklearn.linear_model import LinearRegression
lm = LinearRegression()
lm.fit(X, y)
lm.score(X, y)
pred_price = lm.predict(X)
pred_error = king['price'] - pred_price

# Histograms #
import matplotlib.pyplot as plt
plt.figure(1, figsize=(10,8))
plt.hist(king['price']/1000, color='0.7')
plt.title('Figure 1. Actual price')
plt.xlabel('Actual price (thousands)')
plt.ylabel('Frequency')
plt.show()
plt.figure(1, figsize=(10,8))
plt.hist(pred_error/1000, color='0.7')
plt.title('Figure 2. Prediction error')
plt.xlabel('Prediction error (thousands)')
plt.ylabel('Frequency')
plt.show()

# Scatterplot #
plt.figure(1, figsize=(10,9))
plt.scatter(pred_price/1000, king['price']/1000, color='0.3', s=1)
plt.title('Figure 3. Actual vs predicted price')
plt.xlabel('Predicted price (thousands)')
plt.ylabel('Actual price (thousands)')
plt.show()
