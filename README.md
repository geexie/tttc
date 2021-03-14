# PCD

Supplementary materials for [**Theory and tools of translation and compilation**](https://www.hse.ru/edu/courses/339578065) course.

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

| Date         | lecture                                                                        | practice                                                           |
| ------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------ |
|~~22-01-2021~~| [~~Modern compiler architecture~~](lectures/0-modern-compiler-architecture.md) | [~~Setting up for the course~~](practices/p0/assignment.md)        |
|~~29-01-2021~~| [~~Lexical analysis~~](lectures/1-lexical-analysis.md)                         | [~~Building llvm from sources~~](practices/p1/assignment.md)       |
|~~05-02-2021~~| [~~Grammar:ambiguity and left-recursion~~](lectures/2-grammar.md)              | [~~Developing with LLVM~~](practices/p2/assignment.md)             |
|~~12-02-2021~~| [~~Grammar: determinism. Parsers. AST~~](lectures/3-parser_taxonomy.md)        | [~~Lab #1: statement counting pass~~](practices/p3/assignment.md)  |
|~~19-02-2021~~| [~~Semantic analysis. SDT~~](lectures/4-semantic.md)                           | ~~Assignment #1: Discussion~~                                      |
|~~26-02-2021~~| [~~Intermediate representation~~](lectures/5-ir.md)                            | [~~Lab #2: algebraic simplification~~](practices/p4/assignment.md) |
|~~05-03-2021~~| [~~SSA, Phi-nodes, CFG~~](lectures/6-ssa.md)                                   | ~~Assignment #2: Discussion~~                                      |
|~~12-03-2021~~| [~~Compiler optimizations~~](lectures/7-optimizations.md)                      | [~~Lab #3: analysis pass~~](practices/p5/assignment.md)            |
|**19-03-2021**| [Compiler optimizations](lectures/7-optimizations.md)                          | Assignment #3: Discussion                                          |
|  26-03-2021  | [Code generation. Multi-level IR](lectures/8-codegen.md)                       | [Toy language](practices/p6/assignment.md)                         |
|  TBD  | Liveness                                                                       | [Lab #4: custom operator](practices/p6/assignment.md)                     |
|  TBD  | Instruction selection                                                          | Assignment #4: Discussion                                                 |
|  TBD  | Instruction scheduling                                                         | [MLIR introduction](practices/p7/assignment.md)                           |
|  TBD  | Register allocation. Linear scan register allocation                           | [MLIR: custom dialect](practices/p8/assignment.md)                        |
|  TBD  | Concluding words. Final Test 2                                                 | Final Test 2                                                              |

## Lab works

1. Writing statistics pass
1. Writing transformation pass
1. Writing analysis pass
1. Extending toy language with custom operator

## Setup

1. Practices presented in \*nix environment
1. Linux/MacOS
1. online over Zoom
1. VSCode
1. OCaml
1. LLVM

## Scoring

1. 4 lab works 0.15 each (Analysis pass, transformation pass, toy language, MLIR dialect)
1. 2 final tests 0.20 each

One can skip final test by passing all practices and lab works.
