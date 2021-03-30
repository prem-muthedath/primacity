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

data Message = Format String | PcFormat String | TcFormat String

instance Show Message where
  show (Format xs)   = msgF xs
  show (PcFormat xs) = msgPc xs
  show (TcFormat xs) = msgTc xs

msgF :: String -> String
msgF line = "file parse failed at line: " ++ line ++ "\n"
  ++ "reason: line violates specified data pattern. "
  ++ "check '" ++ testCasesFile ++ "', '" ++ primacityCountsFile
  ++ "' for line & specifications."

msgPc :: String -> String
msgPc line = "'" ++ primacityCountsFile
  ++ "' parse failed at line: " ++ line ++ "\n"
  ++ "reason: non-integer found."

msgTc :: String -> String
msgTc line = "'" ++ testCasesFile
  ++ "' parse failed at line: " ++ replace ',' " " line ++ "\n"
  ++ "reason: non-integer(s) found."

