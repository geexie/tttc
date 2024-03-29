# TTTC

Supplementary materials for [**Theory and tools of translation and compilation**](https://www.hse.ru/edu/courses/339578065) course.

## This course contains of

1. 15 lectures
1. 15 practices
1. 4 course works
1. 1 theory test

## Scoring

1. 4 lab works sroced 2pt each and 1 final test with 8 questions scored 0.25pt each. The final score is equally weithed linear combination of those scores
1. labs are accepted as MR into [llvm-project]() repository into hse-22 branch
1. final test is done during last practice class

## What we are going to learn with this course?

1. Architecture of modern compilers
    1. What happens if you call `clang` to compile you code?
1. A bit of theory required to read/understand literature and codes related to a compiler domain
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
    1. ninja

## Setup

1. Practices presented in \*nix environment in VSCode
1. Linux/MacOS tested, Windows compatible
1. Streamed online over Zoom/MSTeams

## Syllabus

| Date         | lecture                                                           | practice                                                           |
| ------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------ |
| UNSPECIFIED  | [Modern compiler architecture](lectures/0-architecture.md)        | [Setting up for the course](practices/p0/assignment.md)            |
| UNSPECIFIED  | [Lexical analysis](lectures/1-lexer.md)                           | [Building llvm from sources](practices/p1/assignment.md)           |
| UNSPECIFIED  | [Grammar: ambiguity & left-recursion](lectures/2-grammar.md)      | Assignment #1 Writing statistics pass                              |
| UNSPECIFIED  | [Grammar: determinism. Parsers. AST](lectures/3-parser.md)        | Assignment #1: Free discussion                                     |
| UNSPECIFIED  | [Semantic analysis. SDT](lectures/4-semantic.md)                  | Assignment #1: Hand in                                             |
|              |                                                                   |                                                                    |
| UNSPECIFIED  | [Intermediate representation](lectures/5-ir.md)                   | Assignment #2: Algebraic simplification                            |
| UNSPECIFIED  | [SSA, Phi-nodes, CFG](lectures/6-ssa.md)                          | Assignment #2: Free discussion                                     |
| UNSPECIFIED  | [Compiler optimizations](lectures/7-optimizations.md)             | Assignment #2: Hand in                                             |
| UNSPECIFIED  | [Dominators](lectures/7-optimizations.md)                         | Assignment #3: Analysis pass                                       |
| UNSPECIFIED  | [Multi-level IR](lectures/8-dominators.md)                        | Assignment #3: Free discussion                                     |
|              |                                                                   |                                                                    |
| UNSPECIFIED  | [Code generation](lectures/9-codegen.md)                          | Assignment #3: Hand in                                             |
| UNSPECIFIED  | Target representation                                             | Assignment #4: Toy languadge                                       |
| UNSPECIFIED  | [Liveness. Register allocation](lectures/10-liveness.md)          | Assignment #4: Free discussion                                     |
| UNSPECIFIED  | Instruction sceduling                                             | Assignment #4: Hand in                                             |
| UNSPECIFIED  | Concluding words                                                  | **Final Test**                                                     |


## List of lectures

- 01 ~ architecture
- 02 ~ lexer
- 03 ~ grammar
- 04 ~ parser
- 05 ~ semantics
- 06 ~ ir
- 07 ~ ssa
- 08 ~ optimizations
- 09 ~ dominators
- 10 - mlir
- 11 ~ codegen
- 12 - target
- 13 ~ liveness
- 14 - scheduling
- 15 ~ concluding words

## List of labs

1. Lab 1 (*due date* UNSPECIFIED) : **Writing statistics pass**
    1. Class work: empty pass (*what we learn*: getting familiar with LLVM pass structure)
    1. Assignment: count mull/add/functions/loops (*what we learn*: data structures & iterators in LLVM)
1. Lab 2 (*due date* UNSPECIFIED) : **Writing transformation pass**
    1. Class work: AS for add with 0 (*what we learn*: getting familiar with transformation passes, deleting an instruction)
    1. Assignment: AS for mul with 1 & SR for pow(x, 2) with x * x (*what we learn*: creating an instruction, replacing one instruction with another)
1. Lab 3 (*due date* UNSPECIFIED) : **Writing analysis pass**
    1. Class work: function Analysis (*what we learn*: getting familiar with analysis passes)
    1. Assignment: finding trivially vectorizable loops (*what we learn*: getting familiar with loop analysis)
1. Lab 4 (*due date* UNSPECIFIED) : **Extending a tiny language with custom operator**
    1. Class work: lowering tiny postfix lambda language to llvm from Grammar from lectures (*what we learn*: constructing tiny language and lower its AST to LLVM)
    1. Assignment: extending lambda grammar with `^` (lowering tiny language construction to intrinsic function)

## List of practical exercises (excluding labs)

- 01 + setting up & building llvm
- 02 - llvm developer workwlow and tools overview (clang, opt, llc)
- 03 ~ *constant phi elimination (think of better example or application of phis) (dealing with phi-nodes)*
- 04 ~ *simple vectorizer (refactor and simplify example) (cloning and transforming basic blocks in LLVM)*
- 05 - *TBD*
- 06 - *TBD*

\* *italic* deeper dive


## Supplementary materials

Supplementary, yet optional materials for futher diving into the subject can be found [here](links.md)
