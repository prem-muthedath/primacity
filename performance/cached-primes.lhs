-- | ghci debug output for ./Primacity.hs with non-polymorphic `primes`.
-- goal: we want to test if haskell caches non-polymorphic `primes`.
-- result: non-polymorphic `primes` always cached, even in all recursive calls.
-- author: Prem Muthedath, 03 APR 2021.
-- NOTE: `primes` & most functions in ./Primacity.hs are polymorphic.  for this
-- test run, we just made `primes` & all functions non-polymorphic, all with
-- Int and/or [Int] type arguments & return values. after this test, 
-- we reverted the changes.
-- *****************************************************************************
*Primacity λ ▶▶  :step primacityCount [29,53] 1 
Stopped in Primacity.primacityCount, Primacity.hs:52:22-64
_result :: Int = _
k :: Int = 1
x :: [Int] = [29,53]
[Primacity.hs:52:22-64] 
*Primacity λ ▶▶ :list
51  primacityCount :: [Int] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:22-64] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:22-60
_result :: [Int] -> Int = _
k :: Int = 1
[Primacity.hs:52:22-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: [Int] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:22-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:31-60
_result :: [Int] -> [Int] = _
k :: Int = 1
[Primacity.hs:52:31-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: [Int] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:31-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:31-43
_result :: [Int] -> [Int] = _
k :: Int = 1
[Primacity.hs:52:31-43] 
*Primacity λ ▶▶ :list
51  primacityCount :: [Int] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:31-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacityCount, Primacity.hs:52:47-60
_result :: [Int] -> [Int] = _
[Primacity.hs:52:47-60] 
*Primacity λ ▶▶ :list
51  primacityCount :: [Int] -> Int -> Int
52  primacityCount x k = length . filter (== k) . fmap primacity $ x
53  
[Primacity.hs:52:47-60] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacity, Primacity.hs:49:13-39
_result :: Int -> Int = _
[Primacity.hs:49:13-39] 
*Primacity λ ▶▶ :list
48  primacity :: Int -> Int
49  primacity = length . nub . primeFactors
50  
[Primacity.hs:49:13-39] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primacity, Primacity.hs:49:22-39
_result :: Int -> [Int] = _
[Primacity.hs:49:22-39] 
*Primacity λ ▶▶ :list
48  primacity :: Int -> Int
49  primacity = length . nub . primeFactors
50  
[Primacity.hs:49:22-39] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors, Primacity.hs:40:18-33
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
n :: Int = 29                                               -- begin 29 is prime (1st time).
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :list
39  primeFactors :: Int -> [Int]
40  primeFactors n = factors n primes
41    where factors :: Int -> [Int] -> [Int]
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:10-35
_result :: [Int] = _
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :list
36  primes :: [Int]
37  primes = 2 : filter isPrime [3,5..]
38  
[Primacity.hs:37:10-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Int = 29
x :: Int = 2
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 2
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 29
x :: Int = 2
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 29
x :: Int = 2
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 29
xs :: [Int] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primes, Primacity.hs:37:14-35
_result :: [Int] = _
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :list
36  primes :: [Int]
37  primes = 2 : filter isPrime [3,5..]
38  
[Primacity.hs:37:14-35] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
n :: Int = 3                                                -- begin 3 is prime for 29 (1st time).
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 3 is prime (first time) for 29.
m :: Int = 3
p :: Int = 2
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 2
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
m :: Int = 29
x :: Int = 3
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 3
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 29
x :: Int = 3
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 29
x :: Int = 3
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 29
xs :: [Int] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
n :: Int = 5                                                -- begin 5 is prime for 29 (1st time).
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 5
p :: Int = 2
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 2
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Int = 5
p :: Int = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 5
p :: Int = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
closurePtrs: Cannot handle type TSO yet
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
m :: Int = 5
ps :: [Int] = 3 : _                                         -- prime 3 cached for 5 in 29, no isPrime.
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35  
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 5 is prime for 29 (first time).
m :: Int = 5
p :: Int = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 3
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
m :: Int = 29
x :: Int = 5
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 5
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 29
x :: Int = 5
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 29
x :: Int = 5
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 29
xs :: [Int] = _
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
n :: Int = 7                                                -- begin 7 is prime (first time) for 29.
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 7
p :: Int = 2
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 2
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Int = 7
p :: Int = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 7
p :: Int = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
closurePtrs: Cannot handle type TSO yet
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
m :: Int = 7
ps :: [Int] = 3 : 5 : _                                      -- prime 3 cached for 7 in 29, no isPrime.
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35  
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 7 is prime for 29 (first time).
m :: Int = 7
p :: Int = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 3
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
m :: Int = 29
x :: Int = 7
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 7
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:32-34
_result :: [Int] = _                                        -- 29 is prime (first time) done.
m :: Int = 29
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors, Primacity.hs:40:18-33
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
n :: Int = 53                                               -- done with `29`, begin `53` (1st time).
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :list
39  primeFactors :: Int -> [Int]
40  primeFactors n = factors n primes
41    where factors :: Int -> [Int] -> [Int]
[Primacity.hs:40:18-33] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Int = 53
x :: Int = 2
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 2
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 53
x :: Int = 2
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 53
x :: Int = 2
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 53
xs :: [Int] = 3 : 5 : 7 : _                                 -- cached prime 3 from 29 for 53, no isPrime.
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Int = 53
x :: Int = 3
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 3
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 53
x :: Int = 3
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 53
x :: Int = 3
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 53
xs :: [Int] = 5 : 7 : _                                     -- cached prime 5 from 29 for 53, no isPrime.
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Int = 53
x :: Int = 5
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 5
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 53
x :: Int = 5
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 53
x :: Int = 5
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 53
xs :: [Int] = 7 : _                                         -- cached prime 7 from 29 for 53, no isPrime.
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-23
_result :: Bool = _
m :: Int = 53
x :: Int = 7
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 7
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-28
_result :: Bool = _
m :: Int = 53
x :: Int = 7
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:45:15-23
_result :: Int = _
m :: Int = 53
x :: Int = 7
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :list
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
[Primacity.hs:45:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:46:32-43
_result :: [Int] = _
factors :: Int -> [Int] -> [Int] = _
m :: Int = 53
xs :: [Int] = _                                             -- no cached vals left from 29 for 53, call isPrime.
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :list
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
46              | otherwise      = factors m xs
47  
[Primacity.hs:46:32-43] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime, Primacity.hs:28:13-29
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
n :: Int = 9                                                -- begin 9 is prime (1st time) for 53.
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 9
p :: Int = 2
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 2
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Int = 9
p :: Int = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 9
p :: Int = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
closurePtrs: Cannot handle type TSO yet
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
m :: Int = 9
ps :: [Int] = 3 : 5 : 7 : _                                 -- cached prime 3 from 29 for 9 in 53, no isPrime.
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35  
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 9
p :: Int = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _                                         -- done 9 is not prime (1st time) for 53.
m :: Int = 9
p :: Int = 3
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 9
p :: Int = 3
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
isPrime_ :: Int -> [Int] -> Bool = _
n :: Int = 11                                               -- begin 11 is prime (1st time) for 53.
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :list
27  isPrime :: Int -> Bool
28  isPrime n = isPrime_ n primes
29    where isPrime_ :: Int -> [Int] -> Bool
[Primacity.hs:28:13-29] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 11
p :: Int = 2
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 2
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Int = 11
p :: Int = 2
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 11
p :: Int = 2
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
closurePtrs: Cannot handle type TSO yet
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
m :: Int = 11
ps :: [Int] = 3 : 5 : 7 : _                                 -- cached prime 3 from 29 for 11 in 53, no isPrime.
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35  
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _
m :: Int = 11
p :: Int = 3
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 3
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-28
_result :: Bool = _
m :: Int = 11
p :: Int = 3
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-28] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:33:15-23
_result :: Int = _
m :: Int = 11
p :: Int = 3
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :list
32              | p * p > m      = True
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
[Primacity.hs:33:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:34:32-44
closurePtrs: Cannot handle type TSO yet
_result :: Bool = _
isPrime_ :: Int -> [Int] -> Bool = _
m :: Int = 11
ps :: [Int] = 5 : 7 : _                                     -- cached prime 5 from 29 for 11 in 53, no isPrime.
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :list
33              | m `mod` p == 0 = False
34              | otherwise      = isPrime_ m ps
35  
[Primacity.hs:34:32-44] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-23
_result :: Bool = _                                         -- done 11 is prime (1st time) for 53.
m :: Int = 11
p :: Int = 5
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :list
31          isPrime_ m (p:ps)
32              | p * p > m      = True
33              | m `mod` p == 0 = False
[Primacity.hs:32:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.isPrime.isPrime_, Primacity.hs:32:15-19
_result :: Int = _
p :: Int = 5
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
_result :: Bool = _                                         -- done 53 is prime (1st time).
m :: Int = 53
x :: Int = 11
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-23] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:15-19
_result :: Int = _
x :: Int = 11
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:15-19] 
*Primacity λ ▶▶ :step
Stopped in Primacity.primeFactors.factors, Primacity.hs:44:32-34
_result :: [Int] = _
m :: Int = 53
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :list
43          factors m (x:xs)
44              | x * x > m      = [m]
45              | m `mod` x == 0 = x : factors (m `div` x) (x:xs)
[Primacity.hs:44:32-34] 
*Primacity λ ▶▶ :step
2

