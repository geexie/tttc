# The Lexer

Source code ---> [Scanner] ---> char ---> [Tokenizer] ---> token ...

- Recognises words in a character stream
- Produces tokens (words) from lexeme (== literal)
- Collect identifier information *Example: x=y+2*z; becomes IDENTIFIER(x) EQUAL IDENTIFIER(y) PLUS CST(2)*
- Eliminates white space (including comments)
- Stores line information (the only place it's available)
- Checks for errors (how many tokens and what are those responsibilities)

*Typical tokens include number, identifier, +, –, new, while, if*

## Lexems vs Tokens

How many tokents?

```c++

// the base class for all Statements
class Stmt {
public:
  Stmt() : opCode(-1) {}

private:
  int opCode; /* type of operation */
};

```

next

```c

int max(x, y)
  int x, y;
  /*find maximum of x and y */
{
  return (x > y) ? x : y;
}

```
next

```c

printf("we are at %x now", &x);

```

and next

```ocaml
 let rec fact x =
    if x <= 1 then 1 else x * fact (x - 1);;
```

and next

```ocaml
let average a b =
    (a +. b) /. 2.0;;
```

## The Parser - Syntax analizer

1. Takes language grammar. Language of G, L(G), are all the words reachable from the start symbol.
1. Takes an input stream of tokens. A word is a string over terminals.

## CFG

Context free grammar is a formal grammar which is used to generate all possible strings in a given formal language.
Context free grammar G can be defined by four tuples as:

G= (V, T, P, S)  

Where,
- G describes the grammar
- T describes a finite set of terminal symbols.
- V describes a finite set of non-terminal symbols
- P describes a set of production rules
- S is the start symbol.

```
E => E + E   
   | E * E   
   | id   
```

w: id + id * id

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

A parse tree (derivation tree) is an ordered rooted tree that graphically represents the semantic information a string derived from a context-free grammar.

- Root vertex − Must be labeled by the start symbol.
- Vertex − Labeled by a non-terminal symbol.
- Leaves − Labeled by a terminal symbol or ε.

## ambiguous grammar & unambiguous grammar

ambiguous

- more than one parse tree
- or LMD
- or RMD

Ambiguity of a grammar is undecidable, i.e. there is no particular algorithm for removing the ambiguity of a grammar, but we can remove ambiguity by:  
 
Disambiguate the grammar i.e., rewriting the grammar such that there is only one derivation or parse tree possible for a 
string of the language which the grammar represents

## making grammar unumbigues

Unbigues grammar should not be used in a compiler since more than one parse tree is possible

1. Assiciativity
1. Precedence

## Disambiguesty rules

1. Add recursion to fix associalivity
1. Add level to fix precedence

## Examples

## Left vs Right reqursion

##

