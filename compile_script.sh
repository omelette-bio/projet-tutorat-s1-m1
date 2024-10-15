#! /bin/bash

compilers=("gcc" "icx" "clang" "ccomp")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")

for comp in "${compilers[@]}";
do
    for opt in "${optimizations[@]}";
    do
        gcc $opt matrix_multiply.c -D M=2000 -D P=2000 -D N=2000 -o matrix-multiply-$comp$opt
    done
done