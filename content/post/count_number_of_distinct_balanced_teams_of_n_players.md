---
title: "Counting the number of distinct balanced teams of n players"
author: "rahdeck"
draft: true
published: 
---
One of my favorite weekend activities is playing beach volleyball. The number of players is variable, from the prescribed 4 up to 9 or 10 in extreme but rare cases. Almost every set we try to mix people up between teams to keep the game more interesting.  That naturally led me to thinking how many balanced teams can $n$ players form.

If $n$ is even, then the reasoning is quite easy and intuitive: we pick $\frac{n}{2}$ from the total $n$ players in $\binom{n}{\frac{n}{2}}$ ways, but whenever we pick the $\frac{n}{2}$ players for the first team, this action also completely determines which players are left to form the second team. So we need to divide this number by two to get the number of all teams.

To illustrate, let's assume we have 6 players: {A,B,C,D,E,F}. When we pick 3 random players from this set, say {A,C,E}, this leaves players {B,D,F} for the second team. If we then pick {B,D,F} for the first team we have double-counted this split players into teams. To fix that, we need to divide by two.

How do we tackle a case where $n$ is an odd number? To get as close to a balanced split as possible, we only allow one team to have one player more than the other and consider larger differences as unbalanced teams and not count them here. Let's illustrate this scenario with a group of 5 available players: {A,B,C,D,E}. We can split those 5 players into teams of size 3 and 2. This can be evidently done in $\binom{5}{2}$ or, equivalently, $\binom{5}{3}$ ways. However, the difference from the previous case with an even number of players is that we don't need to divide by 2. Why?  When we pick two players for the first team, the three remaining players are left for the second team, say we split the teams into {A,B} and {C,D,E}. As you can see there is no way we can pick two players out of five to get the second team, which was the case in the previous case. So we have no double counting here and don't need to account for it.

That leaves us with a bit of a conundrum: how do we reconcile the two different cases into one formula where you can plug in $n$ and get the result?



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
