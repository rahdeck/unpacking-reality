#!/bin/bash

dot -Tpng <(cat <<EOF
graph {
  node [shape=none]
  "." -- 4;
  "." -- 5;
  "." -- 6;
  6 -- 1;
  6 -- 2;
  6 -- 3;
}
EOF
) -o images/exploding-dice-probabilities-graph-01.png

dot -Tpng <(cat <<EOF
graph {
  node [shape=none]
  "." -- 6;
  6 -- 4;
  6 -- 5;
  62 [label="6"];
  6 -- 62;
  62 -- 1;
  62 -- 2;
  62 -- 3;
}
EOF
) -o images/exploding-dice-probabilities-graph-02.png

dot -Tpng <(cat <<EOF
graph {
  node [shape=none]
  "." -- 6;
  62 [label="6"];
  6 -- 62;
  62 -- "...";
  63 [label="6"];
  "..." -- 63;
  63 -- 4;
  63 -- 5;
  64 [label="6"];
  63 -- 64;
  64 -- 1;
  64 -- 2;
  64 -- 3;
}
EOF
) -o images/exploding-dice-probabilities-graph-03.png
