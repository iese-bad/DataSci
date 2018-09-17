## The spam filter ##

# Importing the data#
import pandas as pd
spam = pd.read_csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/spam.csv')
spam.iloc[:, 0:5].info()
spam.iloc[:, 47:52].info()

# Building a decision tree #
y = spam.iloc[:, 51]
X = spam.iloc[:, 0:51]
from sklearn.tree import DecisionTreeRegressor, export_graphviz
tree1 = DecisionTreeRegressor(min_impurity_decrease=0.01)
tree1.fit(X, y)
import sklearn.tree
dot_data = export_graphviz(tree1, out_file=None,
  feature_names=spam.columns[0:51])
import graphviz
graphviz.Source(dot_data)

# Predictive scores and confusion matrix #
score1 = tree1.predict(X)
conf1 = pd.crosstab(score1 > 0.5, spam['spam']==1)
conf1
tp1 = conf1.iloc[1, 1]/(conf1.iloc[0, 1] + conf1.iloc[1, 1])
tp1.round(3)
fp1 = conf1.iloc[1, 0]/(conf1.iloc[0, 0] + conf1.iloc[1, 0])
fp1.round(3)
pd.crosstab(score1, spam['spam'])

# Controlling pruning #
tree2 = DecisionTreeRegressor(min_impurity_decrease=0.001)
tree2.fit(X, y)
score2 = tree2.predict(X)
conf2 = pd.crosstab(score2 > 0.5, spam['spam']==1)
conf2
tp2 = conf2.iloc[1, 1]/(conf2.iloc[0, 1] + conf2.iloc[1, 1])
tp2.round(3)
fp2 = conf2.iloc[1, 0]/(conf2.iloc[0, 0] + conf2.iloc[1, 0])
fp2.round(3)
