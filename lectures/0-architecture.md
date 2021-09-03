# Modern compiler architecture

## what is a compiler?

- A program that translates a program written in one language into an program written in another language.
- The compiler must not change programmer's intentions and always produce *correct* code.
- The compiler might improve the program, in some way. This is usually related to performance, but also providing high level of abstraction over target machine and it's capabilities.

## What is an interpreter?

A program that directly execute an executable program, producing the results of executing that program

## Examples

- C is typically compiled
- Python is typically interpreted
- Java is compiled to byte-code, then interpreted or compiled (just-in-time) within a Java Virtual Machine (JVM)

## Compiler technology == Off-line processing

- Goals: improved performance and language usability
- Making it practical to use the full power of the language
- Trade-off is preprocessing time versus execution time or/and space
- Performance of both compiler and compiled application must be acceptable to the end user

## System stack

- Problem
- Algorithm
- **Program (Algorithm implementation in a Language)**
- Runtime System (VM, OS)
- **ISA (Instruction Set Architecture)**
- Micro-architecture
- Logic
- Tech process (lithography)

## Why study compilation?

- Compilers are important system software components: they are intimately interconnected with architecture, systems, programming methodology, and language design.They are a glue.
- Compilers include many applications of theory to practice: scanning, parsing, static analysis, instruction selection
- Many practical applications have embedded languages: commands, macros, formatting tags
- Many applications have input formats that look like languages: Matlab, Mathematica
- Writing a compiler exposes practical algorithmic & engineering issues:
approximating hard problems; efficiency & scalability
- **Do you know that Donald Knuth book series evolves from a book about compiler design?**

Compiler construction involves ideas from many different parts of computer science

- Artificial intelligence
    - Greedy algorithms
    - Heuristic search techniques
- Algorithms
    - Graph algorithms
    - Dynamic programming
- Theory
    - DFA (Deterministic Finite Automata) & PDA (Push Down Automata)
    - Pattern matching
    - Fixed-point algorithms
- Systems
    - Allocation & naming
    - Synchronization, locality
- Architecture
    - Pipeline & memory hierarchy management
    - Instruction set
- Software engineering
    - Architecture, modularity

# Intrinsic merit

Compiler construction poses challenging and interesting problems:

- Compilers must do a lot but also run fast
- Compilers have primary responsibility for run-time performance
- Compilers are responsible for making it acceptable to use the full power of the programming language
- Computer architects perpetually create new challenges for the compiler by building more complex machines
- Compilers must hide that complexity from the programmer 
- Success requires mastery of complex interactions

# 1. High-level view of a compiler

```
 Source code ---> [Compiler] ----> Machine code
                      |
                      |----> diagnostics
```

- Must recognize legal (and illegal) programs
- Must generate correct code
- Must manage storage of all variables (and code)
- Must agree with OS & linker on format for object code

*Big step up from assembly language; use higher level notations*

# 1. Traditional two-pass compiler

```
 Source code ---> [Front end] ----> IR ----> [Back end] ----> Machine code
                      |                          |
                      |--------------------------|----> diagnostics
```

- Use an intermediate representation (IR)
- Front end maps legal source code into IR
- Back end maps IR into target machine code

*Admits multiple front ends & multiple passes & multiple backends. Compiler complexity O(n+m)*

Typically, front end is O(n) or O(n log n), while back end is NP (NP-complete)

# The Frontend

```
Source code ---> [Lexer] ---> token ---> [Parser] ---> AST ---> [Semantic Analyser] ---> AST ---> [IR Generator] ---> IR
```

- Recognise legal (& illegal) programs
- Report errors in a useful way
- Produce IR & preliminary storage map
- Shape the code for the back end

*Much of front end construction can be automated*

# The Lexer

```
Source code ---> [Scanner] ---> char ---> [Tokenizer] ---> token ...
```

