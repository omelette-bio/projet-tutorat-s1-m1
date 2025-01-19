#! /bin/bash

# partie qui peut etre modifiee en fonction du programme que l'on veut tester
programs=("dijkstra")

compilers=("gcc" "icx" "clang" "ccomp")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")
compilerspp=("g++")

cd bin

echo "compilation, optimisation, temps" >> ../time_data.csv
for prog in "${programs[@]}";
do
    # partie qui peut etre modifiee en fonction du langage (c ou c++) du programme que l'on veut tester
    for comp in "${compilerspp[@]}";
    do 
        for opt in "${optimizations[@]}";
        do
            for i in {1..12}; 
            do
                echo "executing $prog-$comp$opt"
                exec_time=$(./$prog-$comp$opt 2> /dev/null)
                echo "$comp, $opt, $exec_time" >> ../time_data.csv
            done;
        done
    done
done
