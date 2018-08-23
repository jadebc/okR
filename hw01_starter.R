# Install packages required for R homework

# Important: Be sure to restart RStudio after 
# Note: You only need to run this line once!
devtools::source_gist(id='5803c054fc2250054a3716b71c0b8b70', filename='hw_setup.R', quiet = TRUE)
#####################################
# COURSE TITLE
# Course description

# Homework 01
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

x = ">>>>>FILL IN YOUR CODE HERE<<<<<"
y = ">>>>>FILL IN YOUR CODE HERE<<<<<"

# Check your answer
CheckProblem1()

# Problem 2
# Assign the product of x and y to z

z = ">>>>>FILL IN YOUR CODE HERE<<<<<"

# Check your answer
CheckProblem2()

# Problem 3
# Take the remainder of z divided by 100 and assign it to a. Then, get the first a rows from 
# the nycflights13 dataset and save them in the subsetFlights variable

a = ">>>>>FILL IN YOUR CODE HERE<<<<<"
subsetFlights = ">>>>>FILL IN YOUR CODE HERE<<<<<"

# Check your answer
CheckProblem3()

# Check your total score
MyTotalScore()


