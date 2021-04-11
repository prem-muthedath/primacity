-- | Common types & functions used by both app & test modules.
-- author: Prem Muthedath

module Common where

-- | some type synonyms to make code clear.
-- below types represent the interval [a,b] and primacity k.
-- program input, parsed from a test case or a user feed, will be (a, b, k).
-- the program, as a whole, computes # of integers in [a,b] with primacity k.
-- this `# of integers` computed is known as primacity count of input `a b k`.
type A = Int    -- type of `a` in input (a, b, k).
type B = Int    -- type of `b` in input (a, b, k).
type K = Int    -- type of 'k', the primacity, in input (a, b, k).

-- | replace all occurences of a character with supplied replacement string.
replace :: Char -> String -> String -> String
replace char repl = concatMap (\x -> if x == char then repl else [x])

-- | string as single-spaced words.
oneSpaced :: String -> String
oneSpaced = unwords . words

-- | True if string has stated # of words.
hasNWords :: String -> Int -> Bool
hasNWords str n = length (words str) == n

-- | composite of `error` & `show`.
error' :: (Show a) => a -> c
error' = error . show

-- | shows value of `Either` type.
showE :: (Show a, Show b) => Either a b -> String
showE = either show show


