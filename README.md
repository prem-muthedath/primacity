#### Primacity
Siddanathan's primacity algorithm (based on facebook hackathon).

Source: https://goo.gl/Yv4XMh (stackoverflow)

Prem Muthedath: author of all test code, error handling, cabal packaging, docs.

Basically, given 3 positive integers -- A, B, K -- output number of integers in 
[A, B] with primacity K, where primacity of an integer is the number of distinct 
primes (>1) that divide it.  For example, if A=5, B=15, K=2, the program will 
output 5 -- i.e., 5 integers in [5, 15] have primacity 2.

NOTE: we must always have `2 <= A <= B, K >= 1`.

EXECUTION STEPS (interactive mode):
  1. the program first prompts the user for "number of questions", which we call 
     as `n`.  `n` can be any positive integer (i.e., 1, 2, 3, etc.).
  2. the program then prompts the user `n` times for values of A, B, K.
  3. after each A-B-K input, the program spits out the number of items in [A, B] 
     with primacity K.

HOW TO RUN THE PROGRAM AND TESTS:
  1. `cd` to `primacity` -- the top directory containing this `README` file.
  2. to run in interactive mode, type below command and press `RETURN`:
        - `cabal v2-run :primacity`
  3. to non-interactively run all tests (this takes a while), type below command 
     & press `RETURN`:
        - `cabal v2-run :primacity-test`


