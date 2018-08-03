import json
import sys
import requests

with open(sys.argv[1]) as data_file:
    scores = json.load(data_file)

total_score = 0

for problem in scores:
    total_score += scores[problem]
    scores[problem] = str(scores[problem]) + "/1"

scores["Total Score"] = str(total_score) + "/3"

for problem in scores:
    result = problem + ": " + scores[problem]
    print(result)

print("Great work!")

# data = {
#     'bid': 'a86qnyW',  # how to get this backup ID???
#     'score': 3.0,
#     'kind': 'Total',
#     'message': 'Test Output:\nProblem 1: 1/1.\nProblem 1: 1/1.\nProblem 1: 1/1.\n
#      Great Work!'
# }
# url = 'https://okpy.org/api/v3/score/?access_token={}'
# access_token = 'test' # how to get current user access_token??
# r = requests.post(url.format(access_token), data=data)
# response = r.json())
