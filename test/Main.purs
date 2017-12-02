module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (RunnerEffects, run)

import Test.Day01 (testDay01)
import Test.Day02 (testDay02)

main :: Eff (RunnerEffects ()) Unit
main = run [consoleReporter] do
  testDay01
  testDay02
