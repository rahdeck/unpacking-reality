+++
title = "Binomial distribution"
slug = "2019-07-26-binomial-distribution"
published = 2019-07-26T02:47:00.001000-07:00
author = "rahdeck"
tags = []
+++
Binomial distribution is a very handy tool to calculate probability of
getting *k* successes in *n* trials. The canonical example is coin
tossing, because it's easy and intuitive to define heads as success and
tails as failure, with equal probabilities (0.5) in case of a fair coin.
Another example is dice throws. Here one can be a little more creative
with what constitutes success and failure. For example, throwing an even
number can be considered a success (probability of a success in a single
trial equal to 0.5) or throwing a six (probability of a success in a
single trial equal to \(\frac{1}{6}\). One can get very creative in
how one defines success and failure so that this tool can be applied in
an endless number of situations. I guess the main difficulty might lie
in an appropriate definition of success and calculating its probability
in a single trial. Once you've done that, you can apply this formula
mechanistically and get the result.  
  
  
I write this post to etch in my memory how to derive the formula for a
probability of getting *k* successes in *n* trials. The derivation is
actually pretty intuitive so I hope that by writing it down I will
remember the derivation process, rather than memorize the formula which
is something my brain is not so great at.  
  
Let's work an example and assume we want to know what is the probability
of getting two sixes in ten die throws. We have the following
information at our disposal:  
  

-   *n* (number of trials) = 10
-   *k* (number of desired successes) = 2
-   *p* (probability of success in each trial, assuming a fair dice)
    =\(\frac{1}{6}\)

  
To visualize the possible outcomes let's treat each sequence of ten
throws as a sequence of ten consecutive letters, S or F (for success or
failure), in this case limiting the total number of S's in the sequence
to two. Here are a few example sequences:  
  

-   SSFFFFFFFF
-   SFSFFFFFFF
-   SFFFFFFFFS

Since there are two out of ten positions for S's to be in, there are a
total of \\(\\binom{10}{2}\\) (or, equivalently, \\(\\binom{10}{8}\\))
possible sequences with two S's and eight F's.  
  
The probability of each of those sequences occurring is a product of
probabilities of all individual events, which we know in this case are
\\(\\frac{1}{6}\\) for success and \\(1-\\frac{1}{6}\\) for failure. So
for each sequence the probability is: \\(\\frac{1}{6}^2 \\cdot
(1-\\frac{1}{6})^8\\) (exponent of two because we have two successes,
exponent of eight because we have eight failures). But as we've
established there are \\(\\binom{10}{2}\\) sequences so we have to
multiply probability of each sequence by that number to get the final
formula: \\(\\binom{10}{2}\\frac{1}{6}^2(1-\\frac{1}{6})^8 =
0.29071\\)  
  
The generic formula with symbols instead of actual values is thus:  
  
\\(\\binom{n}{k}p^k(1-p)^{n-k}\\)  
  
I hope that derivation makes sense (though I might have taken some
shortcuts and made assumptions)  and intuitively explains the formula.
Actually, now that I look at the formula after I've derived it, it seems
not that hard to remember it in its symbolic representation either (but
it could be because I've just worked an example and the formula might
fade away over time).  
  
The final result can actually be calculated without the formula, purely
by combinatorial argument:  
  

-   There are a total of \\(6^{10}\\) possible outcomes
-   There are a total of \\(\\binom{10}{2}\\) outcomes with exactly two
    6's
-   There are a total of \\(5^8\\) ways for 8 remaining dices to turn up
    (we have 5 as the base of exponentiation because we cannot select
    any additional 6's as we only want two of them)
-   The final result is thus:

\\(\\frac{\\binom{10}{2} \\cdot 5^8}{6^{10}} = 0.29071\\)  
  
which is the same as calculated above.  
  
The probability formula will come in handy when the combinatorial
argument is unwieldy or harder to make.
