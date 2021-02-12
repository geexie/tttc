# Grammar

## 1. Making ambiguous grammar unambiguous

```
E => E + E
   / E * E
   / i

w1: i + i + i

E => E + i
   / E * i
   / i

w2: i + i * i
```

1.  Associativity == recursion

   ```
   E => E + i
      / E * i
      / i
   ```
1. Operator precedence == level

   ```
   E => E + T / T
   T => T * F / F
   F => i
   ```

Ex:
```
i ^ i ^ i

E => E + T / T
T => T * F / F
F => G ^ F / G
G => i
```
Ex :
```
B => B or B
   / B and B
   / not B
   / TRUE
   / FALSE
```
or  3 left
and 2 left
not 1
```
B => B or D
   / D
D => D and C
   / C
C => not C / TRUE / FALSE
```
Ex:
```
R => R + R
   / R | R
   / R*
   / a
   / b
   / c

[1-9]*

R => R + P / P
P => PD / D
D => D* /a/b/c
```
Ex:
```
A => A $ B / B
B => B # C / C
C => C @ D / D
D => å
```
\$ 3
\# 2
\@ 1

Ex:

```
E => E * F
   / F + E
   / F
F => F - F
   / i
```

2 + RA == * LA
1 - U

## 2. Eliminating left side recursion

1. left - side

```
A => Aå / ß
```

1. right - size

```
A => åA / ß
```

```
A => Aå
   / ß

==

A  => ßA'
A' => e
    / åA'
```

```
w : ß

A => ßA'
  => ße == ß


ßå*
```

Ex1:

```
E => E (+ T) / T

E  => TE'
E' => e
    / +TE'
T  => FT'
T' => e
   / *FT'
F => G ^ F
   / G
G => i
```

Ex2:

```
S => (S)(0S1S)
   / 01
```

```
A => Aå
   / ß
```

```
A  => ßA'
A' => e
    / åA'
```

```
S => 01S'
S' => e / 0S1SS'
```

## 3. Making nondeterministic grammar deterministic

```
A => åß1
   / åß2
   / åß3

W: åß3
```

Backtracking (especially top-down parsers)

Left factoring

```
A => åA'
A' => ß1
    / ß2
    / ß3
```

Ex1:
```
S => iEtS
   / iEtSeS
   / å

E => ß
```
deterministic?

ambiguous?

Ex1:

```
S => aSSbS
   / aSaSb
   / abb
   / b
```

Ex2:

```
S => bSSaaS
   / bSSaSb
   / bSb
   / a
```

Ex3:

```
A => aA
B => bB
```

1. ambiguous <- G -> **unambiguous**
2. left-recursive <- G -> **right-recursive**
3. nondeterministic <- G -> **deterministic**