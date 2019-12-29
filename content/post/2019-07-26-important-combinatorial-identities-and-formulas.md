+++
title = "Important combinatorial identities and formulas"
slug = "2019-07-26-important-combinatorial-identities-and-formulas"
published = 2019-07-26T01:28:00.002000-07:00
author = "rahdeck"
tags = []
+++
permutations: \\(P(n) = n!\\)

r-permutations (r-permutation of the n-set, P(n, r)): \\(P(n, r) =
\\frac{n!}{(n-r)!}\\)

r-combinations: \\(C(n, r) = \\binom{n}{r} = \\frac{n!}{r!(n-r)!}\\)
which is the same a r-permutations divided by r!, that is
\\(\\frac{\\frac{n!}{(n-r)!}}{r!} = \\frac{n!}{(n-r)!} \\cdot
\\frac{1}{r!}\\). I find it much more intuitive to think about it as
\\(\\frac{n^{\\underline{k}}}{(n-r)!}\\). The symbol in the numerator is
falling factorial but it doesn't really render nicely in the blog for
some reason (there is an underline under \\(k\\))

1.  r-combinations are symmetric: \\(C(n,r) = C(n,n-r)\\), that is
    \\(\\binom{n}{r} = \\binom{n}{n - r}\\)

Power-set cardinality is \\(2^n\\), which is equal to \\(\\sum\_{k=0}^n
\\binom{n}{k}\\) (that is, the sum of binomial coefficients from 0 to n)

Stars and bars method or how many ways to place n balls into k bins
