-- | Defines parse errors of test case & expected primacity counts files.
-- author: Prem Muthedath.

module FileParseErrors (FileParseError(..)) where

import Common (replace)
import Inputs (testCasesFile, primacityCountsFile)

-- | data type for file parse error.
-- `LineFormatError` -> generic constructor for line format error.
-- `PCError`         -> constructor for non-integer primacity count error.
-- `TCError`         -> constructor for non-integer(s) test case error.
data FileParseError = LineFormatError String
                      | PCError String
                      | TCError String
                      deriving Eq

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


