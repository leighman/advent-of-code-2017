module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

import Main (captcha)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  describe "day 1" do
    it "1122" $ captcha "1122" `shouldEqual` 3
    it "1111" $ captcha "1111" `shouldEqual` 4
    it "1234" $ captcha "1234" `shouldEqual` 0
    it "91212129" $ captcha "91212129" `shouldEqual` 9
