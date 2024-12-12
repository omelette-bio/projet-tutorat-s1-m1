# create hashmap to init the library of options
f1 = open("gcc-optimization-options-backup.txt")
lib = dict()
for i in f1.readlines():
    line = i.split()
    if len(line) > 0:
        option = line[0]
        description = " ".join(line[1:])
        lib[option] = description

f = open("enabled_Os.txt")
f2 = open("Os_options.txt", 'a+')
for i in f.readlines():
    f2.write(i.split()[0])
    f2.write("\n")
    f2.write(lib[i.split()[0]])
    f2.write("\n\n")