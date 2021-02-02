# Developing with LLVM

## Clang Compiler Driver

The clang tool is the compiler driver and front-end. It can run the rest of compiler stages

```
$ ./bin/clang toy.c -o toy
$ ./toy
hello world
```

Separate phases can be called

1. preprocessing
    ```
    $ ./bin/clang toy_p.c -E
    # 1 "bin/toy.c"
    # 1 "<built-in>" 1
    # 1 "<built-in>" 3
    # 352 "<built-in>" 3
    # 1 "<command line>" 1
    # 1 "<built-in>" 2
    # 1 "bin/toy_p.c" 2
    typedef float V __attribute__((vector_size(16)));
    V foo(V a, V b) { return a+b*a; }
    ```
1. Type checking
    ```c++
    typedef float V __attribute__((vector_size(16)));
    V foo(V a, V b) { return a+b*a; }
    ```
    ```
    $ ./bin/clang -fsyntax-only ./bin/toy_p.c
    ```
1. AST
    ```c++
    typedef float V;
    V foo(V a, V b) { return a+b*a; }
    ```
    ```
    $ ./bin/clang -Xclang -ast-dump -fsyntax-only  ./bin/toy.c
    $ ./bin/clang -Xclang -ast-view -fsyntax-only  ./bin/toy.c
    ```
1. LLVM. first command creates toy.ll while the second prints llvm to the out, the third prints optimized with `-O1` flag code
    ```
    $ ./bin/clang -S -emit-llvm ./bin/toy.c
    $ ./bin/clang -S -emit-llvm ./bin/toy.c -o -
    $ ./bin/clang -S -emit-llvm -O1 ./bin/toy.c -o -
    ```
    Compare vectorized and non vectorized versions
1. Target assembly
    ```
    $ ./bin/clang -S -fomit-frame-pointer -O1  ./bin/toy.c -o -
    ```
    Compare vectorized and non vectorized versions
    Note: `-fomit-frame-pointer` is used to eliminate stack operations and used in example for simplicity reasons. Calling convention for [x86_64](https://www.agner.org/optimize/calling_conventions.pdf)
1. LLVM bitcode. The -emit-llvm option can be used with the -S or -c options to emit an LLVM .ll or .bc file (respectively) for the code. This allows you to use the standard LLVM tools on the bitcode file.
    ```
    $ ./bin/clang -O1 -emit-llvm -isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include ./bin/toy.c -c -o toy.bc
    ```
    1. You can find `toy.bc` now and run with `lli` to invoke the LLVM JIT, lli.
        ```
        $ ./bin/lli toy.bc
        ```
    1. You can get LLVM IR assembly with `llvm-dis`
        ```
        $ ./bin/llvm-dis < toy.bc | less
        ```
    1. or native with `llc` tool
        ```
        $ llc hello.bc -o hello.s
        $ gcc hello.s -o hello.native
        $ ./hello.native
        ```

## Opt tool

clang –S -O1 -emit-llvm -Xclang -disable-O0-optnone benchmark_0.cpp -o benchmark_0_interm.ll
`-O1` to get in canonicalized form
`-emit-llvm` output in LLVM IR
The `-Xclang -disable-O0-optnone` flag ensures that Clang will allow later optimizations even when initially compiling without any
opt -loop-vectorize -S benchmark_0_interm.ll -o benchmark_0_opt.ll
clang benchmark_0_opt.ll -o benchmark_0
./ benchmark_0

```
./bin/opt --help-hidden – Prints all available options
./bin/opt -load lib/LLVMCustom.dylib -custom -S test.ll -o test_opt.ll ll – Loads custom pass
./bin/opt  -dot-cfg - Print CFG of function to 'dot' file
./bin/opt  -dot-callgraph - Print call graph to 'dot' file
./bin/opt  -dot-dom - Print dominance tree of function to 'dot' file
```
