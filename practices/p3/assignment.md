# Writing an LLVM analysis pass

## LLVM pass infrastructure

Entities:

1. Function
1. Instruction (in memory, bitcode files, assembly files)
    ```
    $ clang sum.c -emit-llvm -c -o sum.bc
    $ clang sum.c -emit-llvm -S -c -o sum.ll
    $ llvm-as sum.ll -o sum.bc
    $ llvm-dis sum.bc -o sum.ll
    ```

IR:

1. Module
    1. Function (has first BB with label *entry*)
        1. Basic block (identified with s label)
            1. Instruction (identified with it's dst)

1. global variables
1. target data layout
1. external function prototypes
1. data structure declarations

## Iterators idiom

`llvm/include/llvm/IR`

1. `Module` (`llvm/include/llvm/IR/Module.h`)
    1. `Module::iterator` typedef to iterate across the functions inside this module.
    1. `begin()` and `end()` methods.
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1Module.html
1. `Function` (`llvm/include/llvm/IR/Function.h`)
    1. function definition or declaration `isDeclaration()` ifv true than prototype
    1. `getArgumentList()` or `arg_begin()` and `arg_end()`. `Function::arg_iterator` typedef
    1. `for (Function::iterator i = function.begin(), e = function.end(); i != e; ++i)` to iterate across basic blocks
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1Function.html.
1. `BasicBlock` (`llvm/include/llvm/IR/BasicBlock.h`)
    1. `begin()`/`end()` to iterate over instructions
    1. `getTerminator()` to get last instruction
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1BasicBlock.html.
1. `Instruction` is an atom of computation (`llvm/include/llvm/IR/Instructions.h`)
    1. `isAssociative()`, `isCommutative()`, `isIdempotent()`, or `isTerminator()`
    1. `getOpcode()` on of `llvm::Instruction` enumeration
    1. `op_begin()` and `op_end()` to access operands
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1Instruction.html

## User/Value idiom

1. `Value` (`llvm/include/llvm/IR/Value.h`)
    1. Subclass of `Value` means that it defines a result that can be used by others
    1. `use_begin()`/`use_end()` to iterate through `User`s in  def-use chain.
    1. `getName()`
    1. `replaceAllUsesWith(Value *)`
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1Value.html.
1. `User` (`llvm/include/llvm/IR/User.h`)
    1. Subclass of `User` means that this entity uses one or more `Value` interfaces
    1. `op_begin()`/`op_end()` to access all of the `Value` interfaces that it uses
    1. `replaceUsesOfWith(Value *From, Value *To)`
    1. http://llvm.org/docs/doxygen/html/classllvm_1_1User.html

Eg: `Function` and `Instruction` are subclasses of both `Value` and `User`
Eg: `BasicBlock` is a subclass of just Value

## Passes

1. Analysis
1. Transformations

## Hello Pass

1. `llvm/include/llvm/Transforms/HelloNew/HelloWorld.h`
1. `llvm/lib/Transforms/HelloNew/HelloWorld.cpp`
1. `llvm/lib/Passes/PassRegistry.def`

1. Exp 1: Run on ll file
    1. ./bin/opt -disable-output toy.ll -passes=helloworld
1. Exp 2: Run on c file
    1. ./bin/clang -S -emit-llvm ./toy_v.c
    1. ./bin/opt -disable-output toy_v.ll -passes=helloworld
1. Exp 3: Run on c file without optnone
    1. ./bin/clang -S -emit-llvm -Xclang -disable-O0-optnone ./toy_v.c
    1. ./bin/opt -disable-output toy_v.ll -passes=helloworld
1. Exp 4: Run on optimized c file
    1. ./bin/clang -S -emit-llvm -O1 ./toy_v.c
    1. ./bin/opt -disable-output toy_v.ll -passes=helloworld
1. Exp 5: Defining `static bool isRequired() { return true; }`
1. Exp 6: Counting functions
    1. Use statistics
        ```cpp
        #define DEBUG_TYPE "hellopass"
        #include "llvm/ADT/Statistic.h"
        ```
    1. Define Statistic
        ```cpp
        STATISTIC(TotalFuncs, "Number of functions");
        ```
    1. Add increment
        ```cpp
        TotalFuncs++;
        ```
    1. ./bin/opt -disable-output -stats toy_v.ll -passes=helloworld
1. Task 1: write a pass Counting only function definitions, loops, Basic blocks, Arithmetic instructions of type add and mull.
    1. Please submit your solutions as a MR to a [fork](https://github.com/geexie/llvm-project) with pass name which can be identified with you (`<github_name>`, `<name>-<family_name>` etc)
    1. Use option `-time-passes` to collect performance statistics about passes execution breakdown

## Links

1. [Developing LLVM passes out-of-source](https://llvm.org/docs/CMake.html#developing-llvm-passes-out-of-source)
1. [Developing LLVM pass](https://llvm.org/docs/WritingAnLLVMNewPMPass.html)
