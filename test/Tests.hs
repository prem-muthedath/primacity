{-# LANGUAGE ScopedTypeVariables #-}

-- | Defines & runs tests.
-- author: Prem Muthedath.

module Tests (run) where

import Data.List (zipWith4)

import Types
import Parser (testCases, expected)
import Inputs (exceptionTestCases, exceptionExpected)
import Primacity (primacityCounts)
import Print (Header(..), printResults)

results :: [TestCase] -> [Actual] -> [Expected] -> [(TestCaseNo, TestCase, Actual, Expected)]
results = zipWith4 (\n x y z -> (n, x, y, z)) [1..]

-- | run exception tests (to check error handling).
exceptionTests :: IO ()
exceptionTests = do
  let xs :: [TestCase] = exceptionTestCases
      zs :: [Expected] = exceptionExpected
      ys :: [Actual]   = primacityCounts xs
  printResults Exception $ results xs ys zs

-- | run primacity count tests.
primacityCountTests :: IO ()
primacityCountTests = do
  xs :: [TestCase] <- testCases
  zs :: [Expected] <- expected
  let ys :: [Actual] = primacityCounts xs
  printResults Normal $ results xs ys zs

-- | run all tests.
run :: IO ()
run = do
  primacityCountTests
  exceptionTests

