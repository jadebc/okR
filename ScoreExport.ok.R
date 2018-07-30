# ScoreExport.ok.R is designed to be called from a HW*.ok.R file
# The script takes the `scores` vector and submissionName and writes
# a JSON scores object to dirName directory, creating one if it doesn't
# exist. 

library(jsonlite)
library(rlist)
library(here)

WriteToFile = function(scores, submissionName, targetDirName) {
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
  
  dir.create(targetDirName, showWarnings = FALSE)
  submissionNameCleaned = strsplit(submissionName, ".R")
  write(scoresJSON, file = here(targetDirName, paste0(submissionNameCleaned, "_ScoreReport.JSON")))
}
