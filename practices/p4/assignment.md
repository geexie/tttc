# Writing transformation pass

## Adding new pass for in-source development

Use [MR]() for the reference

## Running transformation pass on a benchmark

1. `./bin/clang -Xclang -disable-O0-optnone -S -emit-llvm benchmark.c`
1. `./bin/opt -mem2reg benchmark.ll -S -o benchmark.r.ll`
1. `./bin/opt -passes=geexie-as benchmark.r.ll -S -o benchmark.opt.ll`

## Algebraic simplification pass

y = x + 0 => x

## Lab #2

write algebraic simplification pass which handles y = x * 1 => x and strength reduction pass y = powf(x, 2.f) -> y = x * x

## More variants of the commands

1. Just to print something `./bin/opt  -passes=geexie-as -disable-output benchmark.r.ll`
1. To produce byte code  `./bin/opt  -passes=geexie-as benchmark.r.ll -o benchmark.opt.bc`
1. To convert byte code to assembly `./bin/llvm-dis benchmark.opt.bc`
1. To view CFG (control flow graph) `./bin/opt -view-cfg`.
    1. You can open dot file with VSCode with joaompinto.vscode-graphviz plugin
