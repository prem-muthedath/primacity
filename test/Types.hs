-- | Types for tests.
-- author: Prem Muthedath

module Types (
              TestCase,
              TestCaseNo,
              Actual,
              Expected
              ) where

import Common (A, B, K)
import UserErrors (UserError)

-- | some type synonyms to make the code clear.
type TestCase   = (A, B, K)                 -- primacity count test case
type TestCaseNo = Int                       -- primacity count test case number
type Actual     = Either UserError Int      -- actual primacity count
type Expected   = Either UserError Int      -- expected primacity count


