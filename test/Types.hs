-- | Types for tests.
-- author: Prem Muthedath

module Types (
              TestCase,
              TestCaseNo,
              Actual,
              Expected,
              FileParseError(..)
              ) where

import Common (A, B, K, replace)
import UserErrors (UserError)
import Inputs (testCasesFile, primacityCountsFile)

-- | some type synonyms to make the code clear.
type TestCase   = (A, B, K)                 -- primacity count test case
type TestCaseNo = Int                       -- primacity count test case number
type Actual     = Either UserError Int      -- actual primacity count
type Expected   = Int                       -- expected primacity count

-- | data type for file parse error.
-- `LineFormatError` -> generic constructor for line format error.
-- `PCError`         -> constructor for non-integer primacity count error.
-- `TCError`         -> constructor for non-integer(s) test case error.
data FileParseError = LineFormatError String
                      | PCError String
                      | TCError String

-- | `Show` instance for `FileParseError`.
instance Show FileParseError where
  show (LineFormatError xs) = msgLF xs
  show (PCError xs)         = msgPC xs
  show (TCError xs)         = msgTC xs

-- | message for `LineFormatError`.
msgLF :: String -> String
msgLF line = "file parse failed at line:"
  ++ "\n"
  ++ line
  ++ "\n"
  ++ "reason: line violates specified data pattern. check '"
  ++ testCasesFile
  ++ "', '"
  ++ primacityCountsFile
  ++ "' files for the failed line as well as for data-pattern specification."

-- | message for `PCError`.
msgPC :: String -> String
msgPC line = "'"
  ++ primacityCountsFile
  ++ "' parse failed at line:"
  ++ "\n"
  ++ line
  ++ "\n"
  ++ "reason: non-integer primacity count found."

-- | message for `TCError`.
msgTC :: String -> String
msgTC line = "'"
  ++ testCasesFile
  ++ "' parse failed at line:"
  ++ "\n"
  ++ replace ',' " " line
  ++ "\n"
  ++ "reason: non-integer(s) found in test case."

