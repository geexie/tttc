# The Lexer

Source code ---> [Scanner] ---> char ---> [Tokenizer] ---> token ...

- Recognizes words in a character stream
- Produces tokens (words) from lexeme (== literal)
- Collect identifier information *Example: x=y+2*z; becomes IDENTIFIER(x) EQUAL IDENTIFIER(y) PLUS CST(2) MUL IDENTIFIER(Z)*
- Eliminates white space (including comments)
- Stores line information (the only place it's available)
- Checks for errors (how many tokens and what are those responsibilities)

*Typical tokens include number, identifier, +, –, new, while, if*

## Lexemes vs Tokens

### 1. How many tokens?

```c++

// the base class for all Statements
class Stmt {
public:
  Stmt() : opCode(-1) {}

private:
  int opCode; /* type of operation */
};

```

Answer: 23

1. `class`
1. `Stmt`
1. `{`
1. `public`
1. `:`
1. `Stmt`
1. `(`
1. `)`
1. `:`
1. `opCode`
1. `(`
1. `-`
1. `1`
1. `)`
1. `{`
1. `}`
1. `private`
1. `:`
1. `int`
1. `opCode`
1. `;`
1. `}`
1. `;`

### 2. How many tokens?

```c

int max(x, y)
  int x, y;
  /*find maximum of x and y */
{
  return (x > y) ? x : y;
}

```

Answer: 25

### 3. How many tokens?

```c

printf("we are at %x now\n", &x);

```
Answer: 8

### 4. How many tokens?

```ocaml
 let rec fact x =
    if x <= 1 then 1 else x * fact (x - 1);;
```

Answer: 21

### 5. How many tokens?

```ocaml
let average a b =
    (a +. b) /. 2.0;;
```

Answer: 13

Most popular tool for automatic generation: LEX

## The Parser - Syntax analyzer

1. Takes language grammar. Language of G, L(G), are all the words reachable from the start symbol.
1. Takes an input stream of tokens. A word is a string over terminals.

Most popular tool for automatic generation: YACC

## CFG

Context free grammar is a formal grammar which is used to generate all possible strings in a given formal language.
Context free grammar G can be defined by four tuples as:

G = (V, T, P, S)

Where,
- G describes the grammar
- T describes a finite set of terminal symbols.
- V describes a finite set of non-terminal symbols
- P describes a set of production rules
- S is the start symbol.

Example grammar:
```
E => E + E
   / E * E
   / id
```

G = (V, T, P, S), where:
V = {E}
T = {+ * id}
S = {E}
P = {E+E/E*E/id}

Another example:

```
E => E z E
   / E y E
   / q
   / F

F => e
    / p
```

Word:
```
w = x + y * z
madd w x y z
2 + 3 * 4
```

```
E => E + E
   / E * E
   / id
```

w: id + id * id

what if we start with 1st rule

E => E + E

Left most derivation

```
E => id + E
E => id + E * E
E => id + id * E
E => id + id * id
```

Right most derivation

```
E => E + E * E
E => E + E * id
E => E + id * id
E => id + id * id
```

what if we start with 2d rule

Left most derivation: v2

```
E => E * E
E => E + E * E
E => id + E * E
E => id + id * E
E => id + id * id
```

Right most derivation: v2

```
E => E * E
E => E * id
E => E + E * id
E => E + id * id
E => id + id * id
```

## parse tree

A parse tree (derivation tree) is an ordered rooted tree that graphically represents
 the semantic information a string derived from a context-free grammar.

- Root vertex − Must be labeled by the start symbol.
- Vertex − Labeled by a non-terminal symbol.
- Leaves − Labeled by a terminal symbol or ε.
