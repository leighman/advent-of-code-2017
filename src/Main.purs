module Main where

import Prelude
import Control.Monad.Aff (launchAff_)
import Control.Monad.Aff.Console (CONSOLE, logShow)
import Control.Monad.Eff (Eff)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (FS, readTextFile)

import Day05 (steps2)

main :: forall e. Eff (console :: CONSOLE, fs :: FS | e) Unit
main = launchAff_ do
  list <- readTextFile ASCII "src/Day05.txt"
  logShow $ steps2 list
  pure unit
