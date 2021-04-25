# Target code generation

Front End --- Middle --- Back End
AST      <---> IR    <---> ASM

## Target machine representation

1. Calling convention
1. Size and properties of register file
1. List of supported instructions
  TableGen tool is used by LLVM.
1. Code format (heap, stack, data & code section)
1. Memory mapping
  c++ heap -> DDR
  OpenCL __local -> stack/scratchpad, __global -> DDR

## Pipeline

1. Instruction selection (LLVM: Legalization for backend) (NxM, NP-complete)
  1. Target architecture legalization
  IR {abstract ISA, virtual registers} -> IR {target ISA, virtual registers}
  NxM problem
  while abstract isa is not fully converted to target isa
  Ex 1:1: `add %r2, %r0, %r1` => `add r2, r, r1`
  Ex N:1: `a[i*width+j]`
    ```
    mul t0 i width
    add t1 t0 j
    add t2 a t1
    mul t3 t2 4
    load t4 t3
    ```
    => if address model supports `a*x+b` assuming `j1 = j * 4`
    ```
    mul t0 i width
    add t1 a t0
    load t2 t1 4 j1
    ```
    => if target supports mla (multiply-accumulate)
        ```
    mla a i width
    load t2 a 4 j1
    ```
  Ex 1:M:
    ```
    a = (b < c)
    ```
    => if compare writes to register file
    ```
    cmp.lt a, b, c
    ```
    or if compare branches
    ```
      br.lt b, c, L0
      a = 0
      br L1
    L0:
      a = 1
    L1:
    ```
1. calling convention compliance
1. register allocation (NxM, NP-complete)
  1. ISA compliance, if any rules
  1. IR {target ISA, virtual registers} in SSA -> IR {target ISA, physical registers}, no ~~SSA~~
  1. register spilling minimization
1. Instruction scheduling (NxM, NP-complete)
  1. Stale minimization
  1. Hiding latency
  Ex:
  ```
  2 load a
  2 load b
  3 fma c a b
  1 store c
  ```
  =>
  ```
  2 load a
  2 load b
  inc i 1// use this slot
  3 fma c a b
  // use 2 slots
  1 store c
  ```

Simplifications

1. Problems are solved independently
1. Problems are solved heuristically (correct & profitable)

Ex:
```
a = *b + *c * 3
```
=>
```
load @b b
load @c c
load r0 @b
load r1 @c
load r2 3
mul r3 r1 r2
add a r1 r2
```
or
1. less instructions
1. less registers
1. bigger code size due to immediate codding
```
load @b b
load @c c
load r0 @b
load r1 @c
mul r3 r1 3
add a r1 r2
```

## Code shape

[stack] dynamic <- high address
   v
  ...
   ^
[heap] dynamic
[data] static
[code] static <- low address

[code] instructions
[data] statically allocated data, global variables, string literals, global arrays static size
[stack] function calls, local variables fixed size, register spilling
[heap] new/malloc

Ex:
```c++
char c; // data
int arr[4]; // data

void foo() {
    int arr2[4]; // stack
    int* ptr = new int[4]; // heap
    bar("hello"); // data
}
```

## Function calls

1. Calling convention
1. Stack handling
  1. stack pointer SP
  1. frame pointer FP
  FP = SP and work on FP inside a function
  LLVM's omit frame pointer pass optimizes extra stack management