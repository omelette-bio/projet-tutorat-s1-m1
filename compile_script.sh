#! /bin/bash

compilers=("gcc" "icx" "clang" "compcert")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")

for opt in "${optimizations[@]}";
do
    gcc $opt matrix_multiply.c -D M=2000 -D P=2000 -D N=2000 -o matrix-multiply$opt
done