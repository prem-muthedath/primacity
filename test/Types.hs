-- | Types for tests.
-- author: Prem Muthedath.

module Types where

import Common (A, B, K)
import UserErrors (UserError)

-- | some type synonyms to make the code clear.
type TestCase   = (A, B, K)                 -- primacity count test case
type TestCaseNo = Int                       -- primacity count test case number
type Actual     = Either UserError Int      -- actual primacity count
type Expected   = Either UserError Int      -- expected primacity count

-- | Types of tests.
data Test = Normal | Empty | Exception deriving (Eq, Enum)

-- | `Show` instance for `Test`.
instance Show Test where
  show Normal     = "PRIMACITY COUNT TEST"
  show Empty      = "PRIMACITY COUNT EMPTY TEST"
  show Exception  = "PRIMACITY COUNT EXCEPTION TEST"

-- | list of all `Test` instances.
tests :: [Test]
tests = [toEnum 0 :: Test ..]


