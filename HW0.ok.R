# Test OkR HW0 Autograding File
# Default usage handles single file submission fileName contained in same working directory.
# Can modify to grade multiple submissions from pathSubmissions directory

library(checkr)         # CheckR is generally more useful for open-ended, broader checks
library(assertthat)     # Assertthat is generally more useful for more specific, assertion-based checks
library(here)
source("ScoreExport.ok.R")

# Graded submissions will be generated into JSONs and populate targetDirName
targetDirName = "Hw0_Scored"

### (A) If grading single file, can source directly
fileName = "Hw0_Submission.R"

### (B) If grading from a directory, provide pathSubmissions to submissions directory
# pathSubmissions = "HW0_Submissions"
# filesToGrade = list.files(here(pathSubmissions))

# Changed per assignment
Autograde = function() {
  scores = c()

  # Problem 1 Score
  scores = c(scores, validate_that(is.numeric(x) & is.numeric(y)))

  # Problem 2 Score
  scores = c(scores, validate_that(is.numeric(x), is.numeric(y),
                                   is.numeric(z), is.numeric(z),
                                   are_equal(z, x*y)))

  # Problem 3 Score
  subsetFlightsCopy = tryCatch(
    expr=check_data(x=subsetFlights,
                    values=colnames(flights), exclusive=TRUE, order=FALSE,
                    nrow=a,
                    error=TRUE),
    error=function(e) e
  )
  scores = c(scores, validate_that(identical(subsetFlights, subsetFlightsCopy)))

  return(scores)
}

### (A) Grades fileName
source(fileName)
scores = Autograde()
WriteToFile(scores, fileName, targetDirName)

### (B) Autogrades multiple submissions in specified pathSubmissions directory
# for (i in 1:length(filesToGrade)) {
#   source(here(pathSubmissions, filesToGrade[[i]]))
#   scores = Autograde()
#   WriteToFile(scores, filesToGrade[[i]], targetDirName)
# }


# validate_that returns an error message or "True"
# check_* returns a copy of x, so we can't use the same scoring scheme for checkR
# Change nrow=a to nrow=a+1 to get an example of what an "error" looks like
