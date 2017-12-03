module Test.Day03 where

import Prelude
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Day03 (steps)

testDay03 :: forall e. Spec e Unit
testDay03 = do
  describe "day 3" do
    it "1" $ steps 1 `shouldEqual` 0
    it "12" $ steps 12 `shouldEqual` 3
    it "23" $ steps 23 `shouldEqual` 2
    it "1024" $ steps 1024 `shouldEqual` 31
