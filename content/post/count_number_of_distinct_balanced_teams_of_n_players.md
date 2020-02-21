---
title: "Counting the number of distinct balanced teams of n players"
author: "rahdeck"
published: not!
draft: yes
---
One of my favorite weekend activities is playing beach volleyball. The number of players who show up is variable, from the prescribed 4 up to 9 or 10 in extreme rare cases. For every set we play, we try to mix people up between teams to keep the game more interesting.  That naturally led me to thinking how many balanced teams can $n$ players form.

If `$n$` is even, the reasoning goes as follows: we pick `$\frac{n}{2}$` from the total `$n$` players in `$\binom{n}{\frac{n}{2}}$` ways. However this leads to double counting. Let me illustrate.

Let's assume we have 6 players: `$\left\{A,B,C,D,E,F\right\}$`. When we pick 3 random players from this set, say `$\left\{A,C,E\right\}$`, this leaves players `$\left\{B,D,F\right\}$` for the second team. Then later, as part of the `$\binom{n}{\frac{n}{2}}$` number of ways, we pick `$\left\{B,D,F\right\}$` for the first team and `$\left\{A,C,E\right\}$` are left for the second teams. But those two teams are identical to the previous choice! In this way we have double-counted this particular split of players into teams. To fix that, we need to divide by two. Hopefully this is clear.

How do we tackle a case where `$n$` is an odd number? To get as close to a balanced split as possible, we only allow one team to have one player more than the other and consider larger differences as unbalanced teams and not count them here. Let's illustrate this scenario with a group of 5 available players: `$\left\{A,B,C,D,E\right\}$`. We can split those 5 players into teams of size 3 and 2. This can be evidently done in `$\binom{5}{2}$` or, equivalently due to binomial symmetry, `$\binom{5}{3}$` ways. However, the difference from the previous case with an even number of players is that we don't need to divide by 2. Why?  When we pick two players for the first team, the three remaining players are left for the second team, say we split the teams into `$\left\{A,B\right\}$` and `$\left\{C,D,E\right\}$`. As you can see there is no way we can pick two players out of five to get the second team, which was the case in the "even" scenario. So we have no double counting here and don't need to account for it.

That leaves us with a bit of a conundrum: how do we reconcile the two different cases into one formula where you can plug in `$n$` and get the result? Let's see if listing the first few numbers for `$n$` players and the number of ways to split them into teams can enlighten us.

|  Players            |     Teams        |
| :-----------------: | :--------------: |
|         2           |         1        |
|         3           |         3        |
|         4           |         3        |
|         5           |        10        |
|         6           |        10        |
|         7           |        35        |
|         8           |        35        |

We immediately notice that when the total number of players is even, the number of possible teams is the same as for the `$n-1$` players, which is the "odd" case. Now we're ready to start thinking about the shape of the formula that would capture this behaviour.

The numerator should be the number of ways to pick `$\frac{n}{2}$` elements from `$n$` and since we need to account for odd total number of players let's appply a floor() function to the fraction to ensure an integer result: `$\binom{n}{\lfloor{n/2}\rfloor}$`. This would yield the following values for the first few `$n$`:

```text
    n   numerator
    2           2
    3           3
    4           6
    5          10
    6          20
    7          35
    8          70
```

So now what's left to figure out is how to build a denominator that will halve the numerator when `$n$` is even and leave it as-is when `$n$` is odd, basically a function that spits out 1 when input is odd and 2 when input is even (we can assume only natural numbers will be fed into this function). The function should produce a pattern of 1, 2, 1, ..., 2, 1, 2 forever. Sounds like modulo function should be helpful here. The problem is, if we do `$n \bmod{2}$` then it will produce a pattern of 1, 0, 1, 0, etc. So we need to add 1 to its result, `$(n \bmod{2}) + 1$` and then we get 2, 1, 2, 1, etc. There's only one little problem remaining: the function is "out of phase" as it starts off with 2 but we want it to start with 1. To sync it, we can add 1 to `$n$` itself and come up with a final function of `$((n + 1) \bmod{2}) + 1$` for the denominator.

The whole function in its full glory:

`$$f(n) = \frac{\binom{n}{\lfloor{n/2}\rfloor}}{((n + 1) \bmod{2}) + 1)}$$`

Here are the results for `$n$` ranging from 2 to 20:

```text
  n teams
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
 
This sequence can be found at https://oeis.org/A128015 where it is described as "Binomial coefficients C(2n+1,n) repeated". So it turns out all this was a long-winded way to end up in a place of simplicity :-) 