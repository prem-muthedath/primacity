#### Primacity
Siddanathan's primacity algorithm (based on facebook hackathon).

Source: https://goo.gl/Yv4XMh (stackoverflow)

Basically, given 3 positive integers -- A, B, K -- output number of item in [A, 
B] with primacity K.  For example, if A=5, B=15, K=2, the program will output 5 
-- i.e., 5 numbers in [5, 15] have primacity 2.

NOTE: we must always have `2 <= A <= B, K >= 1`.

EXECUTION STEPS:
  1. the program first prompts the user for "number of questions", which we call 
     as `n`.  `n` can be any positive integer (i.e., 1, 2, 3, etc.).
  2. the program then prompts the user `n` times for values of A, B, K.
  3. after each A-B-K input, the program spits out the number of items in [A, B] 
     with primacity K.


