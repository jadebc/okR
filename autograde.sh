#!/bin/bash

sed '1,5d' $1 > hw.R;
Rscript ok.R hw.R;
python3 parse_output.py hw_score.JSON;
rm -rf ./*;
