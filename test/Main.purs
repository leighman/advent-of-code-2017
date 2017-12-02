module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

import Main (captcha, captcha2)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  describe "day 1" do
    it "1122" $ captcha "1122" `shouldEqual` 3
    it "1111" $ captcha "1111" `shouldEqual` 4
    it "1234" $ captcha "1234" `shouldEqual` 0
    it "91212129" $ captcha "91212129" `shouldEqual` 9
  describe "day 1 part 2" do
    it "1212" $ captcha2 "1212" `shouldEqual` 6
    it "1221" $ captcha2 "1221" `shouldEqual` 0
    it "123425" $ captcha2 "123425" `shouldEqual` 4
    it "123123" $ captcha2 "123123" `shouldEqual` 12
    it "12131415" $ captcha2 "12131415" `shouldEqual` 4
