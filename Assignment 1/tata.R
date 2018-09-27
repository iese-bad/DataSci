## Assignment 1 (Tata Steel stock price) ##

# Opening file (customize) #
tata = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Assignment%201/tata.csv',
  stringsAsFactors=FALSE)
str(tata)

# Cleaning null values for adjusted price #
price = tata[, 'Adj.Close']
sum(price == 'null')
price = price[price != 'null']
price = as.numeric(price)
str(price)
N = length(price)

# Summarizing adjusted price #
summary(price)

# Calculate returns and log returns #
return = 100 * (price[-1]/price[-N] - 1)
logreturn = 100 * (log(price[-1]) - log(price[-N]))
return[1:25]
logreturn[1:25]
summary(return)
summary(return - logreturn)

# Histogram of the returns #
hist(return, xlab='Daily returns', main='')


# Normality #
mean(abs(return - mean(return)) < 2*sd(return))

# Line plot #
plot(return, type='l', xlab='', ylab='Daily returns')