- Lexical analysis
- Recognises words in a character stream
- Produces tokens (words) from lexeme
- Collect identifier information
- Typical tokens include number, identifier, +, –, new, while, if
- Example: x=y+2*z; becomes IDENTIFIER(x) EQUAL IDENTIFIER(y) PLUS CST(2)
- Lexer eliminates white space (including comments)

# The Parser

```
token ---> [Parser] ---> AST
```

- Recognizes context-free syntax & reports errors
- Hand-coded parsers are fairly easy to build
- Most books advocate using automatic parser generators

# Semantic Analyser

```
AST ---> [Semantic Analyser] ---> AST
```

- Guides context-sensitive (“semantic”) analysis
- Checks variable and function declared before use
- Type checking

# IR Generator

```
AST ---> [IR generator] ---> IR
```

- Generates the IR used by the rest of the compiler.
- Sometimes the AST is the IR (e.g. DL graph compilers).

# The Back end

```
IR ---> [Instruction Selection] ---> AST ---> [Register allocation] ---> AST ---> [Instruction scheduling] ---> Machine code
```

- Translate IR into target machine code
- Choose instructions to implement each IR operation
- Decide which value to keep in registers
- Ensure conformance with system interfaces
- Automation has been less successful in the back end

# Instruction Selection

```
IR ---> [Instruction Selection] ---> AST
```

- Produce fast, compact code
- Take advantage of target features such as addressing modes
- Usually viewed as a pattern matching problem
- ad hoc methods, pattern matching, dynamic programming
- Example: madd instruction

# Register Allocation

```
AST ---> [Register allocation] ---> AST
```

- Have each value in a register when it is used
- Manage a limited set of resources
- Can change instruction choices & insert LOADs & STOREs (spilling)
- Optimal allocation is NP-Complete (1 or k registers)
- Graph colouring problem
- Compilers approximate solutions to NP-Complete problems

# Instruction Scheduling

```
AST ---> [Instruction scheduling] ---> Machine code
```

- Avoid hardware stalls and interlocks
- Use all functional units productively
- Can increase lifetime of variables (changing the allocation)
- Optimal scheduling is NP-Complete in nearly all cases
- Heuristic techniques are well developed


# 3. Three Pass Compiler

```
 Source code ---> [Front end] ----> IR ---> [Optimizer] ----> IR ----> [Back end] ----> Machine code
```

- Code Improvement (or Optimization)
- Analyses IR and rewrites (or transforms) IR
- Primary goal is to reduce running time of the compiled code
    - May also improve space, power consumption
- Must preserve meaning of the code
    - Measured by values of named variables
- Subject of Compiler Optimization topic

# The Optimizer

Modern optimizers are structured as a series of passes e.g. LLVM

```
IR ---> [Opt 0] ----> IR ---> [Opt 1] ----> IR ----> [Opt 2] ----> IR
```

- Discover & propagate some constant value
- Move a computation to a less frequently executed place
- Specialise some computation based on context
- Discover a redundant computation & remove it
- Remove useless or unreachable code
- Encode an idiom in some particularly efficient form

# 4. Modern Restructuring Compiler

```
IR ---> [Opt 0] ----> IR opset 0 ---> [Opt 1] ----> IR opset 1 ----> [Opt 2] ----> IR
```

- Translate from high-level (HL) IR to low-level (LL) IR
- Blocking for memory hierarchy and register reuse
- Vectorisation
- Parallelisation
- All based on dependence
- Also full and partial inlining

*The hottest research topic nowadays*

# Programs related to compilers

- Pre-processor:
    - Produces input to the compiler
    - Processes Macro/Directives (e.g. #define, #include)
- Assembler:
    - Translate assembly language to actual machine code (binary) Performs actual allocation of variables
- Linker:
    - Links together various compiled files and/or libraries Generate a full program that can be loaded and executed
- Debugger:
    - Tight integration with compiler
    - Uses meta-information from compiler (e.g. variable names)
- Virtual Machines:
    - Executes virtual assembly
    - typically embedded a just-in-time (jit) compiler

# Concluding words

