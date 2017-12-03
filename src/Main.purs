module Main where

import Prelude
import Control.Monad.Aff (launchAff_)
import Control.Monad.Aff.Console (CONSOLE, logShow)
import Control.Monad.Eff (Eff)

import Day03 (steps)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = launchAff_ do
  logShow $ steps 265149
  pure unit
