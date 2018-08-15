## Market basket analysis at the grocery outlet ##

# Loading the package #
library(arules)

# Importing data #
groceries = read.csv("https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/groceries.csv")
dim(groceries)

# Coerce to a matrix #
groceries = as.matrix(groceries)

# Mining itemsets #
item1 = apriori(groceries, parameter=list(support=0.01, minlen=1, maxlen=1,
  target="frequent itemsets"))
item1 = sort(item1, by='support')[1:20]
inspect(item1)
item2 = apriori(groceries, parameter=list(support=0.01, minlen=2, maxlen=2,
  target='frequent itemsets'))
item2 = sort(item2, by="support")[1:20]
inspect(item2)
item3 = apriori(groceries, parameter=list(support=0.01, minlen=3, maxlen=3,
  target='frequent itemsets'))
item3 = sort(item3, by="support")[1:20]
inspect(item3)

# Mining rules #
rules = apriori(groceries, parameter=list(support=0.01, confidence = 0.25,
  maxlen=2, minlen=2, target='rules'))
rules = sort(rules, by='confidence')[1:20]
inspect(rules)
