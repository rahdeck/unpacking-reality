+++
title = "Confusing world of Japanese near-homophones"
slug = "2019-05-09-confusing-world-of-japanese-near-homophones"
published = 2019-05-09T18:08:00.002000-07:00
author = "rahdeck"
tags = []
+++
I still remember how hard it was (and still is!) to learn to
differentiate some Japanese words from each other. There are tons of
words in Japanese that sound almost but not exactly the same, differing
only subtly by the vowels used in them. I guess you could call them
near-homophones (or near identical sounding). Knowing only Indo-European
languages, in which it's mostly the consonants that differentiate words
from one another, my brain has a hard time adjusting to such amount of
very similar words where the only differences are the vowels.  
  
For example, here's a list of existing Japanese words made up of a "k"
syllable (ka, ki, ku, ke, ko) followed by an "r" syllable (ra, ri, ru,
re, ro) with "i" appended to the end:  
  
﻿

1.  [からい](https://jisho.org/search/%E3%81%8B%E3%82%89%E3%81%84%23word)
    (karai)
2.  [かるい](https://jisho.org/search/%E3%81%8B%E3%82%8B%E3%81%84%23word)
    (karui)
3.  [かれい](https://jisho.org/search/%E3%81%8B%E3%82%8C%E3%81%84%23word)
    (karei)
4.  [きらい](https://jisho.org/search/%E3%81%8D%E3%82%89%E3%81%84%23word)
    (kirai)
5.  [きるい](https://jisho.org/search/%E3%81%8D%E3%82%8B%E3%81%84%23word)
    (kirui)
6.  [きれい](https://jisho.org/search/%E3%81%8D%E3%82%8C%E3%81%84%23word)
    (kirei)
7.  [くらい](https://jisho.org/search/%E3%81%8F%E3%82%89%E3%81%84%23word)
    (kurai)
8.  [くるい](https://jisho.org/search/%E3%81%8F%E3%82%8B%E3%81%84%23word)
    (kurui)
9.  [くれい](https://jisho.org/search/%E3%81%8F%E3%82%8C%E3%81%84%23word)
    (kurei)
10. [くろい](https://jisho.org/search/%E3%81%8F%E3%82%8D%E3%81%84%23word)
    (kuroi)
11. [けらい](https://jisho.org/search/%E3%81%91%E3%82%89%E3%81%84%23word)
    (kerai)
12. [こらい](https://jisho.org/search/%E3%81%93%E3%82%89%E3%81%84%23word)
    (korai)
13. [こるい](https://jisho.org/search/%E3%81%93%E3%82%8B%E3%81%84%23word)
    (korui)
14. [これい](https://jisho.org/search/%E3%81%93%E3%82%8C%E3%81%84%23word)
    (korei)

Some of those words create pairs that are just asking for embarassing
mistakes such as "kirei" (clean, beautiful) and "kirai" (disgusting,
hated, disliked) (which fortunately are very popular so after a while
the difference should finally sink in). Such a slip of tongue might be
hard to recover from in certain situations, hopefully your audience will
be forgiving :-)  
  
I generated all 20 possible k\*r\*i words (I excluded all 5 "k\*rii"
words as they don't sound like they exist, though I could be wrong) with
a simple shell loop and looked them up on jisho.org. Out of the 20
words, 14 turned out to actually exist as listed above. Here's the
command I used:  
  

    for prefix in 'か' 'き' 'く' 'け' 'こ'
    do
        for suffix in 'ら' 'る' 'れ' 'ろ'
        do
            word=${prefix}${suffix}"い"
            xdg-open "https://jisho.org/search/${word}%23word"
        done
    done

  
This is just a tip of the iceberg. Japanese is actually full of not
"just" near-homophones but full-on homophones. There are literally
thousands of pairs, triplets, quadruplets and higher-cardinality tuples
of homophones.
