# SSA, Phi-nodes, CFG

x                 = y op z
l-value             r-value
have storage type   no storage type

## Single static assignment

```
S => id = E
E => E + T / T
T => T * F / F
F => id
```

```
w: x = a + b * c
```

```
t0 = b * c
t1 = a + t0
x = t1
```

Ex #1:
```cpp
for (int i = 0; i < 10; i++)
  a[i] = x*5;
```
1. `int i = 0` loop header
1. `a[i] = x*5;` loop body
1. `i++` loop increment
1. `i < 10` loop condition


```
// header
(1)  i = 0
// body
(2)  t1 = x * 5
(3)  t2 = &a[0]
(4)  t3 = sizeof(i)
(5)  t4 = i * t3
(6)  t5 = t2 + t4
(7)  *t5 = t1
// increment
(8)  i = i + 1 // not real 3x code
// condition
(9)  i < 10 goto (2)
```

down -> up - backward branch
up -> down - forward branch

True path - taken
False path - not taken

Ex #2:
```cpp
int fact(int x) {
  int f = 1;
  for (int i = 0; i <= x; i++)
    f = f * i;
  return f;
}
```

```
  (1) f = 1
  (2) i = 2
L2:
  (3) if x < i goto L1 // conditional, forward branch
  (4) t1 = f * i
  (5) f = t1
  (6) t2 = i + 1
  (7) i = t2
  (8) goto L2 // unconditional, backward branch
L1:
  (9) return f
```

## Control Flow Graph (CFG)

Base Block - single entry & single exit
Ex: loop body

Leader, if
  1. The 1st statement in a function
  1. statement which is a target for conditional or unconditional branch
  1. statement followed conditional or unconditional branch

```
->
    (1) f = 1
    (2) i = 2
-> L2:
    (3) if x < i goto L1 // conditional, forward branch
->  (4) t1 = f * i
    (5) f = t1
    (6) t2 = i + 1
    (7) i = t2
    (8) goto L2 // unconditional, backward branch
-> L1:
    (9) return f
```

1. find basic block
  1. find leader
  1. start basic block from one leader up to another leader

```
BB0:
->
    (1) f = 1
    (2) i = 2
BB1:
-> L2:
    (3) if x < i goto L1 // conditional, forward branch
BB2:
->  (4) t1 = f * i
    (5) f = t1
    (6) t2 = i + 1
    (7) i = t2
    (8) goto L2 // unconditional, backward branch
BB3:
-> L1:
    (9) return f
```

CFG:
  1. nodes are basic blocks
  1. edges are control frow dependencies


Ex #1:
```
if A < B && C < D than t = 1 else t = 0
```

Which `t` should we return?

## Single static assignment form

Each variable is assigned only once

Ex1: basic block

```
x = a + b
y = x + 1
z = y * c + a
y = z - b
```
=> 3 address code
```
t0 = a + b
x = t0
t1 = x + 1
y = t1
t2 = y * c
t3 = t2 + a
z = t3
t4 = z - b
y = t4
```
=> SSA
```
t0 = a + b
x = t0
t1 = x + 1
y0 = t1
t2 = y * c
t3 = t2 + a
z = t3
t4 = z - b
y1 = t4
```

`x = phi(y0, ..., yN)`
`yi = {yi, bi}`

Ex #2:
```
(1) if a < b goto (3)
(2) goto (4)
(3) if c < d goto (6)
(4) t = 0
(5) goto (7)
(6) t = 1
(7) return t
```

```
BB0:
(1) if a < b goto (3)
BB1:
(2) goto (4)
BB2:
(3) if c < d goto (6)
BB3:
(4) t0 = 0
(5) goto (7)
BB4:
(6) t1 = 1
BB5:
t2 = Phi(t0 : BB3, t1 : BB4)
(7) return t2
```

Convert to SSA
1. rename all variables to make unique names
1. add phi operators, if needed

Def - Use dependencies

Value - User

```
case
 0: a = 1
 1: a = 2
 2: a = 3

case
 0: b = a
 1: c = a
 2: d = 1
```

Tree representations:
1. Module - activation graph / call graph
1. Function - CFG
1. basic block - DAG