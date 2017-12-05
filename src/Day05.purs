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

count :: Array Int -> Int
count list = go list 0 0
  where
    go l i c
      | i >= length l = c
      | otherwise =
        go
          (unsafePartial fromJust $ modifyAt i (_ + 1) l)
          (i + (unsafePartial unsafeIndex l i))
          (c + 1)


steps :: String -> Int
steps = count <<< parse
