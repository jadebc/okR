# Test OkR HW0 Solution File

library(nycflights13)

# Problem 1
# Assign two integers of your choosing to the values x and y.

x = 5
y = 10

# Problem 2
# Assign the product of x and y to z

z = x * y

# Problem 3
# Take the remainder of z divided by 100 and assign it to a. Then, get the first a rows from 
# the nycflights13 dataset and save them in the subsetFlights variable
a = z %% 100

subsetFlights = flights[1:a,]
