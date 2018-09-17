## Skills requested in Google job posts ##

# Importing the data #
import pandas as pd
google = pd.read_csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/skills_google.csv',
     encoding='utf_8')
google.info()

# Exploring the company #
google['company'].value_counts()

# Exploring the titles #
title = google['title']
title.unique().shape
title.value_counts()[0:10]
title.str.contains('Intern').sum()
title.str.contains('Sales').sum()
title.str.contains('Cloud').sum()
title.str.contains('Google Cloud').sum()
title_short = title.str.replace(' [(].+[)]', '')
title_terms_0 = list(title_short.str.split(', '))
title_terms = title_terms_0[0]
for x in title_terms_0[1:]:
    title_terms = title_terms + x
len(list(set(title_terms)))
title_terms = pd.Series(v for v in title_terms)
title_terms.value_counts()[:25]

# Exploring categories #
google['category'].value_counts()

# Exploring countries #
country = google['location'].str.replace('.+,', '')
country.unique().shape
country.value_counts()[:10]

# Exploring responsibilities #
resp = google['responsibilities']
resp.isnull().sum()
resp = resp.dropna()
resp = resp.str.lower()
resp.iloc[0]
resp_terms_0 = resp.str.findall('[a-z]+')
resp_terms = resp_terms_0[0]
for x in resp_terms_0[1:100]:
    resp_terms = resp_terms + x
len(list(set(resp_terms)))
resp_terms = pd.Series(v for v in resp_terms)
resp_terms.value_counts()[:50]

# Exploring minimum qualifications #
minqual = google['minqual']
minqual.isnull().sum()
minqual = minqual.dropna()
minqual = minqual.str.lower()
minqual.iloc[0]
minqual_terms_0 = minqual.str.findall('[a-z]+')
minqual_terms = minqual_terms_0[0]
for x in minqual_terms_0[1:100]:
    minqual_terms = minqual_terms + x
len(list(set(minqual_terms)))
minqual_terms = pd.Series(v for v in minqual_terms)
minqual_terms.value_counts()[:50]
minqual_terms.str.contains('sql').sum()
minqual_terms.str.contains('javascript').sum()
minqual_terms.str.contains('python').sum()

# Exploring preferred qualifications #
prefqual = google['prefqual']
prefqual.isnull().sum()
prefqual = prefqual.dropna()
prefqual = prefqual.str.lower()
prefqual.iloc[0]
prefqual_terms_0 = prefqual.str.findall('[a-z]+')
prefqual_terms = prefqual_terms_0[0]
for x in prefqual_terms_0[1:]:
    prefqual_terms = prefqual_terms + x
len(list(set(prefqual_terms)))
prefqual_terms = pd.Series(v for v in prefqual_terms)
prefqual_terms.value_counts()[:50]
prefqual_terms.str.contains('sql').sum()
prefqual_terms.str.contains('javascript').sum()
prefqual_terms.str.contains('python').sum()
