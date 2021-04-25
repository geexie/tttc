# Dominators

## Dependence graph

1. node = base block
1. edge = dependence

    [1] <- entry
     |
     v
    [2]
-----|----
|    |   |
v    v   v
[3] [4] [6]
 |   |
 -----
    |
    v
   [5] <- exit

## Dominance

d >= n (d >> n), if all paths from entry to n walks through d

Ex: 1 >> 2, 1 >> 3, 3 ~~>>~~ 5

## Strict dominance

d >> n && d != n => d > n (strictly dominates)

Ex: 1 >> 2, 2 >> 5

## Dominance matrix

|   | 1 | 2 | 3 | 4 | 5 | 6 |
| 1 | + | + | + | + | + | + |
| 2 |   | + | + | + | + | + |
| 3 |   |   | + |   |   |   |
| 4 |   |   |   | + |   |   |
| 5 |   |   |   |   | + |   |
| 6 |   |   |   |   |   | + |

## Immediate dominance

1. d > n
1. d ~~ > ~~ k, for every k, where k > n

|   | 1 | 2     | 3     | 4     | 5     | 6     |
| 1 | + | **+** | +     | +     | +     | +     |
| 2 |   | +     | **+** | **+** | **+** | **+** |
| 3 |   |       | +     |       |       |       |
| 4 |   |       |       | +     |       |       |
| 5 |   |       |       |       | +     |       |
| 6 |   |       |       |       |       | +     |

## Dominance tree

1. nodes == base blocks
1. edges == immediate dominance

Ex:

    [1] <- entry
     |
     v
    [2]
-----|----
|    |   |
v    v   v
[3] [4] [5]
 |   |   |
 -----   |
    |    |
    v    |
   [6]   |
    |    |
    ------
      |
      v
     [7] <- exit

0(n^2) algorithm from dominance matrix or Tarjan algorithm O(e alpha(e, n))

## Dominance frontier

DF (n)

d -> DF(n), iif d is the first node for which path n -> exit and entry -> exit (not walked from n) merges

Ex:

    [1] <- entry
     |
     v
    [2]
-----|----
|    |   |
v    v   v
[3] [4] [5]
 |   |   |
 -----   |
    |    |
    v    |
   [6]   |
    |    |
    ------
      |
      v
     [7] <- exit

DF(1) = {}
DF(2) = {7}
DF(3) = {6}
DF(4) = {6}
DF(5) = {7}
DF(6) = {7}
DF(7) = {}

## DF applications

1. Phi functions placement

    [1] <- entry
     |
     v
    [2]
-----|----
|    |   |
v    v   v
[3] x = 1 [4] x = 2 [5]
 |   |   |
 -----   |
    |    |
    v    |
   [6] y = x + 1   | <- which one is to use
    |    |
    ------
      |
      v
     [7] <- exit

1. compute S all nodes which defines x
1. place phi into each n <= DF(S)
1. repeat #2 till converges


1. natural loop detection

         [1] <- entry
     ----|  ^
     |   |  |
     v   |  |
    [2]  |  |
     |   |  |
-----|-- |  |
|    |   |  |
v    v   v  |
[3] [4] [5] -
 |   |   |
 -----   |
    |    |
    v    |
   [6]   |
    |    |
    ------
      |
      v
     [7] <- exit

DF(1) = {1}
DF(2) = {7}
DF(3) = {6}
DF(4) = {6}
DF(5) = {1, 7}
DF(6) = {7}
DF(7) = {}