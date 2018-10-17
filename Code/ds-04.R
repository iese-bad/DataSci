## [DS-04] Dates and strings in R ##

# Dates #
d1 = '2019-01-01'
class(d1)
d2 = as.Date(d1)
class(d2)
as.numeric(d2)
d2 - 17897

# Datetimes #
dt1 = '2019-01-01 00:00:00'
class(dt1)
dt2 = as.POSIXct(dt1)
class(dt2)
as.numeric(dt2)
dt2 - 1546300800
dt3 = as.POSIXlt(dt1)
dt3
unlist(dt3)

# String length #
library(stringr)
str_length(c('Donald Trump', 'Hillary Clinton'))
str_length('')

# Extract substrings #
dates = c('2016-10-06', '2015-08-19', '2016-01-30')
year = str_sub(dates, 1, 4)
year
str_sub(dates, 1, 4) = 'yyyy'
dates

# Paste multiple strings into a single string #
str_c('Let us suppose', 'that this is not true', sep=' ')

# Conversion to lowercase #
students = c('Donald', 'Pablo', 'Liudmila', 'Nana Yaa')
str_to_lower(students)

# Trimming white space at the extremes of a string #
str trim('Correlation is not causation ')

# Detect the presence of a pattern in a string #
str_detect(students, 'an')

# Extract matching patterns from a string #
str_extract all(students, 'a')
str_extract all(students, 'a', simplify= TRUE)

# Replace matched patterns in a string #
str_replace all(students, ' ', '-')
str_replace all(students, 'o| ', '-')

# Splitting up a string into pieces #
str_split('Correlation is not causation', ' ')

# Regular expressions #
bio = 'I was born in 1954'
str_replace_all(bio, '[a-z]', 'x')
str_replace_all(bio, '[a-zA-Z]', 'x')
str_replace_all(bio, '[0-9]', 'x')
str_replace_all(bio, '[a-zA-Z]+', 'x')
str_replace_all(bio, '[0-9]f1,4g', 'x')
str extract_all(bio, '[a-zA-Z0-9]+')
