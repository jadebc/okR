# Test OkR HW0 Solution File

# Don't change these lines -- just run them! They load necessary packages and
# set up the autograder.

library(here)
library(nycflights13)
source("hw01.ok.R")
AutograderInit()

# Problem 1
# Assign two integers of your choosing to the values x and y.

x = 3
y = 2

# Check your answer
CheckProblem1()

# Problem 2
# Assign the product of x and y to z

z = x * y

# Check your answer
CheckProblem2()

# Problem 3
# Take the remainder of z divided by 100 and assign it to a. Then, get the first a rows from 
# the nycflights13 dataset and save them in the subsetFlights variable

a = z %% 100
subsetFlights = flights[1:a,]

# Check your answer
CheckProblem3()

# Check your total score
MyTotalScore()


