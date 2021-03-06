-- app/Primacity.hs: cached `primes` -- i.e., non-polymorphic -- run of 100 tests.
-- call sequence:
--    1. primacity/test/Main.main
--    2. primacity/test/Tests.run
--    3. primacity/test/Tests/normalTest, exceptionTest, emptyTest
--    4. primacity/app/Primacity.primacityCounts
-- NOTES:
--  (a) tests: normal - 100, exception - 9, empty - 1; total: 110.
--  (b) exceptionTest & emptyTest take < 0.2 secs, so time reflects normalTest.
--  (c) timing data translates to ~ 12 min * 60 / 100 = 7.2 secs/test.
--  (d) previous timing ~ 12 min; the extra ~ 13 secs is not because of
--      primacity calculations per se but because of random variation.
real	12m13.136s
user	12m4.970s
sys	0m3.542s

-- app/Primacity.hs: uncached `primes` -- i.e., polymorphic -- run of 100 tests.
-- call sequence:
--    1. primacity/test/Main.main
--    2. primacity/test/Tests.run
--    3. primacity/test/Tests/normalTest, exceptionTest, emptyTest
--    4. primacity/app/Primacity.primacityCounts
-- NOTES:
--  (a) tests: normal - 100, exception - 9, empty - 1; total: 110.
--  (b) exceptionTest & emptyTest take < 0.2 secs, so time reflects normalTest.
--  (c) timing data translates to ~ 12 min * 60 / 100 = 7.2 secs/test.
--  (d) previous timing ~ 12 min; the extra ~ 17 secs is not because of
--      primacity calculations per se but because of random variation.
real	12m16.476s
user	12m3.784s
sys	0m4.866s

