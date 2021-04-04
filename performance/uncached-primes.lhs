-- | ghci debug output for ./Primacity.hs with polymorphic `primes`.
-- goal: we want to test if haskell caches polymorphic `primes`.
-- result: no caching whatsoever, including in recursive calls, of `primes`.
-- author: Prem Muthedath, 03 APR 2021.
-- *****************************************************************************
*Primacity λ ▶▶ :step primacityCount [29,53] 1
Stopped in Primacity.primacityCount, Primacity.hs:52:22-64
_result :: Int = _
k :: Int = 1
x :: [Integer] = [29,53]
[Primacity.hs:52:22-64] 
*Primacity λ ▶▶ :list
51  primacityCount :: (Integral i) => [i] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:22-64] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:22-60
_result :: [i] -> Int = _
k :: Int = 1
[Primacity.hs:52:22-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: (Integral i) => [i] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:22-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:31-60
_result :: [i] -> [Int] = _
k :: Int = 1
[Primacity.hs:52:31-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: (Integral i) => [i] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:31-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:31-43
_result :: [Int] -> [Int] = _
k :: Int = 1
[Primacity.hs:52:31-43] 
*Primacity λ ▶▶ :list
51  primacityCount :: (Integral i) => [i] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:31-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:47-60
_result :: [i] -> [Int] = _
[Primacity.hs:52:47-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: (Integral i) => [i] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:47-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacity, Primacity.hs:49:13-39
_result :: i -> Int = _
[Primacity.hs:49:13-39] 
*Primacity λ ▶▶ :list
48  primacity :: (Integral i) => i -> Int
49  primacity = length . nub . primeFactors
50   
[Primacity.hs:49:13-39] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacity, Primacity.hs:49:22-39
_result :: i -> [i] = _
[Primacity.hs:49:22-39] 
*Primacity λ ▶▶ :list
48  primacity :: (Integral i) => i -> Int
49  primacity = length . nub . primeFactors
50   
[Primacity.hs:49:22-39] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors, Primacity.hs:40:18-33
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
n :: Integer = 29                                           -- begin 29 is prime (1st time).
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :list
39  primeFactors :: forall i. Integral i => i -> [i]
40  primeFactors n = factors n primes
41    where factors :: i -> [i] -> [i]
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 29
x :: Integer = _
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: i = _
x :: i = _
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 29
x :: Integer = 2
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 29
x :: Integer = 2
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 29
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3                                            -- begin 3 is prime for 29 (1st time).
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- done 3 is prime for 29 (1st time).
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 29
x :: Integer = 3
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 3
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 29
x :: Integer = 3
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 29
x :: Integer = 3
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 29
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 5                                            -- begin 5 is prime for 29 (1st time).
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 5
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 5
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- prime 3 done again for 5 in 29.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 5                                            -- done 5 is prime for 29 first time.
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 29
x :: Integer = 5
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 5
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 29
x :: Integer = 5
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 29
x :: Integer = 5
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 29
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 7                                            -- begin 7 is prime for 29 1st time.
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 7
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 7
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 7
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 7
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- 3 prime? done again for 7 in 29.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 7 is prime for 29 (first time).
m :: Integer = 7
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 29
x :: Integer = 7
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 7
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:32-34
_result :: [Integer] = _
m :: Integer = 29                                           -- 29 is prime (first time) done.
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors, Primacity.hs:40:18-33
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
n :: Integer = 53                                           -- begin 53 is prime (1st time).
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :list
39  primeFactors :: forall i. Integral i => i -> [i]
40  primeFactors n = factors n primes
41    where factors :: i -> [i] -> [i]
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 53
x :: Integer = _
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: i = _
x :: i = _
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 53
x :: Integer = 2
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 53
x :: Integer = 2
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 53
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- 3 is prime done again for 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 53
x :: Integer = 3
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 3
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 53
x :: Integer = 3
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 53
x :: Integer = 3
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 53
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 5
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 5                                            -- 5 is prime done again for 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 5
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- 3 is prime done again for 5 (in 53).
m :: Integer = 3
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 5
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 53
x :: Integer = 5
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 5
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 53
x :: Integer = 5
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 53
x :: Integer = 5
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 53
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 7
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 7                                            -- 7 is prime done again for 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 7
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 7
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 7
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- 3 is prime done again for 7 in 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 7
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Integer = 53
x :: Integer = 7
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 7
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Integer = 53
x :: Integer = 7
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Integer = _
m :: Integer = 53
x :: Integer = 7
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Integer] = _
factors :: Integer -> [Integer] -> [Integer] = _
m :: Integer = 53
xs :: [Integer] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47   
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 9                                            -- begin 9 is prime for first time (for 53).
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 9
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 9
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 9
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 9
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- 3 is prime done again for 9 in 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 9
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _                                         -- done 9 is not prime (1st time) for 53.
m :: Integer = 9
p :: Integer = 3
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 9
p :: Integer = 3
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:32-36
_result :: Bool = _
[Primacity.hs:33:32-36] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:32-36] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 11                                           -- begin 11 is prime for first time for 53.
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 11
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 11
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 11
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 11
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 3                                            -- 3 is prime doen again for 11 in 53.
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 11
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 11
p :: Integer = 3
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 11
p :: Integer = 3
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 11
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 5
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- 5 is prime done again for 11 in 53.
m :: Integer = 5
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Integer = _
m :: Integer = 5
p :: Integer = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
m :: Integer = 5
ps :: [Integer] = _
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35   
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [i] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Integer -> [Integer] -> Bool = _
n :: Integer = 3
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: forall i. Integral i => i -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: i -> [i] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [i] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: (Integral i) => [i]
37  primes = 2 : filter isPrime [3,5..]
38   
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- 3 is prime done again for 5 for 11 in 53.
m :: Integer = 3
p :: Integer = _
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: i = _
p :: i = _
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Integer = 5
p :: Integer = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 11 is prime for first time for 53.
m :: Integer = 11
p :: Integer = 5
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Integer = _
p :: Integer = 5
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:32-35
_result :: Bool = _
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:32-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _                                         -- done 53 is prime for first time.
m :: Integer = 53
x :: Integer = 11
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Integer = _
x :: Integer = 11
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:32-34
_result :: [Integer] = _
m :: Integer = 53
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :step
2

*Primacity λ ▶▶ :list
Not stopped at a breakpoint; nothing to list
