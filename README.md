# PCD

Supplementary materials for **Theory and tools of translation and compilation** course.

## What we are going to learn with this course?

1. Architecture of modern compiler
    1. What happens if you call `clang` to compile you code
1. A bit of theory required to read/understand literature related to a compiler domain
    1. Context-free grammars, finite-state automata, regular expressions and a bit more
1. Basic understanding how is to build a compiler/create a programming language
    1. Language construction
    1. Compiler optimizations & code generation
1. Industry used and actively developed in open source community tools and technologies
    1. LLVM (written in c++)
    1. MLIR (written in c++)
    1. Ocaml
1. We will also use
    1. VSCode
    1. git
1. Focus on practice and industry used tools and technologies
    1. Handy experience for anyone interested in compiler industry
1. 2 course works and weekly practical exercises are expected
1. Supplementary materials can be found [here](links.md)

## Syllabus

| Date | lecture | practice |
| --------------- | --------------- | --------------- |
|22-01-2021|	[~~Modern compiler architecture~~](lectures/0-modern-compiler-architecture.md) |	 [Introduction](practices/p0/assignment.md)|
|29-01-2021|	Lexical analysis|Setup OCaml development with VSCode. OCaml: basics |
|05-02-2021|	Top down parsing|Introduction of LLVM project structure  |
|12-02-2021|	Bottom up parsing|Building LLVM sources  |
|19-02-2021|	Abstract syntax| Implementing lexer|
|26-02-2021|	Semantic analysis. Names| Implementing parser & AST|
|05-03-2021|	Semantic Analysis. Types|Code generation |
|12-03-2021|	Intermediate representation|JIT & optimizer |
|19-03-2021|	Compiler optimizations|Control Flow |
|26-03-2021|	Code generation|Custom operator |
|02-04-2021|	Liveness|Mutable variables |
|09-04-2021|	Instruction selection|Custom pass |
|16-04-2021|	Instruction scheduling|Introduction of MLIR |
|23-04-2021|	Register allocation. Linear scan register allocation|Emitting MLIR |
|30-04-2021|	Concluding words|Transformation over MLIR |

## Lab work

1. Writing an LLVM pass
1. Extending toy language with custom operator

## Sutup

1. Practices presented in \*nix environment
1. Linux/MacOS
1. online over Zoom
1. VSCode
1. OCaml
1. LLVM

## Scoring

1. practices
1. lab works
1. Final test

One can skip final test by passing all practices and lab works.
