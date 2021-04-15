{-# LANGUAGE ScopedTypeVariables #-}

-- | Defines & runs tests.
-- author: Prem Muthedath.

module Tests (run) where

import Types
import Parser (testCases, expected)
import Inputs (exceptionTestCases, exceptionExpected)
import Primacity (primacityCounts)
import Print (printResults)

-- | run primacity count test for inputs that generate exception.
-- this test checks error handling.
exceptionTest :: IO ()
exceptionTest = let xs :: [TestCase] = exceptionTestCases
                    zs :: [Expected] = exceptionExpected
                    ys :: [Actual]   = primacityCounts xs
                in printResults Exception xs ys zs

-- | run primacity count test for empty input.
emptyTest :: IO ()
emptyTest = let xs :: [TestCase] = []
                zs :: [Expected] = []
                ys :: [Actual]   = primacityCounts xs
            in printResults Empty xs ys zs

-- | run primacity count test for "normal" (i.e., good) inputs.
normalTest :: IO ()
normalTest = do
  xs :: [TestCase] <- testCases
  zs :: [Expected] <- expected
  let ys :: [Actual] = primacityCounts xs
  printResults Normal xs ys zs

-- | maps an instance of `Test` to its corresponding test.
test :: Test -> IO ()
test Normal    = normalTest
test Empty     = emptyTest
test Exception = exceptionTest

-- | run all tests.
run :: IO ()
run = mapM_(\x -> test x) [toEnum 0 :: Test ..]

