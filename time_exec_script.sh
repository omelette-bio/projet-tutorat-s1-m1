#! /bin/bash

programs=("dijkstra")
compilers=("gcc" "icx" "clang" "ccomp")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")
compilerspp=("g++" "icpx" "clang++")

cd bin

echo "compilation, optimisation, temps" >> ../time_data.csv
for prog in "${programs[@]}";
do
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

rm ../tmp.txt
