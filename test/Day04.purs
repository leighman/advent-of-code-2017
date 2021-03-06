module Test.Day04 where

import Prelude
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

import Day04 (valid, valid2)

testDay04 :: forall e. Spec e Unit
testDay04 = do
  describe "day 4" do
    it "aa bb cc dd ee" $ valid "aa bb cc dd ee\n" `shouldEqual` 1
    it "aa bb cc dd aa" $ valid "aa bb cc dd aa\n" `shouldEqual` 0
    it "aa bb cc dd aaa" $ valid "aa bb cc dd aaa\n" `shouldEqual` 1
  describe "day 4" do
    it "abcde fghij" $ valid2 "abcde fghij\n" `shouldEqual` 1
    it "abcde xzy ecdab" $ valid2 "abcde xzy ecdab\n" `shouldEqual` 0
    it "a ab abc abd abf abj" $ valid2 "a ab abc abd abf abj\n" `shouldEqual` 1
    it "iiii oiii ooii oooi ooo" $ valid2 "iiii oiii ooii oooi ooo\n" `shouldEqual` 1
    it "oiii ioii iioi iiio" $ valid2 "oiii ioii iioi iiio\n" `shouldEqual` 0
