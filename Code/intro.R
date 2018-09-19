## [DS-02] Introduction to R ##

# Start #
2 + 2
a = 2 + 2
a

# Numeric vector #
x = 1:10
x

# Character vector #
y = c('Messi', 'Neymar', 'Cristiano')
y

# Logical vector #
z = x > 5
z

# Factor #
y_factor = factor(y)
y_factor

# Everything is a vector #
is.vector(a)
length(a)

# List #
L = list(1:10, c('Messi', 'Neymar', 'Cristiano'), TRUE)
L
L[[1]]

# List with names #
L = list(L1=1:10, L2=c('Messi', 'Neymar', 'Cristiano'), L3=TRUE)
L['L2']
L$L2

# Subsetting #
x[1:3]
x[-c(1, 4)]
x >= 5
x[x >= 5]

# For loop #
x = 1
for(i in 1:10) x = x + 1
x

# Fibonacci numbers #
x = c(1, 1)
for (i in 3:10) x[i] = x[i-1] + x[i-2]
x

# Function #
f = function(x) 1/(1 - x**2)
f(0.5)
f(1)
f('Mary')

# Function of two variables #
f = function(x, y) x*y/(x**2 + y**2)
f(1,1)

# Function involving a loop # 
f = function(n) {
  x = c(1,1)
  for(i in 3:n) x[i] = x[i-1] + x[i-2]
  return(x)
}
f(10)
