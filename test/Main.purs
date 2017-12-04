module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

import Test.Day01 (testDay01)
import Test.Day02 (testDay02)
import Test.Day03 (testDay03)
import Test.Day04 (testDay04)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  testDay01
  testDay02
  testDay03
  testDay04
