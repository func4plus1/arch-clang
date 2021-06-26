# arch-clang

Useful for MLIR dev

use clang

output llvm ir: 

clang -S -emit-llvm foo.c

creates -> foo.ll

output llvm ir to assembly 
llc foo.ll

creates -> foo.s
