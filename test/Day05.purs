module Test.Day05 where

import Prelude
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Day05 (steps, steps2)

testDay05 :: forall e. Spec e Unit
testDay05 = do
  describe "day 4" do
    it "0 3 0 1 -3" $ steps "0\n3\n0\n1\n-3\n" `shouldEqual` 5
  describe "day 4" do
    it "0 3 0 1 -3" $ steps2 "0\n3\n0\n1\n-3\n" `shouldEqual` 10
