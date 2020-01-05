---
title: "Using combinatorics and probability to reduce alerting noise"
author: "rahdeck"
draft: true
---
\[DISCLAIMER: This post is from a few years ago and I'm no longer on the
same team as when it was written. I was too lazy to modify the whole
post to use past tense though so it's published in its original present
tense form\]  
  
My team operates a build fleet that creates search indexes of all
documents within our company. For simplicity's sake let's assume there
are 20 separate search indexes, each with their corresponding build. The
builds for all indexes run in the same batch (all builds start at the
same time and wait till the last one in the batch finishes, then the
cycle repeats) but otherwise they're independent (run on different build
clusters). Batches run with a frequency of roughly twice a day. A build
within a batch may occasionally fail, usually due to random failures of
machines in the build cluster, with a frequency, say, of 1 failure in 20
builds or **5% chance of failure (95% chance of success)**. For
simplicity, let's assume that this probability of failure is independent
between builds but is the same (5%) for all of them. We monitor the
builds for failures and get an alert for each failed build.  
  
Here is a graphical representation of three build batches (each roughly
12 hours apart from each other) of twenty builds each, two of which have
a single failed build (Build 2 failed in Batch 1 and Build 20 failed in
Batch 3) and one in which all builds completed successfully (Batch 2):  
  

[![](../images/thumbnails/2019-07-26-using-combinatorics-and-probability-to-reduce-alerting-noise-build_batches.png)](../images/2019-07-26-using-combinatorics-and-probability-to-reduce-alerting-noise-build_batches.png)

  
  
In this post I'd like to explore some of the ways of calculating the
probabilities for various failure/success scenarios.  
  

### Probability of at least one build failure in a batch

Let's first calculate the probability that at least one build in a
single batch fails. Modelling it as a ball and urn problem and solving
it combinatorially is one of the ways of calculating it.  
  
We have 20 urns and *n* balls (equal to number of builds in the batch).
Why is there 20 urns? Since we have set a single build failure
probability at 5%, each of the 19 urns represents a 5% chance of success
(adding up to 95%) and one of those urns (let's say urn \#1) is a
"failure" urn (also 5% chance), meaning that if a ball falls into this
urn, the build failed. If at least one ball of the *n* balls we have
lands in urn \#1 (representing a failure, with 0.05 or 1/20 probability)
then there was a failure and we get an alert. The question is: what is
the ratio of the number of arrangements with one or more ball in urn \#1
to the total number of arrangements?  
  
Results of builds in each batch can be represented as an *n*-tuple of
integers from 1 to 20, with 1 standing for failure and any other number
signifying success. For a batch with 5 builds the tuple may look like:
(6,15,3,1,20), for the real world batch of twenty builds it is a
20-tuple. As we can see in the 5-tuple, build \#4 failed as it ended up
in urn \#1. The total number of arrangements may be calculated as
\\(20^5\\) (because multiple balls can fall into the same urn), in this
case, \\(20^5 = 3,200,000\\).  
  
Calculating the number of possible arrangements with at least one ball
in urn \#1 is a lot of work. You would have to consider all
possibilities from a single ball in the urn, then 2 balls in the urn, 3
balls in the urn, ..., all the way to *n* (in our case 5) balls in the
urn (which is the case where all builds failed). A simpler calculation
is that of the complement of this event, that is the number of
arrangements where balls are allowed to land only in urns \#2 through to
\#*n* (i.e. 2,3,4,5 for a 5-build batch) but not in urn \#1, which
stands for all batches where none of the builds failed. It is a
calculation similar to the previous one, but this time we have only 19
urns to work with, giving \\(19^5 = 2,476,099\\). Subtracting that
number from total number of arrangements yields the number of
arrangements with at least one ball in urn \#1: \\(20^5 - 19^5 =
3,200,000 - 2,476,099 = 723,901\\).  
  
Dividing the failed arrangements by the total number of arrangements
gives: \\(\\frac{20^5 - 19^5}{20^5} = 0.226\\) or 22.6% chance of at
least one failed build in a 5-build batch.  
  
Probabilities of at least one failure in an *n*-batch for other values
of *n*, when a chance of failure for a single build is 5%:  
  
  
  
- 10:  0.401  
- 14:  0.512  
- 20:  0.641  
- 30:  0.785  
- 100: 0.994  
  
We can approach this problem from another angle, by calculating the
probability of 0 failures in an *n*-batch build. It is a calculation
most of us should be familiar with, quite intuitively it is multiplying
probability of success by itself *n* times, that is raising p to the
*n-*th power: \\(p^x\\). For our assumed values of 20-build batch and
0.95 probability of success it gives: \\(0.95^20 = 0.3584859\\). Thus,
the probability of one or more failures is the complement of this
success value to 1, i.e.: \\(1 - 0.95^20 = 0.641\\), which matches the
value for 20 we calculated combinatorially in the list above. It's
always a good idea to cross-check your results and confirm they match,
whenever possible.  
  
\[INSERT GRAPH OF A FUNCTION OF N TO PROBABILITIES OF AT LEAST 1
FAILURE\]  
\[SHOW HOW PBINOM FUNCTION CAN GIVE YOU THE SAME\]  
\[SHOW HOW SIMULATION CONFIRMS THE RESULTS IN BOTH CASES\]  
  

### Probability of two build failures of the same build in two consecutive batches

Clearly those are quite high probabilities, even when the chance of
failure of a single build is 5% (or 1 in 20), and so it seems like we're
going to get those alerts quite often. Especially for batches with many
builds the probability of at least one out of n builds failing is quite
high. It turns out we don't actually need to alert for a failure if the
same build runs successfully on the next attempt. We're mostly concerned
if the build keeps failing repeatedly, at least two times in a row. How
would alarming on two consecutive failures of a specific build affect
the probabilities of getting an alert?  
  
Let's use the values given in the first example, P(failure) = 5%, number
of builds = 5.  How do we model this a a ball and urn problem? This time
the number of urns is a square of the previous number, we can imagine it
as a 5x20 grid. Each row represents a specific build and there are two
balls for it, one for the first build and the second for the second one.
The build will fail twice consecutively if both balls fall into the same
urn \#1. The probability of 2 consecutive random failures for a single
build is now 0.05^2 which is the same as 1/400. Otherwise the problem is
very similar to the first case above. We need to calculate the total
number of arrangements and the number of arrangements where at least one
ball lands in urn 1.  
  
The total number of possible arrangements: \\(400^5\\), which is a very
large number, on the order of \\(10^13\\).  
The number of arrangements where at least one ball lands in urn 1. Like
above, it's easier to calculate the complement, which in this case is
\\(399^5\\).  
  
Subtracting this number from the total number of arrangements and
dividing by the total number of arrangements gives \\((400^5 -
399^5)/400^5 = 0.012\\) or 1.2%, a much lower chance of getting the
dreaded ticket!  
  
Values for other n:  
  
- 10:  0.024  
- 20:  0.048  
- 30:  0.072  
- 40:  0.095  
- 100: 0.221  
  
\[INSERT GRAPH LIKE ABOVE\]  
  
As you can see with this setup there is no longer a vision of a daily
alert looming over our heads. Even for a very large batch of 100 builds
the probability is only 22% vs an almost certain failure (99%) in the
single failure mode. We've reduced the alert noise and made Ops happier!
