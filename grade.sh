#!/bin/bash

Rscript setup.R >/dev/null 2>&1;
Rscript ok.R hw01.R;
python parse_output.py hw01_score.JSON;
rm -rf ./*;
