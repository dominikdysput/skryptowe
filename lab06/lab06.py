import sys
import os

dirpath = ""
if (len(sys.argv) > 1):
    dirpath = sys.argv[1]
    print(dirpath)
else:
    dirpath = "."

dir = os.listdir(dirpath)
files = []
for entry in dir:
    files.append(entry)

files.sort()


for file in files:
	print(file)
