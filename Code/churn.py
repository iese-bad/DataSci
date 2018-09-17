## Churn modeling ##

# Importing the data #
import pandas as pd
churn = pd.read_csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/churn.csv',
    index_col=0)
churn.info()
churn.index[0:10]

# Checking redundancy #
pd.crosstab(churn['datagb'], churn['dataplan'])

# Logistic regression model #
y = churn['churn']
X1 = pd.get_dummies(churn['datagb'])
X1.head()
X2 = churn[['aclength', 'intplan', 'ommin', 'omcall',
  'otmin', 'otcall', 'ngmin', 'ngcall', 'imin', 'icall', 'cuscall']]
X = pd.concat([X1, X2], axis=1)
X.head()
from sklearn.linear_model import LogisticRegression
logis = LogisticRegression()
logis.fit(X, y)

# Predictive scores #
scores = logis.predict_proba(X)
scores[0:5, 0:5]
score = pd.Series(scores[:, 1])
score.index = churn.index
import matplotlib.pyplot as plt
plt.figure(1, figsize=(10,8))
plt.hist(score[churn['churn']==1], bins=20, range=(0,1), color='0.7')
plt.title('Figure 1. Scores (churners)')
plt.xlabel('Churn score')
plt.ylabel('Frequency')
plt.show()
plt.figure(1, figsize=(10,8))
plt.hist(score[churn['churn']==0], bins=20, range=(0,1), color='0.7')
plt.title('Figure 2. Scores (non-churners)')
plt.xlabel('Churn score')
plt.ylabel('Frequency')
plt.show()

# Confusion matrix (cutoff 0.5) #
conf1 = pd.crosstab(score > 0.5, churn['churn'] == 1)
conf1
tp1 = conf1.iloc[1, 1]/(conf1.iloc[0, 1] + conf1.iloc[1, 1])
tp1.round(3)
fp1 = conf1.iloc[1, 0]/(conf1.iloc[0, 0] + conf1.iloc[1, 0])
fp1.round(3)

# Confusion matrix (cutoff 0.2) #
conf2 = pd.crosstab(score > 0.2, churn['churn'] == 1)
conf2
tp2 = conf2.iloc[1, 1]/(conf2.iloc[0, 1] + conf2.iloc[1, 1])
tp2.round(3)
fp2 = conf2.iloc[1, 0]/(conf2.iloc[0, 0] + conf2.iloc[1, 0])
fp2.round(3)
