-- | defines Primacity errors.
-- author: Prem Muthedath.

module Errors (UserError(..)) where

import Common (A, B, K)

-- | data type for user input error.
data UserError = NotIntError String
                 | Below1Error Int
                 | FormatError String
                 | RangeError (A, B, K)
                 deriving Eq

-- | `Show` instance for `UserError`.
instance Show UserError where
  show (NotIntError xs)       = notInt xs
  show (Below1Error n)        = below1 n
  show (FormatError xs)       = badFormat xs
  show (RangeError (a, b, k)) = badABK (a, b, k)

-- | error message for non-integer input.
notInt :: String -> String
notInt xs = "your input '" <> xs <> "' is not an integer."

-- | error message for integer input < 1.
below1 :: Int -> String
below1 n = "bad input: " <> show n <> ". i need an integer >= 1."

-- | error message for bad format `a b k` input.
badFormat :: String -> String
badFormat xs = "your input '" <> xs <> "' is not in the expected format: a b k"

-- | error message for bad A-B-K value.
badABK :: (A, B, K) -> String
badABK (a, b, k) = "bad (a,b,k): " <> show (a,b,k) <> ". i need 2 <= a <= b, k >= 1."


