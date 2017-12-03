module Day03 where

import Prelude
import Math (sqrt)
import Data.Int (ceil, odd, toNumber)
import Data.Ord (abs)
import Data.Tuple (Tuple(..))

oddCeil :: Number -> Int
oddCeil = ceil >>> \x -> if odd x then x else x + 1

gridSize :: Int -> Int
gridSize = toNumber >>> sqrt >>> oddCeil

gridCentre :: Int -> Tuple Int Int
gridCentre width = Tuple (width / 2) (width / 2)

gridMax :: Int -> Tuple Int Int
gridMax width = Tuple (width - 1) (width - 1)

-- unwind from the bottom corner, there's probably a better way
coord :: Int -> Tuple Int Int -> Tuple Int Int
coord n max@(Tuple maxX maxY) = case sides of
  0 -> Tuple (maxX - offset) maxY
  1 -> Tuple 0 (maxY - offset)
  2 -> Tuple (offset) 0
  3 -> Tuple maxX (offset)
  _ -> max
  where
    difference = ((maxX + 1) * (maxY + 1)) - n
    sides = difference `div` maxX
    offset = difference `mod` maxX

steps :: Int -> Int
steps n = abs (px - cx) + abs (py - cy)
  where
    size = gridSize n
    (Tuple cx cy) = gridCentre size
    (Tuple px py) = coord n (gridMax size)
