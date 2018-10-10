## The churn model (2) ##

# Reading data (customize) #
churn = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/churn.csv',
  stringsAsFactors=FALSE, row.names='id')

# Logistic regression #
fm = churn ~ .
mod = glm(formula=fm, data=churn, family="binomial")
score = predict(mod, newdata=churn, type="response")

# Confusion matrices #
conf1 = table(score > 0.5, churn[, 'churn'] == 1)
conf2 = table(score > 0.2, churn[, 'churn'] == 1)

# Benefit analysis #
benefit1 = 0.8 * conf1['TRUE', 'TRUE'] - 0.2 * conf1['TRUE', 'FALSE']
benefit1
benefit2 = 0.8 * conf2['TRUE', 'TRUE'] - 0.2 * conf2['TRUE', 'FALSE']
benefit2

# Benefit function #
f = function(x) 0.8 * sum(score > x & churn[, 'churn'] == 1) -
  0.2 * sum(score > x & churn[, 'churn'] == 0)
f = Vectorize(f)

# Graphical solution #
x = seq(0.05, 0.95, by=0.01)
y = f(x)
plot(x, y,  type="l")

# Alternative approach #
optimize(f, lower=0.05, upper=0.95, maximum=TRUE)

# Decision tree (1) #
library(rpart)
tree1 = rpart(formula=fm, data=churn)
tree1
treescore1 = predict(tree1, newdata=churn)
table(treescore1, churn[, 'churn'])
treeconf1 = table(treescore1 > 0.2, churn[, 'churn']==1)
treeconf1
treebenefit1 = 0.8 * treeconf1['TRUE', 'TRUE'] - 0.2 * treeconf1['TRUE', 'FALSE']
treebenefit1

# Decision tree (2) #
tree2 = rpart(formula=fm, data=churn, cp=0.005)
tree2
treescore2 = predict(tree2, newdata=churn)
table(treescore2, churn[, 'churn'])
treeconf2 = table(treescore2 > 0.2, churn[, 'churn']==1)
treeconf2
treebenefit2 = 0.8 * treeconf2['TRUE', 'TRUE'] - 0.2 * treeconf2['TRUE', 'FALSE']
treebenefit2

