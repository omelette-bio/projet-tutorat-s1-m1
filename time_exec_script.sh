#! /bin/bash

programs=("matrix-multiply")
compilers=("gcc" "icx" "clang" "ccomp")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")

for prog in "${programs[@]}";
do
    for comp in "${compilers[@]}";
    do 
        for opt in "${optimizations[@]}";
        do
            for i in {1..12}; 
            do
                echo "executing $prog-$comp$opt"
                #/usr/bin/time -f "%e" ./$prog-$comp$opt 2>> time_data.txt > /dev/null
                /usr/bin/time -f %e ./$prog-$comp$opt > /dev/null 2> zob.txt
                exec_time=$(cat zob.txt)
                echo "$comp$opt : $exec_time" >> time_data.txt
            done;
        done
    done
done

