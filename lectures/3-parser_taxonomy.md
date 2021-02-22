# Top down/Bottom up parsers. Abstract syntax

## Parser taxonomy

```
S => E
E => E + T
   / E * T
   / T
T => a / b / c

w: a + b * c

a + b * c
T + b * c
E + b * c
E + T * c
E * c
E * T
E
S
```

```
S => aABc
A => Abc
   / b
B => d

w: abbcdc

S => aABc
  => aAbcBc
  => abbcBc
  => abbcdc
```

LMD

```
S => aABc
  => aAdc
  => aAbcdc
  => abbcdc
```

RMD

## Abstract syntax
