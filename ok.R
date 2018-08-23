# Test OkR HW0 Autograding File
# Default usage handles single file submission fileName contained in same working directory.
# Can modify to grade multiple submissions from pathSubmissions directory

# SETUP: test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

# library(checkr)         # CheckR is generally more useful for open-ended, broader checks
# library(assertthat)     # Assertthat is generally more useful for more specific, assertion-based checks
library(evaluate)



### Sources the file to be graded
args = commandArgs(trailingOnly = TRUE)
fileName = args[1]

# Performs autograding and writes output as JSON
# evaluate(file(fileName), stop_on_error=0)
capture.output(evaluate(file(fileName), stop_on_error=0), file='NUL')
source("score_export.ok.R")
WriteToFile(scores, fileName)

# validate_that returns an error message or "True"
# check_* returns a copy of x, so we can't use the same scoring scheme for checkR
# Change nrow=a to nrow=a+1 to get an example of what an "error" looks like
