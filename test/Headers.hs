-- | Test results headers.
-- author: Prem Muthedath

module Headers (pcHeader, pcExceptionHeader) where

-- | primacity count test results caption.
pcCaption :: String
pcCaption = "PRIMACITY COUNT TEST RESULTS -- Test case # : (a, b, k) | actual | expected | PASS/FAIL"

-- | Primacity count error test results caption.
pcExceptionCaption :: String
pcExceptionCaption = "PRIMACITY COUNT EXCEPTION TEST RESULTS -- Test case # : (a, b, k) | actual | expected | PASS/FAIL"

-- | max caption size.
maxSize :: Int
maxSize = max (length pcCaption) (length pcExceptionCaption)

-- | seperator for header.
seperator :: String
seperator = replicate (maxSize) '#'

-- | given a caption, prints a header.
header :: String -> IO ()
header caption = do
  mapM_ (\x -> putStrLn x) [seperator, caption, seperator]

-- | primacity count test results header.
pcHeader :: IO ()
pcHeader = header pcCaption

-- | QuickCheck test results header.
pcExceptionHeader :: IO ()
pcExceptionHeader = header pcExceptionCaption


