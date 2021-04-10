-- | defines user input errors for (mostly) interactive mode in ./Primacity.hs.
-- author: Prem Muthedath.

module UserErrors (UserError(..)) where

import Common (A, B, K)

-- | data type for user input error.
data UserError = NotIntError String         -- non-integer input error.
                 | Below1Error Int          -- input value < 1 error.
                 | FormatError String       -- input format not `a b k` error.
                 | ABKRangeError (A, B, K)  -- A-B-K input not in range error.
                 deriving Eq

-- | `Show` instance for `UserError`.
instance Show UserError where
  show (NotIntError xs)          = notIntMsg xs
  show (Below1Error n)           = below1Msg n
  show (FormatError xs)          = formatMsg xs
  show (ABKRangeError (a, b, k)) = badABKMsg (a, b, k)

-- | error message for non-integer input.
notIntMsg :: String -> String
notIntMsg xs = "your input '" <> xs <> "' is not an integer."

-- | error message for integer input < 1.
below1Msg :: Int -> String
below1Msg n = "bad input: " <> show n <> ". required: an integer >= 1."

-- | error message for bad `a b k` input format.
formatMsg :: String -> String
formatMsg xs = "your input '" <> xs <> "' is not in the expected format: a b k"

-- | error message for bad A-B-K value(s).
badABKMsg :: (A, B, K) -> String
badABKMsg (a, b, k) = "bad (a,b,k): " <> show (a,b,k) <> ". required: 2 <= a <= b, k >= 1."


