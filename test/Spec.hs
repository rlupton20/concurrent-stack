import Test.Framework as TF
import Test.Framework.Providers.HUnit (hUnitTestToTests)
import Test.HUnit as HU
import Test.HUnit ((~:),(@=?))

import Protolude
import Control.Concurrent.Stack

main :: IO ()
main = defaultMain tests

tests :: [ TF.Test ]
tests = [ basicTests ]

basicTests :: TF.Test
basicTests = testGroup "Basic tests" . hUnitTestToTests $
  HU.TestList [ canRunBasicStack ]

canRunBasicStack :: HU.Test
canRunBasicStack = "Check a basic Stack runs" ~:
  runStack stack
  where
    stack :: Stack ()
    stack = do
      register $ return ()
      register $ return ()
      register $ return ()
