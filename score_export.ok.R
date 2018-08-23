# ScoreExport.ok.R is designed to be called from a HW*.ok.R file
# The script takes the `scores` vector and submissionName and writes
# a JSON scores object named `{submissionName}_ScoreReport.JSON` to 
# the current directory.

library(jsonlite)
# library(rlist)

WriteToFile = function(scores, submissionName) {
  scoresList = list()
  problemNumber = 1
  
  while (problemNumber <= length(scores)) {
    
    score = scores[problemNumber]
    
    if (score == TRUE) {
      scoresList = list.append(scoresList, 1)
    } else {
      scoresList = list.append(scoresList, 0)
    }
    
    problemTitle = paste("Problem", problemNumber)
    names(scoresList)[problemNumber] = problemTitle
    
    problemNumber = problemNumber + 1
  }
  
  scoresJSON = toJSON(scoresList,
                      pretty=TRUE,
                      auto_unbox=TRUE)
  
  submissionNameCleaned = strsplit(submissionName, ".R")
  write(scoresJSON, file = paste0(submissionNameCleaned, "_score.JSON"))
}
