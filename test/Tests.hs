{-# LANGUAGE ScopedTypeVariables #-}

-- | Defines & runs tests.
-- author: Prem Muthedath.

module Tests (run) where

import Data.List (zipWith4)

import Types
import Parser (testCases, expected)
import Inputs (exceptionTestCases, exceptionExpected)
import Common (showE)
import Primacity (primacityCounts)
import Headers (pcHeader, pcExceptionHeader)

-- | format & print primacity count test results.
printResults :: [(TestCaseNo, TestCase, Actual, Expected)] -> IO ()
printResults vals = do
  mapM_(\(n, x, y, z) ->
      let (x', y', z') = (show x, showE y, showE z)
      in putStrLn $ "Test case #" ++  show n ++ ": " ++
        x' ++ " | "  ++
        y' ++ " | "  ++
        z' ++ " | "  ++
        if (y == z) then "PASS" else "FAIL") vals

-- | run exception tests (to check error handling).
exceptionTests :: IO ()
exceptionTests = do
  pcExceptionHeader
  let xs :: [TestCase] = exceptionTestCases
      zs :: [Expected] = exceptionExpected
      ys :: [Actual]   = primacityCounts xs
      results = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

-- | run primacity count tests.
primacityCountTests :: IO ()
primacityCountTests = do
  pcHeader
  xs :: [TestCase] <- testCases
  zs :: [Expected] <- expected
  let ys :: [Actual] = primacityCounts xs
      results        = zipWith4 (\n x y z -> (n, x, y, z)) [1..] xs ys zs
  printResults results

-- | run all tests.
run :: IO ()
run = do
  exceptionTests
  primacityCountTests
  -- pcErrTests

