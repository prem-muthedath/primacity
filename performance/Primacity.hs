{-# LANGUAGE ScopedTypeVariables #-}

-- | test code to spot module-location performance problem (see ./Main.main).
-- orig author: /u/ Siddhanathan @ https://goo.gl/Yv4XMh (stackoverflow).
-- Prem Muthedath: spotted problem, designed test.
-- this code is also @ https://pastebin.com/mBevWnT4
--
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
  where isPrime_ :: i -> [i] -> Bool
        isPrime_ m [] = isPrime_ m primes   -- this case should never happen
        isPrime_ m (p:ps)
            | p * p > m      = True
            | m `mod` p == 0 = False
            | otherwise      = isPrime_ m ps

primes :: (Integral i) => [i]
primes = 2 : filter isPrime [3,5..]

primeFactors :: forall i. Integral i => i -> [i]
primeFactors n = factors n primes
  where factors :: i -> [i] -> [i]
        factors m [] = factors m primes     -- this case should never happen
        factors m (x:xs)
            | x * x > m      = [m]
            | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
            | otherwise      = factors m xs

primacity :: (Integral i) => i -> Int
primacity = length . nub . primeFactors

primacityCount :: (Integral i) => [i] -> Int -> Int
primacityCount x k = length . filter (== k) . fmap primacity $ x

df :: IO ()
df = do
  let a :: Int = 2
      b :: Int = 10000000
      k :: Int = 1
      n = primacityCount [a..b] k
  putStrLn $ show n


