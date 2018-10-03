## House sales in King County (continuation) ##

# Reading data #
king = read.csv(file='https://raw.githubusercontent.com/mcanela-iese/DataSci_UM/master/Data/king.csv',
  stringsAsFactors=FALSE)

# Linear regression model (original scale) #
round(cor(king[, -(1:3)]), 2)
fm1 = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above + yr_built + yr_renovated + lat + long
mod1 = lm(formula=fm1, data=king)
summary(mod1)$r.square
pred1 = predict(mod1, newdata=king)
cor(king[, 'price'], pred1)
error1 = king[, 'price'] - pred1

# Linear regression model (log scale) #
fm2 = log(price) ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above + yr_built + yr_renovated + lat + long
mod2 = lm(formula=fm2, data=king)
summary(mod2)$r.square
pred2 = exp(predict(mod2, newdata=king))
cor(king[, 'price'], pred2)
error2 = king$price - pred2

# Comparison #
summary(error1)
summary(error2)
par(mfrow=c(1,2))
hist(error1, main="Figure 1a. Prediction error (1)", xlab="")
hist(error2, main="Figure 1b. Prediction error (2)", xlab="")
plot(king[, 'price'] ~ pred1, pch=".",
  main="Figure 2a. Actual vs predicted price (1)",
  xlab="Predicted price", ylab="Actual price")
plot(king[, 'price'] ~ pred2, pch=".",
  main="Figure 2b. Actual vs predicted price (2)",
  xlab="Predicted price", ylab="Actual price")

# Trimming the data (try different maxprice) #
maxprice = 1*10^6
sum(king[, 'price'] < maxprice)
trim_king = king[king[, 'price'] < maxprice, ]
trim_mod1 = lm(formula=fm1, data=trim_king)
summary(trim_mod1)$r.square
trim_pred1 = predict(trim_mod1, newdata=trim_king)
trim_error1 = trim_king[, 'price'] - trim_pred1
summary(trim_pred1)
summary(trim_error1)

# Including zipcode #
sort(unique(king[, 'zipcode']))
table(king[, 'zipcode'])
sort(unique(substr(king[, 'zipcode'], 1, 4)))
fm3 = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above +
  yr_built + yr_renovated + substr(zipcode, 1, 4)
mod3 = lm(formula=fm3, data=king)
summary(mod3)$r.square
fm4 = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
    waterfront + condition + sqft_above +
    yr_built + yr_renovated + as.character(zipcode)
mod4 = lm(formula=fm4, data=king)
summary(mod4)$r.square

# Time effects #
table(substr(king[, 'date'], 1, 6))
par(mfrow=c(1,1))
plot(tapply(king[, 'price'], substr(king[, 'date'], 1, 6), mean), type="l",
  main="Figure 3. Seasonality", xlab="Month", ylab="Price")
fm5 = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above + yr_built + yr_renovated + lat +
  long + substr(date, 1, 6)
mod5 = lm(formula=fm5, data=king)
summary(mod5)$r.square

# Dealing with year of renovation #
table(king[, 'yr_renovated'])
hist(king[, 'yr_built'])
tapply(king[, 'yr_built'], king[, 'yr_renovated'] > 0, median)
fm6 = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors +
  waterfront + condition + sqft_above + yr_built + (yr_renovated == 0) +
  lat + long
mod6 = lm(formula=fm6, data=king)
summary(mod6)$r.square
