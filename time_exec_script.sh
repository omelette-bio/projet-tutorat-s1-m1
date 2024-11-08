#! /bin/bash

programs=("matrix-multiply" "dijkstra")
compilers=("gcc" "icx" "clang" "ccomp")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")

cd bin

echo "compilation, temps" >> ../time_data.csv
for prog in "${programs[@]}";
do
    for comp in "${compilers[@]}";
    do 
        for opt in "${optimizations[@]}";
        do
            for i in {1..12}; 
            do
                echo "executing $prog-$comp$opt"
                /usr/bin/time -f %e ./$prog-$comp$opt > /dev/null 2> ../tmp.txt
                exec_time=$(cat ../tmp.txt)
                echo "$comp$opt, $exec_time" >> ../time_data.csv
            done;
        done
    done
done

rm ../tmp.txt