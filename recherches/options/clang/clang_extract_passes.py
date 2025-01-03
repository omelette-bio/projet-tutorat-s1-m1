import sys

input_file = sys.argv[1]
f = open(input_file)
output_file = input_file + ".output"
f2 = open(output_file, "+a")
lines = f.readlines()
for i in range(0, len(lines)):
    words = lines[i].split()
    if (words[0] == "Running" and words[1] == "pass:"):
        f2.write(words[2])
        f2.write("\n")
