# OkR

### Overview 

OkR is an autograding scheme designed to be used for courses assigning problem sets in R. The student can download the starter files, check their solutions locally, and submit to the Ok server, initiating autograding on the instructor side. The scores can then be posted to the Ok website or released to students in an Ok-generated email.

### Example Workflow

1. *Instructor* releases the skeleton file to *students*, alongside any utility files, datasets, assignment specifications, or example code. This is represented by the [Example HW Skeleton](https://github.com/jadebc-berkeley/okR/blob/master/hw01_starter.R).
2. *Students* receive skeleton file and/or specification and begin work in RStudio. They complete their assignment and prepare for submission. This is represented by the [Example HW Submission](https://github.com/jadebc-berkeley/okR/blob/master/hw01.R).
3. *Students* submit their submission code through the [OkPy](https://okpy.org) submission system. Students can authorize OkPy with a Google account, so there is no account setup step involved. 
4. The *instructor* can then queue student submissions to the autograder on the instructor side of OkPy. For each submission, a Docker environment is initiated and autograding is completed by running specified tests for each problem, as defined in the [Example HW Test Cases](https://github.com/jadebc-berkeley/okR/blob/master/hw01.ok.R).
5. The autograder file, after generating a score report for a given submission, will export the scores as a [JSON file](https://github.com/jadebc-berkeley/okR/blob/master/hw01_score.JSON), mapping Problems to Scores. This can be formatted to automatically send to the student via email upon grading, or sent to the OkPy API for viewing on the OkPy interface.


### Getting Started

Start by creating a [problem set](https://github.com/jadebc-berkeley/okR/blob/master/hw01_starter.R) either on an Rscript or Rmarkdown. It is recommended to provide a template and starter code for the student, with sections that are intended for student work labeled `">>>>>FILL IN YOUR CODE HERE<<<<<"`. At the beginning of each homework assignment, source the appropriate `hw*.ok.R` file and load required packages. We recommend sourcing a `setup.R` file from GitHub Gist to prompt package installs and sourcing the *.ok.R autograder file from Gist as well. To do so, use `devtools::source_gist(id='', filename='', quiet = TRUE)`. __IMPORTANT:__ _Make sure the only elements in the first 5 lines are comments and `setup.R` sourcing because the first 5 lines are removed from the file in the autograding step._ After sourcing the setup file and autograding file, initialize the autograder by calling `AutograderInit()`, which takes no arguments.

After each problem, allow students to check their answer with the associated problem checking function that follows the syntax `CheckProblem*()`. Calling this function runs the pre-written tests for that problem and sends output to the console. Writing these tests is described in the section below.

At the end of the problem set, include `MyTotalScore()`, which allows the student to see their progress on the assignment so far.


### Writing Tests

For each homework assignment, you will need to create tests that are run to check the correctness of each problem. This is done in the [hw*.ok.R](https://github.com/jadebc-berkeley/okR/blob/master/hw01.ok.R) file.

In the `AutograderInit()` function, designate the number of problems to `length`. Then, for each problem, write desired tests within the `CheckProblem*()` function. Here, you can use the `assertthat` [package](https://github.com/hadley/assertthat) and the `checkR` [package](https://cran.r-project.org/web/packages/checkr/checkr.pdf) as needed to check HW solutions. `assertthat` is generally more useful for more specific, assertion-based checks, whereas `checkR` is generally more useful for open-ended, broader checks. If you'd like to output custom error messages as hints for the student, you can use a `tryCatch` block to return your desired error message for each type of error. These will be displayed in the console if the solution is incorrect.

Then, upload this as gist at [gist.github.com](https://gist.github.com/) and make sure to source this gist at the beginning of the associated assignment file. By putting your autograding file on github, you can update the autograding file as necessary and students will automatically fetch updates each time they run their homework file.

`ReturnScore()` and `MyTotalScore()` do not need to be edited.

# Setting up your course on OkPy

To use OkPy, [request access](https://okpy.github.io/documentation/autograder.html#autograder-documentation-request-access) from the OkPy staff to obtain a server-side autograder account. Note that this account is used purely for setting up the autograder, and is distinct from an instructor account on OkPy where you would create assignments, view student submissions, send students emails, etc. *This account will be referred to as the __autograder__ account.*

### Creating a course
If you are already enrolled as an instructor on a previous course in OkPy, creating a new course is simple from the instructor dashboard.

If you have not been an instructor in the past, request access by emailing nolanpokpongkiat@berkeley.edu.

### Creating an assignment
From the instructor dashboard, click into courses. Then, click "Assignments" and click "Create Assignment". Fill in your assignment name and the auto-generated endpoint will work fine. 

### Autograder setup
Once you have created an *OkPy assignment*, you will need to set up the *autograder assignment* for it on your *autograder account* and associate the two. This [video](https://www.youtube.com/watch?v=wwD9hoMYGVY) outlines the steps to do so. 

Some notes & clarifications:
1. Ignore 0:13-1:33, as we are not using the Ok grading suite, and running our own suite instead.
2. At 1:37, these would be the non-student-submission files: [ok.R](https://github.com/jadebc-berkeley/okR/blob/master/ok.R), [parse_output.py](https://github.com/jadebc-berkeley/okR/blob/master/parse_output.py), [score_export.ok.R](https://github.com/jadebc-berkeley/okR/blob/master/score_export.ok.R), and [autograde.sh](https://github.com/jadebc-berkeley/okR/blob/master/autograde.sh). These files are summarized in [grading.zip](https://github.com/jadebc-berkeley/okR/blob/master/grading.zip)
3. At 2:23, your course name is your *autograder account* username.
4. At 2:25, for the grading script, use
``` bash
bash autograde.sh <name_of_your_R_assignment>;
```

For example, for hw01.R, use: 
```bash
bash autograde.sh hw01.R;
```

5. If you are using R, you need to initialize a different Docker container for autograding that has R installed. Supply this in the `Docker Image` box (note that this is not shown in the video). The default is `cs61a/grading:latest` for a Python environment. For standard R usage, use `kaggle/rstats`. This Docker Image has the entirety of CRAN packages installed so you don't have to worry about package installation. If you need other specifications, you can [search](https://hub.docker.com/r/rocker/r-base/~/dockerfile/) for a Docker image to fit your needs.

![Using another Docker image](https://github.com/jadebc-berkeley/okR/blob/master/img/dockerfile.png)


### Writing Homework Assignments


### Autograder magic
1. Upon queueing a submission to the autograder, the OkPy server initiates a Docker container from the Docker image provided. 
2. This container is loaded with the zipped files specified during autograder assignment creation along with the student submission. 
3. The grading script is run. Any output is captured to STDOUT and STDERR is ignored. Example autograder output: 
```
Point breakdown
    Veritasiness: 0.0/0
    Loops: 0.0/0
    repeated: 1.0/1
    sum_digits: 1.0/1
    double_eights: 1.0/1

Score:
    Total: 2.0
```
4. The autograder looks for a line with `score` on it's own and a numeric value after `total` in the following line to send back to the OkPy server. This means your grading script can output anything you'd like as long as the last two lines follow the above format.
5. The total score is posted to OkPy.

### Manual Grading
In addition to autograding code, you may also want to give a composition score for code style, or be able to grade short answer questions.

1. Click into the assignment and click "Assign Grading".

![Assign grading](https://github.com/jadebc-berkeley/okR/blob/master/img/assign-grading.png)
2. Select the instructor you'd like to assign the submission to.
3. Set "Kind" to "Composition"
4. Click "Assign Grading Tasks"

On the OkPy instructor account, you will now see a new "Grading" tab.

![Grading tab](https://github.com/jadebc-berkeley/okR/blob/master/img/grading-tab.png)
1. Click the grading tab to view the grading queue.
2. Clicking "Grade" will pull up the student submission. If you specified a skeleton file on the OkPy assignment, it will default to showing the diff. You can toggle between the diff and the raw student submission `"Files"` with the tabs above the code file.
3. Add comments and grade composition or short answer questions as needed. Comments can be made in-line and will show up in-line for the student.

![Manual grading](https://github.com/jadebc-berkeley/okR/blob/master/img/manual-grading.png)
4. Add a message and composition score and `Submit Score`. 

### Trying it out
`hw01.R` is an example of a fully correct assignment; `hw02.R` is an example of a not-so-fully correct assignment.