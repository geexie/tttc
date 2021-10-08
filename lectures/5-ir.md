# Intermediate representation

Frontend - analysis phase
Backend - synthesis phase

Module

Passes
1. analysis
1. transformation

Basic Block
1. leader
1. terminal

3x address code

`def <- op  arg0 arg1`

Ex:

1. `+ a t0`
2. `br target {}`
3. `LT a b`
4. `[] ptr i`

S - statement
E - expression
T - term
F - factor
id - identifier

```
S => id = E {gen (id.name = E.vreg) }
E => E + T  { E.vreg = newTmp(); gen (E.vreg = E.vreg + T.vreg) }
   / T      { E.vreg = T.vreg }
T => T * F  { T.vreg = newTmp(); gen (T.vreg = T.vreg * F.vreg) }
   / F      { T.vreg = F.vreg }
F => id     { E.vreg = id.name }

x = a + b * c
```

```
t0 = b * c
t1 = a + t0
x = t1
```

AST + semantic rules -> 3 address code
AST -> postfix form -> 3 address code

Encoding:

1. triples op src0 src1
  ```
  (0) * b c
  (1) + a (0)
  (2) = (1)
  ```
1. quadruples dst op src0 src1
  ```
  t0 * b c
  t1 + a t0
  x = t1 {}
  ```

## Hierarchical IR

planar IR

Module
 Function
  Basic block
    Instruction
    Instruction
  Basic block
    Instruction
 Function
   Basic block
    Instruction
    Instruction
    Instruction
  Basic block
    Instruction
    Instruction
  Basic block
    Instruction

High level information like loops are vanished

1. Instruction -> Operation which gives hierarchy, operations can be different granularity

Module
 Function
  Basic block
    Operation
      Function
        Basic Block
          Operation
          Operation
      Function
        Basic Block
          Operation
    Operation
  Basic block
    Operation
 Function
   Basic block
    Operation
    Operation
    Operation
  Basic block
    Operation
    Operation
  Basic block
    Instruction

Ex: loop can be an operation

1. Iterative/partial lowering

AST -> IR -> ASM
classic: AST -> IR -> IR -> IR -> IR -> ASM
hierarchical: AST -> IR0 -> IR1 -> IR2 -> IR3 -> ASM
IRi - dialect
lowering - legalize IR for dialect i.
