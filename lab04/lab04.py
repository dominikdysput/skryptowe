import sys
characters = [0] * 26

def count(character):
    if (character == 'a' or character == 'A'):
        characters[0] = characters[0] + 1
    elif (character == 'b' or character == 'B'):
        characters[1] = characters[1] + 1
    elif (character == 'c' or character == 'C'):
        characters[2] = characters[2] + 1
    elif (character == 'd' or character == 'D'):
        characters[3] = characters[3] + 1
    elif (character == 'e' or character == 'E'):
        characters[4] = characters[4] + 1
    elif (character == 'f' or character == 'F'):
        characters[5] = characters[5] + 1
    elif (character == 'g' or character == 'G'):
        characters[6] = characters[6] + 1
    elif (character == 'h' or character == 'H'):
        characters[7] = characters[7] + 1
    elif (character == 'i' or character == 'I'):
        characters[8] = characters[8] + 1
    elif (character == 'j' or character == 'J'):
        characters[9] = characters[9] + 1
    elif (character == 'k' or character == 'K'):
        characters[10] = characters[10] + 1
    elif (character == 'l' or character == 'L'):
        characters[11] = characters[11] + 1
    elif (character == 'm' or character == 'M'):
        characters[12] = characters[12] + 1
    elif (character == 'n' or character == 'N'):
        characters[13] = characters[13] + 1
    elif (character == 'o' or character == 'O'):
        characters[14] = characters[14] + 1
    elif (character == 'p' or character == 'P'):
        characters[15] = characters[15] + 1
    elif (character == 'q' or character == 'Q'):
        characters[16] = characters[16] + 1
    elif (character == 'r' or character == 'R'):
        characters[17] = characters[17] + 1
    elif (character == 's' or character == 'S'):
        characters[18] = characters[18] + 1
    elif (character == 't' or character == 'T'):
        characters[19] = characters[19] + 1
    elif (character == 'u' or character == 'U'):
        characters[20] = characters[20] + 1
    elif (character == 'v' or character == 'V'):
        characters[21] = characters[21] + 1
    elif (character == 'w' or character == 'W'):
        characters[22] = characters[22] + 1
    elif (character == 'x' or character == 'X'):
        characters[23] = characters[23] + 1
    elif (character == 'y' or character == 'Y'):
        characters[24] = characters[24] + 1
    elif (character == 'z' or character == 'Z'):
        characters[25] = characters[25] + 1


for line in sys.stdin:
	if 'Exit' == line.rstrip():
		break
	for elem in line:
		count(elem)



sum = 0
for elem in characters:
    sum = sum + elem

thisdict = {
    characters[0] : "A",
    characters[1] : "B",
    characters[2] : "C", 
    characters[3] : "D",
    characters[4] : "E",
    characters[5] : "F", 
    characters[6] : "G",
    characters[7] : "H",
    characters[8] : "I",
    characters[9] : "J",
    characters[10] :"K",
    characters[11] :"L",
    characters[12] :"M",
    characters[13] :"N",
    characters[14] :"O",
    characters[15] :"P",
    characters[16] :"Q",
    characters[17] :"R",
    characters[18] :"S",
    characters[19] :"T",
    characters[20] :"U",
    characters[21] :"V",
    characters[22] :"W",
    characters[23] :"X",
    characters[24] :"Y",
    characters[25] :"Z"
}

for key in sorted(thisdict, reverse=True):
    tmp = key / float(sum)
    proc = str("{:.2%}".format(tmp))
    print "%s %s %s" %(key, thisdict[key], proc)
