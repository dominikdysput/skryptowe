#python 3
import sys
import os
import pathlib

files = []

if len(sys.argv) == 1 :
    dirpath = "."
else:
    dirpath = str(sys.argv[1])

tmp = os.path.abspath(dirpath)
entr = os.listdir(dirpath)

os.chdir(tmp)

for entryFile in entr:
    isdir = os.path.isdir(os.path.abspath(entryFile))
    if not isdir:
        files.append(entryFile)
       
tableDuplicates = []
duplicate = "false"

for fileToOpen1 in range(len(files)):
    for fileToOpen2 in range(fileToOpen1+1,len(files)):
        with open(files[fileToOpen1], "rb") as file1 ,open(files[fileToOpen2], "rb") as file2 :
            if os.stat(files[fileToOpen1]).st_size == os.stat(files[fileToOpen2]).st_size:
                tmpbyte1 = file1.read(1)
                tmpbyte2 = file2.read(1)
 
                while tmpbyte1 and tmpbyte2:
                    if tmpbyte1 != tmpbyte2:
                        break
                    tmpbyte1 = file1.read(1)
                    tmpbyte2 = file2.read(1)
                else:
                    duplicate = "true"
                    if(files[fileToOpen1] not in tableDuplicates ):
                        tableDuplicates.append(files[fileToOpen1])
                    if(files[fileToOpen2] not in tableDuplicates):
                        tableDuplicates.append(files[fileToOpen2])

if duplicate == "true":                      
    print("duplicated: ( size:",os.stat(tableDuplicates[0]).st_size, ")")         
    for file in tableDuplicates:
        print(os.path.abspath(file))
