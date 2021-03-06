module Day02 where

import Prelude
import Global (readInt)
import Control.MonadZero (guard)
import Data.Array (filter, sort)
import Data.Array.Partial (head, last)
import Data.Foldable (sum)
import Data.Int (floor)
import Data.String (Pattern(..), null, split, trim)
import Partial.Unsafe (unsafePartial)

lines :: String -> Array String
lines = filter (not null) <<< map trim <<< split (Pattern "\n")

toInt :: String -> Int
toInt = floor <<< readInt 10

parse :: String -> Array (Array Int)
parse = map intify <<< lines
  where
    intify = map toInt <<< split (Pattern "\t")

checksumRow :: Array Int -> Int
checksumRow [] = 0
checksumRow ns = (unsafePartial last sorted) - (unsafePartial head sorted)
  where
    sorted = sort ns

checksum2Row :: Array Int -> Int
checksum2Row [] = 0
checksum2Row ns = unsafePartial head $ do
  x <- ns
  y <- ns
  guard $ x /= y
  guard $ x `mod` y == 0
  pure $ x `div` y

checksum :: String -> Int
checksum = sum <<< map checksumRow <<< parse

checksum2 :: String -> Int
checksum2 = sum <<< map checksum2Row <<< parse
