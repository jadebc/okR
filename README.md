# OkR

### Overview 

OkR is an autograding scheme designed to be used for courses assigning problem sets in R. The student can download the starter files, check their solutions locally, and submit to the Ok server, initiating autograding on the instructor side. The scores can then be posted to the Ok website or released to students in an Ok-generated email.

### Example Workflow

1. *Instructor* releases the skeleton file to *students*, alongside any utility files, datasets, assignment specifications, or example code. This is represented by the [Example HW Skeleton](https://github.com/jadebc-berkeley/okR/blob/master/Hw0_Skeleton.R).
2. *Students* receive skeleton file and/or specification and begin work in RStudio. They complete their assignment and prepare for submission. This is represented by the [Example HW Submission](https://github.com/jadebc-berkeley/okR/blob/master/HW0_Submission.R).
3. *Students* submit their submission code through the [OkPy](https://okpy.org) submission system. Students can authorize OkPy with a Google account, so there is no account setup step involved. 
4. The *instructor* can then queue student submissions to the autograder on the instructor side of OkPy. For each submission, a Docker environment is initiated and autograding is completed by running specified tests for each problem, as defined in the [Example HW Test Cases](https://github.com/jadebc-berkeley/okR/blob/master/HW0.ok.R).
5. The autograder file, after generating a score report for a given submission, will export the scores as a [JSON file](https://github.com/jadebc-berkeley/okR/blob/master/Hw0_Submission_ScoreReport.JSON), mapping Problems to Scores. This can be formatted to automatically send to the student via email upon grading, or sent to the OkPy API for viewing on the OkPy interface.


### Getting Started

Start by creating a [problem set](https://github.com/jadebc-berkeley/okR/blob/master/Hw0_Skeleton.R) either on an Rscript or Rmarkdown. It is recommended to provide a a template and starter code for the student, with sections that are intended for student work labeled `<--- YOUR CODE HERE --->`. At the beginning of each homework assignment, source the appropriate `Hw*.ok.R` file and appropriate libraries. In that setup chunk, initialize the autograder by calling `AutograderInit()`, which takes no arguments.

After each problem, allow the students to check their answer with the associated problem checking function that follows the syntax `CheckProblem*()`. Calling this function runs the pre-written tests for that problem and outputs to the console. Writing these tests is described in the section below.

At the end of the problem set, include `MyTotalScore()`, which allows the student to see their progress on the assignment so far.


### Writing Tests

For each homework assignment, you will need to create tests that are run to check the correctness of each problem. This is done in the [hw*.ok.R](https://github.com/jadebc-berkeley/okR/blob/master/HW0.ok.R) file.

In the `AutograderInit()` function, designate the number of problems to `length`. Then, for each problem, write desired tests within the `CheckProblem*()` function. Here, you can use the `assertthat` [package](https://github.com/hadley/assertthat) and the `checkR` [package](https://cran.r-project.org/web/packages/checkr/checkr.pdf) as needed to check HW solutions. `assertthat` is generally more useful for more specific, assertion-based checks, whereas `checkR` is generally more useful for open-ended, broader checks. If you'd like to output custom error messages as hints for the student, you can use a tryCatch block to return your desired error message for each type of error. These will be displayed in the console if the solution is incorrect.

`ReturnScore()` and `MyTotalScore()` do not need to be edited.
