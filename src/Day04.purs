module Day04 where

import Prelude
import Data.Array (filter, sort)
import Data.Foldable (foldl)
import Data.Set (fromFoldable, toUnfoldable)
import Data.String (Pattern(..), fromCharArray, null, split, toCharArray, trim)

parse :: String -> Array (Array String)
parse = map (split (Pattern " ")) <<< filter (not null) <<< map trim <<< split (Pattern "\n")

check :: (String -> String) -> Array String -> Boolean
check transform x = toUnfoldable (fromFoldable y) == sort y
  where
    y = map transform x

check1 :: Array String -> Boolean
check1 = check id

check2 :: Array String -> Boolean
check2 = check (fromCharArray <<< sort <<< toCharArray)

countTrue :: Array Boolean -> Int
countTrue = foldl (\acc x -> if x then acc + 1 else acc) 0

valid :: String -> Int
valid = countTrue <<< map check1 <<< parse

valid2 :: String -> Int
valid2 = countTrue <<< map check2 <<< parse
