## Churn modeling ##

# Importing the data #
churn = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/churn.csv',
  stringsAsFactors=FALSE, row.names='id')
str(churn)
row.names(churn)[1:10]

# Logistic regression model #
fm = churn ~ .
mod = glm(formula=fm, data=churn, family="binomial") 
summary(mod)
table(churn[, 'dataplan'], churn[, 'datagb'])

# Predictive scores #
score = predict(mod, newdata=churn, type='response')
hist(score[churn[, 'churn']==1], breaks=20,
  main='Figure 1. Scores (churners)', xlab='Churn score')
hist(score[churn[, 'churn']==0], breaks=20,
  main='Figure 2. Scores (non-churners)', xlab='Churn score')

# Confusion matrix (cutoff 0.5) #
conf1 = table(score > 0.5, churn[, 'churn'] == 1)
conf1
tp1 = conf1["TRUE", "TRUE"]/sum(conf1[, "TRUE"])
round(tp1, 3)
fp1 = conf1["TRUE", "FALSE"]/sum(conf1[, "FALSE"])
round(fp1, 3)

# Confusion matrix (cutoff 0.2) #
conf2 = table(score > 0.2, churn[, 'churn'] == 1)
conf2
tp2 = conf2['TRUE', 'TRUE']/sum(conf2[, 'TRUE'])
round(tp2, 3)
fp2 = conf2['TRUE', 'FALSE']/sum(conf2[, 'FALSE'])
round(fp2, 3)
