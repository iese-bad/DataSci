## Market basket analysis at the grocery outlet ##

# Importing data #
import pandas as pd
groceries = pd.read_csv("https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/groceries.csv")
groceries.shape

# Mining itemsets #
from mlxtend.frequent_patterns import apriori
frequent_itemsets = apriori(groceries, min_support=0.01, use_colnames=True)
frequent_itemsets.info()
frequent_itemsets.head()
frequent_itemsets['length'] = frequent_itemsets['itemsets'].apply(lambda x: len(x))
frequent_itemsets.head()
item1 = frequent_itemsets[frequent_itemsets['length'] == 1]
item1.sort_values('support', ascending=0)[:20]
item2 = frequent_itemsets[frequent_itemsets['length'] == 2]
item2.sort_values('support', ascending=0)[:20]
item3 = frequent_itemsets[frequent_itemsets['length'] == 3]
item3.sort_values('support', ascending=0)[:20]

# Mining rules #
from mlxtend.frequent_patterns import association_rules
rules = association_rules(frequent_itemsets, metric="confidence", min_threshold=0.25)
rules = rules.sort_values('confidence', ascending=0)[0:20]
rules[['antecedents', 'consequents', 'support', 'confidence', 'lift']]
