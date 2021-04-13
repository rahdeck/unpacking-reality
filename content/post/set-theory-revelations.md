---
title: "Revelations of set theory"
#published: 2020-09-01:29:00.003000-08:00
author: "rahdeck"
draft: true
---

When reading math books, sets jump at you from every corner (well, every page). A lot of mathematical concepts are expressed in terms of sets or operations on sets (functions, relations). Set theory is often considered the foundation of mathematics, which is kind of interesting as it's a rather young concept, invented in 19th century, certainly much younger than mathematics itself. It turns out that what most of us learn about sets is something the mathematicians call "naive set theory". "Naive" is not an offensive term, is not synonymous with 'easy' but rather its use emphasizes the non-axiomatic basis of the theory (I guess "naive" being related to folk wisdom or based on observation rather than solid principles). This naive set theory is sufficient for most math applications and its laws are mostly the same as those of the axiomatic theory (as far as I can tell). What is strange to a novice's (like myself) mind is that there is no single axiomatic set theory, but multiple ones, though one of them, called Zermelo-Fraenkel seth theory (abbreviated to ZF) seems to be the most commonly accepted one (as you can see maths be be a contentious field too).

After this introduction I need to clarify that set theory is not the main focus of this post but rather I will use it to exemplify how careful reading of *any* theory can expand your understanding of a given topic and, in my specific case, lead to serendipitious learning. The requirement is that we actually read texts carefully, especially axioms or other bolded out sentences (therefore presumably important) and understand what the author is saying and why they're saying it. It can be also instructive to try and say something slightly different, twist the author's words or skip certain words and explore the implications. If the conclusion is unchanged, then perhaps we don't fully understand or correctly interpret the text or maybe the author was a bit sloppy with their wording. Though I wouldn't expect that the axioms of set theory are worded sloppily as it is probably one of the most important and most examined theories of mathematics. Anyway, let me show you my own process of reading just a single axiom of the ZF set theory and what I've learnt from it, as I was reading Paul Halmos's "Naive set theory".

The first axiom in the book, axiom of extension, is presented as follows:

```
Two sets are equal if and only if they have the same elements.
```

After I first read it I had the following questions:

1. Why is there a need at all to state something so seemingly obvious and even choose it as the first axiom of your theory?
1. What is "extension" in the name of the axiom?
1. Why does it say "if and only if" and not just "if" or "only if"?

All these are valid questions and the author answers them but I felt like I needed some additional re-inforcement of the answers to plant them more firmly and more permanently in my mind.

The answer to the first question is 


"If and only if" can be transformed into a two-sentence conjunctive (two sentences connected with "and"). It can be shown that none of the two sentences suffices on its own, we need both. Here is my understanding of each of the constituent sentences:

1. "If two sets are equal, then they have the same elements".

One might be tempted to say that this is enough to assert equality of two sets. However, enumeration of the possible values of "equality" of sets gives us at least two options: equal and unequal. Therefore we need to consider also the sentence: "If two sets are **unequal**, then they have the same elements". In other words, a sentence "If two sets are unequal, then they have the same elements" is not prohibited logically by the first statement statement alone. To use an analogy, a sentence "If an animal nurses the young on its milk, then it is a mammal" doesn't mean that other characteristics of mammals don't exist. There exist other possible sentences, such as "If an animal has hoofs, then it is a mammal" or "If an animal can talk, then it is a mammal" that can also qualify (non-uniquely) a mammal. In my understanding, this sentence on its own gives only one property of the equality of sets. There could be more properties that equal sets have, but as it happens, they don't.

2. "If two sets have the same elements, then they are equal".

Similarly to the first sentence but in the other direction, this sentence doesn't rule out a possibility that there are sets that don't have the same elements but are equal. That is, one can also say "If two sets don't have the same elements, then they are equal". To use the previous analogy, this is like saying "If an animal is a mammal, then it has horns". That doesn't mean there are no representatives of other classes of animals that have horns. For example birds might have horns, so we can also say "If an animal is a bird, then it has horns".

Only when we combine the two sentences with "and" (or, to use a shorthand, with "if and only if"), can we express the original sentence (the axiom of extension) which uniquely characterizes what it means for sets to be equal. To relate again to the world of animals, we might say "An animal is a mammal if and only if it nurses the young on its milk".


Consider the following sentence (which I came across in a maths book): "Set A is a subset of set B if all elements of set A are also elements of set B". Is "if" a necessary and sufficient condition for this sentence to be true? Given that I don't have a strong intuition or fluency with "if", "only if" and "if and only if", for me the first step would be to reword (rearrange) the sentence into an equivalent statement of "If all elements of set A are also elements of set B, then set A is a subset of set B". This ordering is how it would be expressed in most programming languages and is more natural to me. If we refer to bullet point #1 above and accept its conclusion, it seems that this sentence doesn't exclude sentences such as "If not all elements of set A are also elements of set B, then set A is a subset of set B" or even "If no elements of set A are elements of set B, then set A is a subset of set B". We also need the implication in the other direction, i.e. "If set A is a subset of a set B, then all elements of set A are also elements of set B".
