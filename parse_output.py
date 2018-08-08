import json
import sys

# Load in the scores JSON
with open(sys.argv[1]) as data_file:
    scores = json.load(data_file)

# Calculate total score and reformat scores for pprinting
total_score = 0

for problem in scores:
    total_score += scores[problem]
    scores[problem] = str(scores[problem]) + "/1"

# Print scores to stdout
print("Point breakdown")

for problem in scores:
    if problem == "Total Score":
        break;
    result = "    " + problem + ": " + scores[problem]
    print(result)

print("\nScore:")
total = "    Total: " + str(total_score)
print(total)

# stdout in the form "score\n total: x"
