-- | QuickCheck properties.
-- author: Prem Muthedath

module Properties where

import Primacity (primeFactors)

-- | check if product of prime factors is indeed equal to the number.
factorsProduct :: Int -> Bool
factorsProduct  n = n == product (primeFactors n)

-- | check if factors are all primes.
factorsPrime :: Int -> Bool
factorsPrime n = let a = [(x, y) | x <- primeFactors n, y <- [2..(x-1)]]
                     b = [ a1 | (a1, b1) <- a, a1 `mod` b1 == 0 ]
                 in b == []

