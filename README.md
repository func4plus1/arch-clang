# arch-clang

Useful for MLIR dev

use clang

clang++ -Wall -std=c++11 foo.cc -o foo

output llvm ir: 

clang -S -emit-llvm foo.c

creates -> foo.ll

output llvm ir to assembly 
llc foo.ll

creates -> foo.s
