## Employees leaving prematurely ##

# Importing the data #
turnover = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/turnover.csv',
  stringsAsFactors=FALSE)
dim(turnover)
head(turnover, 10)
str(turnover)

# Summarizing numeric variables #
summary(turnover[, 1:8])

# Summarizing categorical variables #
tab1 = table(turnover[, 'dept'])
tab1
sort(tab1, decreasing=TRUE)
tab2 = table(turnover[, 'dept'], turnover[, 'salary'])
tab2
tab3 = tapply(turnover[, 'left'], turnover[, 'salary'], mean)
round(tab3, 3)
barplot(tab3, main='Figure 1. Barplot')
tab4 = tapply(turnover[, 'left'], turnover[, 'dept'], mean)
round(sort(tab4, decreasing=TRUE), 3)

# Correlation #
R = cor(turnover[, 1:8])
round(R, 2)
      
# Plotting #
hist(turnover[, 'eval'], main='Figure 2. Histogram', xlab='Evaluation')
plot(eval ~ hours, data=turnover, pch='.', main='Figure 3. Scatterplot',
  xlab='Hours', ylab='Evaluation')
