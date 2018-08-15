## The spam filter ##

# Importing the data#
spam = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/spam.csv')
str(spam[, 1:5])
str(spam[, 48:52])

# Building a decision tree #
fm = spam ~ .
library(rpart)
tree1 = rpart(formula=fm, data=spam)
tree1
plot(tree1, branch=0, main='Figure 1. Decision tree for spam filtering',
  margin=0.01)
text(tree1, font=1, cex=0.6)

# Predictive scores and confusion matrix #
score1 = predict(tree1, newdata=spam)
conf1 = table(score1 > 0.5, spam[, 'spam']==1)
conf1

tp1 = conf1['TRUE', 'TRUE']/sum(conf1[, 'TRUE'])
round(tp1, 3)
fp1 = conf1['TRUE', 'FALSE']/sum(conf1[, 'FALSE'])
round(fp1, 3)
table(score1, spam[, 'spam'])

# Controlling pruning #
tree2 = rpart(formula=fm, data=spam, cp=0.005)
score2 = predict(tree2, newdata=spam)
conf2 = table(score2 > 0.5, spam[, 'spam']==1)
conf2
tp2 = conf2['TRUE', 'TRUE']/sum(conf2[, 'TRUE'])
round(tp2, 3)
fp2 = conf2['TRUE', 'FALSE']/sum(conf2[, 'FALSE'])
round(fp2, 3)

