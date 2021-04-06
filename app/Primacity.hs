{-# LANGUAGE ScopedTypeVariables #-}

-- | Primacity module -- contains all code for primacity calculations.
-- author : /u/ Siddhanathan @ https://counto.gl/Yv4XMh (stackoverflow).
-- Prem Muthedath: performance fix, error checks, doc, cabal packaging.

-- this code solves (fast) the primacity problem in facebook hackathon 2015. for 
-- details, see ~/software-development/notes/facebook-hackathon-2015.pages

-- basically, given 3 positive integers -- A, B, K -- output number of items in 
-- [A, B] with primacity K.  For example, if A=5, B=15, K=2, the program will 
-- output 5 -- i.e., 5 numbers in [5, 15] have primacity 2.
--
--  NOTE: we must always have 2 <= A <= B, K >= 1.
--
--  EXECUTION STEPS (interactive mode):
--    1. the program first prompts user for "number of questions", which we call 
--       as `n`.  `n` can be any positive integer (i.e., 1, 2, 3, etc.).
--    2. the program then prompts user `n` times for values of A, B, K.
--    3. after each A-B-K input, the program spits out the number of items in 
--       [A, B] with primacity K.
--
--  CHANGES (by Prem Muthedath):
--    1. fixed issues raised by ghc warnings -- 11 MAR 2021.
--    2. changed all polymorphic type signatures to concrete ones.  reason: 
--       polymorphic `primes` does not cache, sp every `primes` call, including 
--       recursive calls, re-computes primes already found -- see ghci debug 
--       output, primacity/performance/uncached-primes.lhs.
--
--       one consequence of this problem is that performance is badly hampered 
--       for large inputs (say, [2..10000000], primacity=1) if 
--       `primacityCounts.count` is called from another module.
--
--       see https://pastebin.com/mBevWnT4 for actual code that demonstrates 
--       this module-dependency problem.
--
--       `primacityCounts` did not exist in the original code. i wrote it as a 
--       hack to solve the module-dependency performance problem. surprisingly, 
--       for yet unclear reasons, either because of inlining or specialization, 
--       if `primacityCounts` located in this module is called, haskell computes 
--       above test case in about ~18 secs, whether or not the call is made from 
--       this module!  moreover, as long as we call `primacityCounts`, this 
--       timing is same whether or not `primes` is polymorphic! for actual data, 
--       see primacity/performance/test-run-timings.lhs.

--       though `primacityCounts` solves the module-dependency problem, it is 
--       only a half measure, since defining `primes` polymorphically is not 
--       good practice (REF: /u/ ski @ #haskell).
--
--       so `primes` is no longer polymorphic. and for rest of the code to type 
--       check, all other functions are also no longer polymorphic.
--
--       with concrete type signatures, haskell caches `primes` for all 
--       computations, including all recursive calls as well as calls made 
--       within `map` in `primacityCounts` (see ghci debug output, 
--       primacity/performance/cached-primes.lhs). this solves the module-
--       dependency issue. for example, above test case now runs in ~ 10 secs 
--       whether or not `primacityCounts.count` is called from this module.
--
--       /u/ ski @ #haskell diagonized this problem and recommended solutions.
--
-- NOTE:
--  with base-4.8, Prelude re-exports a few more entities from modules such as 
--  Data.Monoid and Control.Applicative, which makes below 2 imports in the 
--  original code redundant.
--  REF: see https://gitlab.haskell.org/ghc/ghc/-/wikis/migration/7.10
--  import Control.Applicative ( pure, (<$>) )
--  import Data.Monoid         ( (<>) )

module Primacity (
                  defaultMain,
                  primacityCounts
                 ) where

import Data.List  ( nub )
import Text.Read (readMaybe)

-- | True if number is a prime.
isPrime :: Int -> Bool
isPrime n = isPrime_ n primes
  -- prem: + type-signature, [] pattern match
  where isPrime_ :: Int -> [Int] -> Bool
        isPrime_ m [] = isPrime_ m primes
        isPrime_ m (p:ps)
            | p * p > m      = True
            | m `mod` p == 0 = False
            | otherwise      = isPrime_ m ps

-- | infinite list of primes.
-- not being a function, and not being polymorphic, haskell caches this value.
-- `primes` caching happens for all calls, including recursive ones.
primes :: [Int]
primes = 2 : filter isPrime [3,5..]

-- | all prime factors of a number.
primeFactors :: Int -> [Int]
primeFactors n = factors n primes
  -- prem: + type-signature, [] pattern match
  where factors :: Int -> [Int] -> [Int]
        factors m [] = factors m primes
        factors m (x:xs)
            | x * x > m      = [m]
            | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
            | otherwise      = factors m xs

-- | primacity of a number.
primacity :: Int -> Int
primacity = length . nub . primeFactors

-- | given a list of (a, b, k), computes count of integers within each [a..b] 
-- with primacity `k`, and returns list of all such counts.
-- author: Prem Muthedath.
primacityCounts :: [(Int, Int, Int)] -> [Int]
primacityCounts = map (\x -> count x)
  where count :: (Int, Int, Int) -> Int
        count (a, b, k)
            | inRange   = length . filter (== k) . fmap primacity $ [a..b]
            | otherwise = error $ msg
            where inRange :: Bool
                  inRange = and [(2 <= a), (a <= b), (k >= 1)]
                  msg :: String
                  msg = "bad (a,b,k): " <> show (a,b,k) <> ". i need 2 <= a <= b, k >= 1."


-- | all code from this point part of interactive mode. ------------------------

-- | user feed "a b k" as (a, b, k), a 3-tuple Int.
userFeed :: String -> (Int, Int, Int)
userFeed xs
    | not3Words = error msg
    | otherwise = feed . unwords . words $ xs
    where not3Words :: Bool
          not3Words = length (words xs) /= 3
          feed :: String -> (Int, Int, Int)
          -- pattern type signatures require `ScopedTypeVariables`; see /u/ 
          -- jacob wang @ https://tinyurl.com/2v2fx8d7 (so)
          feed ys = let a :: Int = read' . takeWhile (/=' ') . dropN 0 $ ys
                        b :: Int = read' . takeWhile (/=' ') . dropN 1 $ ys
                        k :: Int = read' . takeWhile (/=' ') . dropN 2 $ ys
                    in (a, b, k)
          msg :: String
          msg = "your input '" <> xs <> "' is not in expected format: a b k"
          -- prem: + dropN type-signature
          dropN :: Int -> [Char] -> [Char]
          dropN 0 = id
          dropN n = dropN (pred n) . drop 1 . dropWhile (/= ' ')

-- | prompts user for `a b k` & computes primacity count in [a..b] for k.
user :: IO Int
user = do
  putStrLn "please enter integers a, b, k, where 2 <= a <= b and k >= 1, in the format: a b k"
  xs <- getLine
  let n = head $ primacityCounts [userFeed xs]
  pure n

-- | calls `user` `n` times; formats & prints result after each call.
printNTimes :: Int -> IO ()
printNTimes 0 = putStrLn "sorry, you do not have any questions."
printNTimes n = do
  putStrLn $ "thank you. i will now prompt you " <> show n <> " time(s) for data."
  printNTimes' n n
  where printNTimes' :: Int -> Int -> IO ()
        printNTimes' 0 _     = pure ()
        printNTimes' m total = do
          ans <- user
          putStr $ "Case #" <> show (total - m + 1) <> ": "
          putStrLn $ show ans
          printNTimes' (pred m) total

-- | reads string as Int; errors on bad conversion.
read' :: String -> Int
read' xs = case readMaybe xs :: Maybe Int of
            Just x    -> x
            Nothing   -> error $ "your input '" <> xs <> "' is not an integer."

-- | start of interactive mode.
-- prompts user for `no of inputs` and initiates rest of execution sequence.
defaultMain :: IO ()
defaultMain = do
  putStrLn "hi, how many 'questions' do you have?  please enter an integer >= 0"
  -- pattern type signatures require `ScopedTypeVariables`; see /u/ jacob wang @ 
  -- https://tinyurl.com/2v2fx8d7 (so)
  n :: Int <- read' <$> getLine
  if n >= 0 then printNTimes n
  else error $ "bad input: " <> show n <> ". i need a number >= 0."


