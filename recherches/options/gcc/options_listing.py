f = open("O3_options.txt")
lines = f.readlines()
for i in range(0, len(lines)):
    if (lines[i]) == " ":
        continue
    elif (lines[i][0]) == "-":
        print("\item["+lines[i][:-1]+"]", lines[i+1]);