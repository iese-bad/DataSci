## House sales in King County ##

# Importing the data #
king = read.csv(file='https://raw.githubusercontent.com/mcanela-iese/DataSci_UM/master/Data/king.csv',
  stringsAsFactors=FALSE)
dim(king)
sum(duplicated(king[, 'id']))
sum(duplicated(king))
str(king)
summary(king[, -(1:3)])

# Linear regression model #
fm = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above + yr_built + yr_renovated + lat + long
mod = lm(formula=fm, data=king)
names(mod)
summary(mod)
pred_price = predict(object=mod, newdata=king)
pred_error = king[, 'price'] - pred_price

# Graphics #
hist(king[, 'price'], main='Figure 1. Actual price', xlab='Actual price')
hist(pred_error, main='Figure 2. Prediction error', xlab='Residual')
plot(king[, 'price'] ~ pred_price, pch='.',
  main='Figure 3. Actual price vs predicted price',
  xlab='Predicted price', ylab='Actual price')
