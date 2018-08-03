library(here)
library(jsonlite)
library(rlist)
library(checkr)         # CheckR is generally more useful for open-ended, broader checks
library(assertthat)     # Assertthat is generally more useful for more specific, assertion-based checks

AutograderInit = function() {
  scores <<- vector(mode="character", length=3)   # Put total number of questions here
}

ReturnScore = function(problemNumber, eval) {
  if (eval == TRUE) {
    cat(sprintf("Problem %d: 1/1\n", problemNumber))
  }
  else {
    cat(sprintf("Problem %d: 0/1\nError: %s\n", problemNumber, eval))
  }
}

CheckProblem1 = function() {
  problemNumber = 1   # Change to question #
  eval = validate_that(is.numeric(x) & is.numeric(y), msg="Wrong!")
  
  scores[problemNumber] <<- eval
  ReturnScore(problemNumber, eval)
}

CheckProblem2 = function() {
  problemNumber = 2   # Change to question #
  eval = validate_that(is.numeric(x), is.numeric(y),
                       is.numeric(z), is.numeric(z),
                       are_equal(z, x*y))
  
  scores[problemNumber] <<- eval
  ReturnScore(problemNumber, eval)
}

CheckProblem3 = function() {
  problemNumber = 3   # Change to question #
  subsetFlightsCopy = tryCatch(
    expr=check_data(x=subsetFlights,
                    values=colnames(flights), exclusive=TRUE, order=FALSE,
                    nrow=a,
                    error=TRUE),
    error=function(e) e
  )
  eval = validate_that(are_equal(a, z%%100), 
                       identical(subsetFlights, subsetFlightsCopy))
  
  scores[problemNumber] <<- eval
  ReturnScore(problemNumber, eval)
}

# Renders scores from each problem and returns as a dataframe.
MyTotalScore = function() {
  scoresList = c()
  problemNumber = 1
  problemTitles = c()
  totalCorrect = 0

  while (problemNumber <= length(scores)) {

    score = scores[problemNumber]
    if (score == TRUE) {
      scoresList = c(scoresList, "1/1")
      totalCorrect = totalCorrect + 1
    } else {
      scoresList = c(scoresList, "0/1")
    }

    problemTitle = sprintf("Problem %d:", problemNumber)
    problemTitles = c(problemTitles, problemTitle)

    problemNumber = problemNumber + 1
  }
  
  problemTitles = c(problemTitles, "Total Score:")
  scoresList = c(scoresList, sprintf("%d/%d", totalCorrect, length(scores)))
  
  renderedScores = data.frame(
    Score = scoresList
  )
  rownames(renderedScores) = problemTitles
  colnames(renderedScores) = ""
  
  return(renderedScores)
}
