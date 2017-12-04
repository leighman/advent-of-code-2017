module Test.Day04 where

import Prelude
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Day04 (valid)

testDay04 :: forall e. Spec e Unit
testDay04 = do
  describe "day 4" do
    it "aa bb cc dd ee" $ valid "aa bb cc dd ee\n" `shouldEqual` 1
    it "aa bb cc dd aa" $ valid "aa bb cc dd aa\n" `shouldEqual` 0
    it "aa bb cc dd aaa" $ valid "aa bb cc dd aaa\n" `shouldEqual` 1
