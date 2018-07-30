# TODO: Update All links and bring over all documentation OkR Example Workflow

1. *Instructor* releases the skeleton file to *students*, alongside any utility files, datasets, assignment specifications, or example code. This is represented by the [Example HW Skeleton](https://github.com/jadebc-berkeley/PH250B/blob/master/OkR/Hw0_Skeleton.R).
2. *Students* receive skeleton file and/or specification and begin work in RStudio. They complete their assignment and prepare for submission. This is represented by the [Example HW Submission](https://github.com/jadebc-berkeley/PH250B/blob/master/OkR/Hw0_Submission.R).
3. *Students* submit their submission code on our [OkR](https://okpy.org) submission system.
4. On the OkR server, the autograder runs on the submission code for each *student*. This is represented by the [Example HW Autograder](https://github.com/jadebc-berkeley/PH250B/blob/master/OkR/Hw0.ok.R).
5. The autograder file, after generating a score report for a given submission, will export the scores as a JSON file, mapping Problems to Scores. This is represented by the [Example HW Score JSON Generator](https://github.com/jadebc-berkeley/PH250B/blob/master/OkR/ScoreExport.ok.R).
6. Finally, the scores can be released back to a given *student*, either by email or through OkR. This is represented by the [Example HW Score](https://github.com/jadebc-berkeley/PH250B/blob/master/OkR/Hw0Score).

---

# OkR Documentation

### Overview  
The [autograder](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0.ok.R) is designed to take in a [student submission](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0_Submission.R) as a file contained within the same directory and generate a [score report](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0_Scored/Hw0_NP1_ScoreReport.JSON) as a JSON file to a newly created [scores directory](https://github.com/jadebc-berkeley/PH250B/tree/basic-autograder/OkR/Hw0_Scored). Alternatively, the [autograder](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0.ok.R) can also read submissions from a [submissions directory](https://github.com/jadebc-berkeley/PH250B/tree/basic-autograder/OkR/Hw0_Submissions) and grade all assignments at once.

### Hw*.ok.R
The [autograder](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0.ok.R) can grade a single file submission within the directory or a directory of submitted files. Decide which is desired and select the corresponding code chunks *(A: single file; B: directory of files)*.
> Note: the default is set to handle a single file submission

In the first couple lines, provide the desired name for the scores directory and the path to submission file/directory. Then, change the `Autograde` function to correspond to the HW assignment. Here, you can use the `assertthat` [package](https://github.com/hadley/assertthat) and the `checkR` [package](https://cran.r-project.org/web/packages/checkr/checkr.pdf) as needed to check HW solutions. `assertthat` is generally more useful for more specific, assertion-based checks, whereas `checkR` is generally more useful for open-ended, broader checks.

This `Autograde` function is then run on the submission and the scores result is passed to the `WriteToFile` function, sourced from [ScoreExport.ok.R](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/ScoreExport.ok.R). `WriteToFile` converts the scores, which is received as a vector of `TRUE` or `error`, into numeric values `1` and `0`, and writes this to a [JSON object](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/Hw0_Scored/Hw0_NP1_ScoreReport.JSON) located at the [scores directory](https://github.com/jadebc-berkeley/PH250B/tree/basic-autograder/OkR/Hw0_Scored) as defined previously.

[ScoreExport.ok.R](https://github.com/jadebc-berkeley/PH250B/blob/basic-autograder/OkR/ScoreExport.ok.R) is agnostic to the autograder script, allowing it to be used in the general case. The only file needing to be modified per assignment is the Hw*.ok.R file.
