# PCD

Supplementary materials for [**Theory and tools of translation and compilation**](https://www.hse.ru/edu/courses/339578065) course.

## This course contains of

1. weekly 14 lectures
1. weekly 14 weekly practical exercises
1. 4 course works
1. 1 theory test

Some supplementary materials can be found [here](links.md).

## What we are going to learn with this course?

1. Architecture of modern compiler
    1. What happens if you call `clang` to compile you code?
1. A bit of theory required to read/understand literature related to a compiler domain
    1. Context-free grammars, Dominators, Graph coloring and a bit more
1. Basic understanding how is to build a compiler/create a programming language
    1. Language construction
    1. Compiler optimizations
    1. Target code generation
1. Handy experience with industry used and actively developed in open source community tools and technologies
    1. LLVM (written in c++)
    1. MLIR (written in c++)
1. Familiarity with popular development tools
    1. VSCode
    1. git
    1. CMake

## List of practical exercises for LLVM introductory course

- 01 + setting up & building & tools (clang, opt, llc)
- 02 + empty pass (getting familiar with LLVM pass structure)
- 03 + count pass (data structures & iterators in LLVM)
- 04 + AS (getting familiar with transformation passes, deleting an instruction)
- 05 + SR (creating an instruction, replacing one instruction with another)
- 06 ~ constant phi elimination (think of better example or application of phis) (dealing with phi-nodes)
- 07 + Function analysis (getting familiar with analysis passes)
- 08 + Loop analysis (getting familiar with loop analysis)
- 09 ~ simple vectorizer (refactor and simplify example) (cloning and transforming basic blocks in LLVM)
- 10 + toy lambda language (constructing tiny language and lower its AST to LLVM)
- 11 + extending lambda grammar with `^` (lowering tiny language construction to intrinsic function)

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
|~~12-03-2021~~| [~~Compiler optimizations: part 1~~](lectures/7-optimizations.md)              | [~~Lab #3: analysis pass~~](practices/p5/assignment.md)            |
|~~19-03-2021~~| [~~Compiler optimizations: part 2~~](lectures/7-optimizations.md)              | ~~Assignment #3: Discussion~~                                      |
|~~26-03-2021~~| [~~Dominators. Multi-level IR](lectures/8-dominators.md)                       | [~~Toy language~~](practices/p6/assignment.md)                     |
|~~05-04-2021~~| [~~Code generation~~](lectures/9-codegen.md)                                   | [~~Toy language~~](practices/p6/assignment.md)                     |
|~~16-04-2021~~| ~~Concluding words~~                                                           | ~~Assignment #4: adding custom operator~~                          |
|**19-04-2021**| [Liveness. Register allocation](lectures/10-liveness.md)                       | Assignment #4: Discussion                                          |
|  26-04-2021  | Final Test                                                                     | Scoring                                                            |

## Lab works

1. Lab 1 (12.02.2021) : Writing statistics pass
    1. Example: empty pass
    1. Assignment: count mull/add/functions/loops
1. Lab 2 (26.02.2021) : Writing transformation pass
    1. Example: add with 0
    1. Assignment: mul with 1 & pow(x, 2) with x * x
    1. Continuation (05.03.2021): phi nodes
1. Lab 3 (19.03.2021) : Writing analysis pass
    1. Example: function Analysis
    1. Assignment:
1. Lab 4 (06.04.2021) : Extending toy language with custom operator
    1. postfix language from Grammar in lecture
    1. lowering to llvm
    1. Assignment: adding ^ operator as it was on lecture

## Setup

1. Practices presented in \*nix environment
1. Linux/MacOS
1. online over Zoom
1. VSCode
1. LLVM

## Scoring

1. 4 lab works and 1 final test 2pt each.
