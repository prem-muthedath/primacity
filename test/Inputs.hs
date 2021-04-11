-- | Input data (files, etc.) for tests.
-- author: Prem Muthedath

module Inputs where

import UserErrors (UserError(ABKRangeError))
import Types (TestCase, Expected)

-- | primacity count test cases file.
testCasesFile :: String
testCasesFile =  "./test/primacity-count-test-cases.txt"

-- | expected primacity counts input file.
primacityCountsFile :: String
primacityCountsFile = "./test/expected-primacity-counts.txt"

-- | list of test cases, some with bad data, for testing error handling.
exceptionTestCases :: [TestCase]
exceptionTestCases = [
                (5,15,2),
                (15,5,2),         -- bad data
                (31,42,1),
                (1,15,1),         -- bad data
                (2,15,0),         -- bad data
                (100,121,1),
                (12,(-4),(-5)),   -- bad data
                ((-1),15,1),      -- bad data
                (90,140,1)
              ]

-- | list of expected values corresponding to `exceptionTestCases`.
exceptionExpected :: [Expected]
exceptionExpected = [
                Right 5,
                Left $ ABKRangeError (15,5,2),
                Right 4,
                Left $ ABKRangeError (1,15,1),
                Left $ ABKRangeError (2,15,0),
                Right $ 6,
                Left $ ABKRangeError (12, (-4), (-5)),
                Left $ ABKRangeError ((-1), 15, 1),
                Right 13
              ]


