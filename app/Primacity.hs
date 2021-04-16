{-# LANGUAGE ScopedTypeVariables #-}

-- | Primacity module -- contains all code for primacity calculations.
-- author : /u/ Siddhanathan @ https://counto.gl/Yv4XMh (stackoverflow).
-- Prem Muthedath: performance fix, error handling, doc, cabal packaging.

-- this code solves (fast) the primacity problem in facebook hackathon 2015. for 
-- details, see ~/software-development/notes/facebook-hackathon-2015.pages

-- basically, given 3 positive integers -- A, B, K -- output number of items in 
-- [A, B] with primacity K, where primacity of an integer is the number of 
-- distinct primes (>1) that divide it. For example, if A=5, B=15, K=2, the 
-- program will output 5 -- i.e., 5 numbers in [5, 15] have primacity 2.
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
--       dependency issue. for example, above test case now runs in ~ 18 secs 
--       whether or not `primacityCounts.count` is called from this module.
--
--       /u/ ski @ #haskell diagonized this problem and recommended solutions.
--
-- NOTE:
--  1. pattern type signatures (examples: `let x :: Int = ...`, `x :: Int <- 
--     getLine`) require `ScopedTypeVariables`; see /u/ jacob wang @ 
--     https://tinyurl.com/2v2fx8d7 (so)
--  2. with base-4.8, Prelude re-exports a few more entities from modules such 
--     as Data.Monoid and Control.Applicative, which makes below 2 imports in 
--     the original code redundant.
--     REF: see https://gitlab.haskell.org/ghc/ghc/-/wikis/migration/7.10
--  import Control.Applicative ( pure, (<$>) )
--  import Data.Monoid         ( (<>) )

module Primacity (
                  defaultMain,
                  primacityCounts
                 ) where

import Data.List  ( nub )
import Text.Read (readMaybe)

import Common (A, B, K, oneSpaced, hasNWords, showE)
import UserErrors

-- | True if number is a prime.
isPrime :: Int -> Bool
isPrime n = isPrime_ n primes
  -- prem: + type-signature, [] pattern match
  where isPrime_ :: Int -> [Int] -> Bool
        isPrime_ m [] = isPrime_ m primes     -- this case should never happen.
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
        factors m [] = factors m primes       -- this case should never happen.
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
primacityCounts :: [(A, B, K)] -> [Either UserError Int]
primacityCounts = map (\x -> count x)
  where count :: (A, B, K) -> Either UserError Int
        count (a, b, k)
            | inRange   = Right $ length . filter (== k) . fmap primacity $ [a..b]
            | otherwise = Left $ ABKRangeError (a, b, k)
            where inRange :: Bool
                  inRange = and [(2 <= a), (a <= b), (k >= 1)]

-- | all code from this point on is part of interactive mode. ------------------

-- | user feed "a b k" as a 3-tuple.
userFeed :: String -> Either UserError (A, B, K)
userFeed xs = do
  ys :: String    <- format
  zs :: (A, B, K) <- feed ys
  return zs
  where format :: Either UserError String
        format | xs `hasNWords` 3 = Right $ oneSpaced xs
               | otherwise        = Left $ FormatError xs
        feed :: String -> Either UserError (A, B, K)
        feed ys = do
            a :: A <- read' . takeWhile (/=' ') . dropN 0 $ ys
            b :: B <- read' . takeWhile (/=' ') . dropN 1 $ ys
            k :: K <- read' . takeWhile (/=' ') . dropN 2 $ ys
            return (a, b, k)
        dropN :: Int -> [Char] -> [Char]    -- prem: + dropN type-signature
        dropN 0 = id
        dropN n = dropN (pred n) . drop 1 . dropWhile (/= ' ')

-- | prompts user for `a b k` & computes primacity count in [a..b] for k.
-- see /u/ hammar @ https://tinyurl.com/k4fkyykk for IO-Maybe mix using <$>.
user :: IO (Either UserError Int)
user = do
  putStrLn "please enter integers a, b, k, where 2 <= a <= b and k >= 1, in the format: a b k"
  n :: Either UserError Int <- pcount <$> getLine
  pure n
  where pcount :: String -> Either UserError Int
        pcount ys = do
            ufeed :: (A, B, K) <- userFeed ys
            n :: Int <- head $ primacityCounts [ufeed]
            return n

-- | calls `user` `n` times; formats & prints result after each call.
printNTimes :: Int -> IO ()
printNTimes n = do
  putStrLn $ "thank you. i will now prompt you " <> show n <> " time(s) for data."
  printNTimes' n n
  where printNTimes' :: Int -> Int -> IO ()
        printNTimes' 0 _     = pure ()
        printNTimes' m total =
          do ans :: Either UserError Int <- user
             putStr $ "Case #" <> show (total - m + 1) <> ": "
             putStrLn $ showE ans
             printNTimes' (pred m) total

-- | reads string as Int.
-- author: Prem Muthedath.
read' :: String -> Either UserError Int
read' xs = case readMaybe xs :: Maybe Int of
                Just x    -> Right x
                Nothing   -> Left $ NotIntError xs

-- | start of interactive mode.
-- prompts user for `no of inputs` and initiates rest of execution sequence.
-- see /u/ hammar @ https://tinyurl.com/k4fkyykk for IO-Maybe mix using <$>.
defaultMain :: IO ()
defaultMain = do
  putStrLn "hi, how many 'questions' do you have?  please enter an integer >= 1."
  n :: Either UserError Int <- read' <$> getLine
  either f g n
  where f :: UserError -> IO ()
        f = putStrLn . show
        g :: Int -> IO ()
        g b | b >= 1    = printNTimes b
            | otherwise = putStrLn . show $ Below1Error b

