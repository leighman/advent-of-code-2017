module Main where

import Prelude
import Control.Monad.Aff (launchAff_)
import Control.Monad.Aff.Console (CONSOLE, logShow)
import Control.Monad.Eff (Eff)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (FS, readTextFile)

import Day02 (checksum2)

main :: forall e. Eff (console :: CONSOLE, fs :: FS | e) Unit
main = launchAff_ do
  spreadsheet <- readTextFile ASCII "src/Day02.txt"
  logShow $ checksum2 spreadsheet
  pure unit
