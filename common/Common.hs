-- | Common types & functions used by both app & test modules.
-- author: Prem Muthedath

module Common where

-- | some type synonyms to make code clear.
-- below types represent the interval [a,b] and primacity k.
-- a typical external input, say a test case or a user input, will be `a b k`.
-- the program, as a whole, computes # of integers in [a,b] with primacity k.
-- this `# of integers` computed is known as primacity count of input `a b k`.
type A = Int    -- represents `a` in the typical input.
type B = Int    -- represents `b` in the typical input.
type K = Int    -- represents 'k', the primacity, in the typical input.

-- | replace all occurences of a character with supplied replacement string.
replace :: Char -> String -> String -> String
replace char repl = concatMap (\x -> if x == char then repl else [x])

-- | string as single-spaced words.
oneSpaced :: String -> String
oneSpaced = unwords . words

-- | True if string has stated # of words.
hasNWords :: String -> Int -> Bool
hasNWords str n = length (words str) == n


