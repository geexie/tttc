# Liveness

Is used for:

1. register allocation
1. dead code elimination

number registers << number of variables

{a, b, c} are live if they are required in statement [x = y + 1] or any statement in the future,
d is dead since it's not in a live list

Ex 1:

```
[...]
[x = y + 1]  {a, b, c}  r0[a] r1[b] r3[c] r4[d] -> r0[a] r1[b] r3[c] r4[y]
[...]
[...]
[...]
```

Ex 2:

need spilling

```
[...]
[x = y + 1]  {a, b, c, d}  r0[a] r1[b] r3[c] r4[d]
[...]
[...]
[...]
```

Spilling strategy?

`v` is life at statement `n` if there is a path in CFG from `n` to `m` such that `v` is used in `m`
and there is no such `k` `n` < `k` < `m` which defines `v` or `v` is used in `n`

Ex 3:

```
0: v = 1
1: z = v + 1
2: x = z * v
3: y = x * 2
4: w = x + z * y
5: u = z + 2
6: v = u + w + y
7: return v * u
```

|   | v | z | x | y | w | u |
| - | - | - | - | - | - | - |
| 0 | D | D | D | D | D | D |
| 1 | L | D | D | D | D | D |
| 2 | L | L | D | D | D | D |
| 3 | D | L | L | D | D | D |
| 4 | D | L | L | L | D | D |
| 5 | D | L | D | L | L | D |
| 6 | D | D | D | L | L | L |
| 7 | L | D | D | D | D | L |

Ex 4:

```
0:     u = 0
1: L1: v = u + 1
2:     w = w + v
3:     u = v * 3
4:     if (u < 10) goto L1
5:     return w
```

|   | u | v | w |
| - | - | - | - |
| 0 | D | D | L |
| 1 | L | D | L |
| 2 | D | L | L |
| 3 | D | L | L |
| 4 | L | D | L |
| 5 | D | D | L |
