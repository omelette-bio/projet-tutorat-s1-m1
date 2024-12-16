f = open("O0_all.txt")
f2 = open("O0_passes.txt", "+a")
lines = f.readlines()
for i in range(0, len(lines)):
    words = lines[i].split()
    if (words[0] == "Running" and words[1] == "pass:"):
        f2.write(words[2])
        f2.write("\n")