-- | Common code needed by test modules.
-- author: Prem Muthedath

module Common where

-- | replace all occurences of a character with supplied replacement string.
replace :: Char -> String -> String -> String
replace char repl = concatMap (\x -> if x == char then repl else [x])

-- | return string as single-spaced words.
singleSpaced :: String -> String
singleSpaced = unwords . words

-- | returns True if string has stated word count.
hasWordCount :: String -> Int -> Bool
hasWordCount str count = length (words str) == count


