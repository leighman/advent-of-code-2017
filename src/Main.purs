module Main where

import Prelude
import Control.Monad.Aff (launchAff_)
import Control.Monad.Aff.Console (CONSOLE, logShow)
import Control.Monad.Eff (Eff)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (FS, readTextFile)

import Day04 (valid)

main :: forall e. Eff (console :: CONSOLE, fs :: FS | e) Unit
main = launchAff_ do
  passwords <- readTextFile ASCII "src/Day04.txt"
  logShow $ valid passwords
  pure unit
