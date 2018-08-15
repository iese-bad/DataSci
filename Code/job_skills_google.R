## Skills requested in Google job posts ##

# Loading the package #
library(stringr)

# Importing the data #
google = read.csv('https://raw.githubusercontent.com/iese-bad/DataSci/master/Data/skills_google.csv',
  stringsAsFactors=FALSE, encoding='UTF-8')
str(google)

# Exploring the company #
table(google[, 'company'])

# Exploring the titles #
title = google[, 'title']
length(unique(title))
sort(table(title), decreasing=TRUE)[1:10]
sum(str_detect(title, 'Intern'))
sum(str_detect(title, 'Sales'))
sum(str_detect(title, 'Cloud'))
sum(str_detect(title, 'Google Cloud'))
title_short = str_replace_all(title, ' [(].+[)]', '')
title_terms = unlist(str_split(title_short, ', '))
length(unique(title_terms))
sort(table(title_terms), decreasing=TRUE)[1:25]

# Exploring categories #
sort(table(google[, 'category']), decreasing=TRUE)

# Exploring countries #
country = str_replace_all(google[, 'location'], '.+,', '')
length(unique(country))
sort(table(country), decreasing=TRUE)[1:15]

# Exploring responsibilities #
resp = google[, 'responsibilities']
resp = str_to_lower(resp)
resp[1]
resp_terms = str_extract_all(resp, '[a-z]+')
is.list(resp_terms)
resp_terms = unlist(resp_terms)
is.vector(resp_terms)
length(unique(resp_terms))
sort(table(resp_terms), decreasing=TRUE)[1:50]

# Exploring minimum qualifications #
minqual = google[, 'minqual']
minqual = str_to_lower(minqual)
minqual[1]
minqual_terms = str_extract_all(minqual, '[a-z]+')
minqual_terms = unlist(minqual_terms)
length(unique(minqual_terms))
sort(table(minqual_terms), decreasing=TRUE)[1:50]
sum(str_detect(minqual_terms, 'sql'))
sum(str_detect(minqual_terms, 'javascript'))
sum(str_detect(minqual_terms, 'python'))

# Exploring preferred qualifications #
prefqual = google[, 'prefqual']
prefqual = str_to_lower(prefqual)
prefqual[1]
prefqual_terms = str_extract_all(prefqual, '[a-z]+')
prefqual_terms = unlist(prefqual_terms)
length(unique(prefqual_terms))
sort(table(prefqual_terms), decreasing=TRUE)[1:50]
sum(str_detect(prefqual_terms, 'sql'))
sum(str_detect(prefqual_terms, 'javascript'))
sum(str_detect(prefqual_terms, 'python'))

