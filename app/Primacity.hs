{-# LANGUAGE ScopedTypeVariables #-}

-- | this code solves (fast) the primacity problem in facebook hackathon 2015.
--
--   basically, given 3 positive integers -- A, B, K -- output number of items 
--   in [A, B] with primacity K.  For example, if A=5, B=15, K=2, the program 
--   will output 5 -- i.e., 5 numbers in [5, 15] have primacity 2.
--
--   NOTE: we must always have 2 <= A <= B, K >= 1.
--
--   EXECUTION STEPS:
--   1. the program first prompts the user for "number of questions", which we 
--      call as `n`.  `n` can be any positive integer (i.e., 1, 2, 3, etc.).
--   2. the program then prompts the user `n` times for values of A, B, K.
--   3. after each A-B-K input, the program spits out the number of items in [A, 
--      B] with primacity K.
--
--   for details, see ~/software-development/notes/facebook-hackathon-2015.pages
--
--   author & source: /u/ Siddhanathan @ https://goo.gl/Yv4XMh (stackoverflow).
--   prem: fixed issues raised by ghc warnings -- 11 MAR 2021.

-- NOTE:
--  with base-4.8, Prelude re-exports a few more entities from modules such as 
--  Data.Monoid and Control.Applicative, which makes below 2 imports in the 
--  original code redundant.
--  REF: see https://gitlab.haskell.org/ghc/ghc/-/wikis/migration/7.10
--  import Control.Applicative ( pure, (<$>) )
--  import Data.Monoid         ( (<>) )

module Primacity where

import Data.List           ( nub )

isPrime :: forall i. Integral i => i -> Bool
isPrime n = isPrime_ n primes
  -- prem: + type-signature, [] pattern match
  where isPrime_ :: i -> [i] -> Bool
        isPrime_ m [] = isPrime_ m primes
        isPrime_ m (p:ps)
            | p * p > m      = True
            | m `mod` p == 0 = False
            | otherwise      = isPrime_ m ps

primes :: (Integral i) => [i]
primes = 2 : filter isPrime [3,5..]

primeFactors :: forall i. Integral i => i -> [i]
primeFactors n = factors n primes
  -- prem: + type-signature, [] pattern match
  where factors :: i -> [i] -> [i]
        factors m [] = factors m primes
        factors m (x:xs)
            | x * x > m      = [m]
            | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
            | otherwise      = factors m xs

primacity :: (Integral i) => i -> Int
primacity = length . nub . primeFactors

primacitys :: [(Int, Int, Int)] -> [Int]
primacitys xs = map (\x -> go x) xs
  where go :: (Int, Int, Int) -> Int
        go (a, b, k) = length . filter (== k) . fmap primacity $ [a..b]

user :: IO Int
user = do
  putStrLn "please input positive integers a, b, k, such that 2 <= a <= b and k >= 1, in the format: a b k"
  xs <- getLine
  -- pattern type signatures require `ScopedTypeVariables`; see /u/ jacob wang @ 
  -- https://tinyurl.com/2v2fx8d7 (so)
  let a :: Int = read . takeWhile (/=' ') . dropN 0 $ xs
  let b :: Int = read . takeWhile (/=' ') . dropN 1 $ xs
  let k :: Int = read . takeWhile (/=' ') . dropN 2 $ xs
  let n = head $ primacitys [(a, b, k)]
  -- let n = length . filter (== k) . fmap primacity $ [a..b]
  pure n
    -- prem: + dropN type-signature
    where dropN :: Int -> [Char] -> [Char]
          dropN 0 = id
          dropN n = dropN (pred n) . drop 1 . dropWhile (/= ' ')

printNTimes :: Int -> Int -> IO ()
printNTimes 0 _ = pure ()
printNTimes n total = do
  ans <- user
  putStr $ "Case #" <> show (total - n + 1) <> ": "
  putStrLn $ show ans
  printNTimes (pred n) total

defaultMain :: IO ()
defaultMain = do
  putStrLn "please input a positive integer n -- the number of 'questions'"
  -- pattern type signatures require `ScopedTypeVariables`; see /u/ jacob wang @ 
  -- https://tinyurl.com/2v2fx8d7 (so)
  n :: Int <- read <$> getLine
  printNTimes n n


