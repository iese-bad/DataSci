## Employees leaving prematurely ##

# Importing the data #
import pandas as pd
turnover = pd.read_csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/turnover.csv')
turnover.shape
turnover.head(10)
turnover.info()

# Summarizing numeric variables #
turnover.iloc[:, 0:8].describe().round(2)

# Summarizing categorical variables #
tab1 = turnover['dept'].value_counts()
tab1
tab2 = pd.crosstab(turnover['dept'], turnover['salary'])
tab2

# Pivot tables #
tab3 = pd.pivot_table(data=turnover, index=['salary'], values=['left'],
    aggfunc='mean')
tab3.round(3)
import matplotlib.pyplot as plt
tab3.plot.bar(title='Figure 1. Barplot', figsize=(7,7), color='0.7')
plt.show()
tab4 = pd.pivot_table(data=turnover, index=['dept'], values=['left'],
    aggfunc='mean',)
tab4.round(3)

# Correlation #
R = turnover.iloc[:, 0:8].corr()
R.round(2)

# Histogram #
plt.figure(1, figsize=(7,7))
plt.hist(turnover['eval'], color='0.7')
plt.title('Figure 2. Histogram')
plt.xlabel('Evaluation')
plt.ylabel('Frequency')
plt.show()

# Scatter plot #
plt.figure(1, figsize=(7,7))
plt.scatter(x=turnover['hours'], y=turnover['eval'], color='0.6', s=1)
plt.title('Figure 3. Scatterplot')
plt.xlabel('Hours')
plt.ylabel('Evaluation')
plt.show()
