#! /bin/bash

compilers=("gcc" "icx" "clang" "ccomp")
compilerspp=("g++" "icpx" "clang++")
optimizations=("-O0" "-O1" "-O2" "-O3" "-Os")


mkdir -p bin/
for comp in "${compilers[@]}";
do
   for opt in "${optimizations[@]}";
   do
       $comp $opt ../src/matrix_multiply.c -D M=2000 -D P=2000 -D N=2000 -o bin/matrix-multiply-$comp$opt
   done
done

for comp in "${compilerspp[@]}";
do
   for opt in "${optimizations[@]}";
   do
     $comp $opt ../src/dijkstra.cpp -o bin/dijkstra-$comp$opt
   done
done
