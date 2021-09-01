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

## List of lecture notes

- 00 ~ architecture
- 01 ~ lexer
- 02 ~ grammar
- 03 ~ parser
- 04 ~ semantics
- 05 ~ ir
- 06 ~ ssa
- 07 ~ optimizations
- 08 ~ dominators
- 09 ~ codegen
- 10 ~ liveness
- 11
- 12
- 13
- 14
- 15

## List of practical exercises

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
- 12
- 13
- 14


## Syllabus

| Date         | lecture                                                           | practice                                                           |
| ------------ | ----------------------------------------------------------------- | ------------------------------------------------------------------ |
| UNSPECIFIED  | [~~Modern compiler architecture~~](lectures/0-architecture.md)    | [~~Setting up for the course~~](practices/p0/assignment.md)        |
| UNSPECIFIED  | [~~Lexical analysis~~](lectures/1-lexer.md)                       | [~~Building llvm from sources~~](practices/p1/assignment.md)       |
| UNSPECIFIED  | [~~Grammar:ambiguity and left-recursion~~](lectures/2-grammar.md) | [~~Developing with LLVM~~](practices/p2/assignment.md)             |
| UNSPECIFIED  | [~~Grammar: determinism. Parsers. AST~~](lectures/3-parser.md)    | [~~Lab #1: statement counting pass~~](practices/p3/assignment.md)  |
| UNSPECIFIED  | [~~Semantic analysis. SDT~~](lectures/4-semantic.md)              | ~~Assignment #1: Discussion~~                                      |
|              |                                                                   |                                                                    |
| UNSPECIFIED  | [~~Intermediate representation~~](lectures/5-ir.md)               | [~~Lab #2: algebraic simplification~~](practices/p4/assignment.md) |
| UNSPECIFIED  | [~~SSA, Phi-nodes, CFG~~](lectures/6-ssa.md)                      | ~~Assignment #2: Discussion~~                                      |
| UNSPECIFIED  | [~~Compiler optimizations: part 1~~](lectures/7-optimizations.md) | [~~Lab #3: analysis pass~~](practices/p5/assignment.md)            |
| UNSPECIFIED  | [~~Compiler optimizations: part 2~~](lectures/7-optimizations.md) | ~~Assignment #3: Discussion~~                                      |
| UNSPECIFIED  | [~~Dominators. Multi-level IR~~](lectures/8-dominators.md)        | [~~Toy language~~](practices/p6/assignment.md)                     |
|              |                                                                   |                                                                    |
| UNSPECIFIED  | [~~Code generation~~](lectures/9-codegen.md)                      | [~~Toy language~~](practices/p6/assignment.md)                     |
| UNSPECIFIED  | ~~Concluding words~~                                              | ~~Assignment #4: adding custom operator~~                          |
| UNSPECIFIED  | [~~Liveness. Register allocation~~](lectures/10-liveness.md)      | ~~Assignment #4: Discussion~~                                      |
| UNSPECIFIED  |                                                                   |                                                                    |
| UNSPECIFIED  |                                                                   | Final Test                                                         |


## List of lab works

1. Lab 1 (*due date* UNSPECIFIED) : Writing statistics pass
    1. Example: empty pass
    1. Assignment: count mull/add/functions/loops
1. Lab 2 (*due date* UNSPECIFIED) : Writing transformation pass
    1. Example: add with 0
    1. Assignment: mul with 1 & pow(x, 2) with x * x
1. Lab 3 (*due date* UNSPECIFIED) : Writing analysis pass
    1. Example: function Analysis
    1. Assignment:
1. Lab 4 (*due date* UNSPECIFIED) : Extending toy language with custom operator
    1. Example: lowering to llvm postfix language from Grammar from lectures 
    1. Assignment: adding ^ operator as it was on lecture

## Supplementary materials

Supplementary, yet optional materials for futher diving into the subject can be found [here](links.md)
