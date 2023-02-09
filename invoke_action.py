import os
import time
import sys

interval = sys.argv[1]

file = open("./benchmark/" + interval + "-hours/invoke_actions.sh", "r")

lines = file.readlines()

for i in range(len(lines)):
    if lines[i][-1] == '\n':
        lines[i] = lines[i][:-1]

start = time.time() * 1000000

invoke_start = time.time()

for line in lines:
    if "EOF" == line:
        continue
    else:
        os.system(line)

invoke_end = time.time()
print("invoke_start: ", invoke_start, "invoke_end: ", invoke_end)