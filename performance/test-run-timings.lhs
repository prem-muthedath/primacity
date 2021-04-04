-- cached `primes` -- i.e., non-polymorphic -- run of 100 tests.
-- call sequence:
--    1. primacity/test/Main.main
--    2. primacity/test/Tests.run
--    3. primacity/test/primacityCountTests
--    4. primacity/app/Primacity.primacityCounts
-- timing data translates to ~ 12 min * 60 / 100 = 7.2 secs/test.
real	11m58.131s
user	11m54.086s
sys	0m3.262s

-- uncached `primes` -- i.e., polymorphic -- run of 100 tests.
-- call sequence:
--    1. primacity/test/Main.main
--    2. primacity/test/Tests.run
--    3. primacity/test/primacityCountTests
--    4. primacity/app/Primacity.primacityCounts
-- timing data translates to ~ 12 min * 60 / 100 = 7.2 secs/test.
real	12m0.637s
user	11m55.722s
sys	0m3.422s


