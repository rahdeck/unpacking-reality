---
title: "Revelations of set theory"
published: 2021-04-26
author: "rahdeck"
draft: false
---

When reading math books, sets jump at you from every corner (well, every page). A lot of mathematical concepts are expressed in terms of sets or operations on sets (functions, relations). Set theory is often considered the foundation of mathematics, which is kind of interesting as it's a rather young theory, invented in 19th century, certainly much younger than a lot of prior mathematics, which it is now a foundation of. It is a bit funny that foundations were worked out long after the math which they support but this might not be uncommon in science. After all, similarly foundational quantum mechanics might support physical phenomena which have been discovered long before it but weren't initially based on quantum mechanics but other, simpler approximations of nature.

It turns out that what most of us learn about sets is something that mathematicians call "naive set theory". "Naive" is not an offensive term, is not synonymous with "easy" but rather it emphasizes the non-axiomatic basis of the theory (I guess "naive" being related to folk wisdom or based on observation rather than axioms). This naive set theory is sufficient for most math applications and its laws are mostly the same as those of the axiomatic theory (as far as I can tell).

What is also quite strange to a novice like myself is that there is no single axiomatic set theory, but multiple ones, though one of them, called [Zermelo-Fraenkel set theory](https://en.wikipedia.org/wiki/Zermelo%E2%80%93Fraenkel_set_theory) (abbreviated to ZF) seems to be the most commonly accepted one (as you can see maths be a contentious field too!)

After this introduction, I need to clarify that set theory is not the main focus of this post but rather I will use it to exemplify how careful reading of *any* theory can expand your understanding of a given topic and lead to serendipitous learning. The requirement is that we actually read the texts carefully, paying special attention to axioms and other bolded out sentences (therefore presumably important) and make an effort to understand what the author is saying and why they're saying it. It can be also instructive to say something slightly different, rephrase the author's words or skip certain words altogether and explore the implications. If the conclusion is unchanged, then perhaps we don't fully understand or correctly interpret the text or maybe the author was a bit sloppy with their wording. Though I wouldn't expect the axioms of set theory to be worded sloppily as it is probably one of the most important and most examined theories of mathematics. Anyway, let me show you how my own process of reading just a single axiom of the ZF set theory went and what I've learnt from it, as I was reading Paul Halmos's "Naive set theory", which has a hilarious cover art, by the way:

[![](/images/naive_set_theory.jpg)](/images/naive_set_theory.jpg)

The first axiom in the book, the axiom of extension, is presented as follows:

### Two sets are equal if and only if they have the same elements.

After I first read it, I had the following questions:

1. What is *"extension"* in the name of the axiom?
1. Why does it say *"if and only if"* and not just *"if"* or *"only if"*?
1. Why is there a need at all to state something so seemingly obvious and even choose it as the first axiom of your theory?

All these are valid questions and the author answers them but I felt like I needed some additional re-inforcement of the answers to plant them more firmly and more permanently in my mind. To that end I explored other sources such as Wikipedia, StackOverflow forums and other math books to get a better feel/intuition for all those words and concepts. I find that reading about one thing in multiple sources can often enrich and add nuance to my understanding of it.

Bear in mind that those are my interpretations of the explanations and I could be very well either completely or at least partially wrong. With that caveat here is what I found: 

1. *Extension* is explained by contrasting it with *intension*. Intension is a specification of how to construct or build something.

   For example, one specification on how to build the set {2,4,8} could be:

   - put the first even natural number into the set,
   - put the second even natural number into the set,
   - put the fourth even natural number into the set.

   Another specification (for the same set) could be:

   - put the first even natural number into the set,
   - multiply the previous number by two and put the result into the set,
   - multiply the previous number by two and put the result into the set.

   Those instructions could be called "intensions", or internal specifications. Nevertheless, both instructions produce the same result, namely the set {2,4,8}. This set is the *extension* or the externally visible result of applying the *intension*. It's not a perfect analogy but resorting to a well-known phrase from software development, we can say "if it walks like a duck and quacks like a duck, it's a duck", i.e. we don't care about the internal implementation of an object but only about its external representation. So we now understand the "extension" part: the set is determined by its extension (its contents) and not its "intension" (specification how to build it).

1. As per [its own Wikipedia page](https://en.wikipedia.org/wiki/If_and_only_if), *"if and only if"* can be transformed into a two-sentence conjunctive (i.e. two sentences connected with *"and"*). It can be shown that none of the two sentences suffices on its own, we need both. Here is my understanding of each of the constituent sentences:

   1. *"If two sets are equal, then they have the same elements"*

      One might be tempted to say that this is enough to assert equality of two sets. However, listing of the possible values of "equality" of sets yields at least two options: equal and its complement: unequal. Therefore we need to consider also the sentence: *"If two sets are **unequal**, then they have the same elements"*.

      In other words, a sentence *"If two sets are unequal, then they have the same elements"* is not prohibited logically by the first statement alone. To use an analogy, a sentence "If an animal is a mammal, then it has eyes" doesn't mean there are no representatives of other classes of animals that have eyes. For example birds have eyes too, so we can also say "If an animal is a bird, then it has eyes". As I understand this sentence alone, it only gives us one class of objects that possess the property of having the same elements.


   2. *"If two sets have the same elements, then they are equal"*

      Similarly to the first sentence but in the other direction, this sentence doesn't rule out a possibility that there are sets that don't have the same elements but are equal. That is, one can also say *"If two sets **don't** have the same elements, then they are equal"*.

      To use the previous analogy, this is like saying *"If an animal has hoofs, then it is a mammal"*. That doesn't mean there are no other properties of mammals. For example we can also characterize mammals with *"If an animal nurses the young on its milk, then it is a mammal"*. In my understanding, this sentence on its own gives only one property of the equality of sets. There could be more properties that equal sets have.

   Only when we combine the two sentences with "and" (or, to use a shorthand, with "if and only if"), can we express the original sentence (the axiom of extension) which uniquely characterizes what it means for sets to be equal. To relate again to the world of animals, we might say "An animal is a mammal if and only if it nurses the young on its milk".

   After I understood the logical meaning of *"if and only if"*, I started applying this logic to other sentences I saw around me to make sure that I understand them or see if they are worded perhaps a bit sloppily and do not stand up to scrutiny. I think I found one such phrasing below.

   Consider the following sentence (which I came across in a maths book): *"Set A is a subset of set B if all elements of set A are also elements of set B"*. Is *"if"* a necessary and sufficient condition for this sentence to be true? Given that I don't have a strong intuition or fluency with *"if"*, *"only if"* and *"if and only if"*, for me the first step would be to reword (rearrange) the sentence into an equivalent statement of *"If all elements of set A are also elements of set B, then set A is a subset of set B"*. This ordering is how it would be expressed in most programming languages and is more natural to me. If we refer to bullet point #1 above and accept its conclusion, it seems that this sentence doesn't exclude sentences such as *"If not all elements of set A are also elements of set B, then set A is a subset of set B"* or even *"If no elements of set A are elements of set B, then set A is a subset of set B"*. We also need the implication in the other direction, i.e. *"If set A is a subset of a set B, then all elements of set A are also elements of set B"*.

1. I don't have an answer as to why this needs to be stated as an axiom and the first one to boot in the theory. I assume there are good reasons for it such as that without it the theory would not be consistent or there would be paradoxes in it or some other grave situation would potentially arise. Let's not forget that mathematicians are a picky and inquisitive bunch and they would probably find a hole in the theory if this axiom was not included. Maybe they already did and this axiom is the result of such inquiry? Or perhaps it's simply there to state this obvious fact as axioms frequently do? I might have an answer once I finish this short and interesting book.

To sum it up, I wanted to show how trying to dissect a seemingly simple statement might actually lead to other, unrelated (serendipitous) learnings. It's not important whether the original statement we are analyzing is deep or trivial and that it might be obvious to someone else. What matters is that we have reduced our ignorance, increased our knowledge of logic and this will pay off in perhaps yet unknown ways. Such a simple and easy win might also encourage us to do more of such inquiries in the future and the benefits of those will only compound over time.
