{-# LANGUAGE ScopedTypeVariables #-}

-- | test code to demonstrate module-location performance problem (see `main`).
-- author: Prem Muthedath.
-- this code is also @ https://pastebin.com/mBevWnT4

module Main (main) where

import Primacity

dff :: IO ()
dff = do
  let a :: Int = 2
      b :: Int = 10000000
      k :: Int = 1
      n = primacityCount [a..b] k
  putStrLn $ show n

-- using GHC 8.10.4
-- ghc options used:
  --  '-O2 -fforce-recomp -Wall -Werror'
  --  '-fforce-recomp -Wall -Werror'
main :: IO ()
main = do
  df    -- this call works just fine.
  -- but below call to `dff`, which is identical to `df` in `Primacity.hs`, 
  -- hangs.  however, if input `b` in `dff` is small, say 100, it works.
  dff

