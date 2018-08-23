#####################################
# COURSE TITLE
# Course description

# Homework 02
#################################################
# Install packages required for R homework

# Important: Be sure to restart RStudio after 
# Note: You only need to run this line once!
devtools::source_gist(id='5803c054fc2250054a3716b71c0b8b70', filename='hw_setup.R', quiet = TRUE)
#################################################
# Test OkR HW0 Solution File

# Don't change these lines -- just run them! 

# Load okR autograder
devtools::source_gist(id='fd4ea1d7041cd97eb637d2968e6c04a7', filename='hw01.ok.R', quiet = TRUE)
AutograderInit()

# Load the dataset
library(nycflights13)

#################################################

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

# Problem 4
# Assign an integer value to the variable w.

w = "this is wrong!"

# Check your answer
CheckProblem4()

# Problem 5
# Assign your name to the variable name.

name = 'John'

# Check your answer
CheckProblem5()

# Check your total score
MyTotalScore()


