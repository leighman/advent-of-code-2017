module Test.Day02 where

import Prelude
import Test.Spec (Spec, describe, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Day02 (checksum, checksum2)

testDay02 :: forall e. Spec e Unit
testDay02 = do
  describe "day 2" do
    it "should calculate a checksum"
      $ checksum
        """5	1	9	5
           7	5	3
           2	4	6	8
           """ `shouldEqual` 18
    it "should calculate a checksum"
      $ checksum2
        """5	9	2	8
           9	4	7	3
           3	8	6	5
           """ `shouldEqual` 9
