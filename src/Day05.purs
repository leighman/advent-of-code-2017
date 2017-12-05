module Day05 where

import Prelude
import Global (readInt)
import Data.Array (filter, length, modifyAt, unsafeIndex)
import Data.Int (floor)
import Data.Maybe (fromJust)
import Data.String (Pattern(..), null, split)
import Partial.Unsafe (unsafePartial)

parse :: String -> Array Int
parse = map (floor <<< readInt 10) <<< filter (not null) <<< split (Pattern "\n")

count :: (Int -> Int -> Int) -> Array Int -> Int
count f list = go list 0 0
  where
    go l i c
      | i >= length l = c
      | otherwise =
        go
          (unsafePartial fromJust $ modifyAt i (f offset) l)
          (i + offset)
          (c + 1)
      where
        offset = unsafePartial unsafeIndex l i

jump :: Int -> Int -> Int
jump offset x = if offset >= 3 then x - 1 else x + 1

steps :: String -> Int
steps = count (\_ x -> x + 1) <<< parse

steps2 :: String -> Int
steps2 = count jump <<< parse
