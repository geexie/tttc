# Intermediate representation


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