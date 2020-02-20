---
title: "Counting the number of distinct balanced teams of n players"
author: "rahdeck"
draft: true
---
$$f(n) = \frac{\binom{n}{\lfloor{n/2}\rfloor}}{((n + 1) mod 2) + 1)}$$

Wzór na liczbę możliwych podziałów n osób na 2 zbalansowane teamy (mogą mieć liczbę osób różną góra o 1, przy nieparzystej liczbie n)

Dla wartości n od 0 do 20 (choć 0 i jeden można wykluczyć):

```text
  n teams
  0     0
  1     1
  2     1
  3     3
  4     3
  5    10
  6    10
  7    35
  8    35
  9   126
 10   126
 11   462
 12   462
 13  1716
 14  1716
 15  6435
 16  6435
 17 24310
 18 24310
 19 92378
 20 92378
 ```
 
 a sama sekwencja: https://oeis.org/A128015
