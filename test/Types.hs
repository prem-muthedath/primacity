-- | Types for tests.
-- author: Prem Muthedath

module Types (
              TestCase,
              CaseNo,
              Actual,
              Expected,
              Message(..)
              ) where

import Common (replace)
import Inputs (testCasesFile, primacityCountsFile)

-- | some type synonyms to make the code clear.
type TestCase = (Int, Int, Int)   -- primacity count test case
type CaseNo   = Int   -- test case number
type Actual   = Int   -- actual primacity count
type Expected = Int   -- expected primacity count

-- | data type for parser error messages.
-- `BadFormat` -> generic constructor for bad line format message.
-- `BadPC`     -> constructor for non-integer primacity count message.
-- `BadTC`     -> constructor for non-integer(s) test case message.
data Message = BadFormat String | BadPC String | BadTC String

-- | `Show` instance for `Message`.
instance Show Message where
  show (BadFormat xs) = msgF xs
  show (BadPC xs)     = msgPC xs
  show (BadTC xs)     = msgTC xs

-- | message for `BadFormat`.
msgF :: String -> String
msgF line = "file parse failed at line:" ++ "\n" ++ line ++ "\n"
  ++ "reason: line violates specified data pattern. "
  ++ "check '" ++ testCasesFile ++ "', '" ++ primacityCountsFile ++ "' files "
  ++ "for the failed line as well as for data-pattern specification."

-- | message for `BadPC`.
msgPC :: String -> String
msgPC line = "'" ++ primacityCountsFile
  ++ "' parse failed at line:" ++ "\n" ++ line ++ "\n"
  ++ "reason: non-integer primacity count found."

-- | message for `BadTC`.
msgTC :: String -> String
msgTC line = "'" ++ testCasesFile
  ++ "' parse failed at line:" ++ "\n" ++ replace ',' " " line ++ "\n"
  ++ "reason: non-integer(s) found in test case."

