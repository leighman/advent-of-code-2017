module Day04 where

import Prelude
import Data.Array (filter, sort)
import Data.Foldable (foldl)
import Data.Set (fromFoldable, toUnfoldable)
import Data.String (Pattern(..), null, split, trim)

parse :: String -> Array (Array String)
parse = map (split (Pattern " ")) <<< filter (not null) <<< map trim <<< split (Pattern "\n")

check :: Array String -> Boolean
check x = toUnfoldable (fromFoldable x) == sort x

countTrue :: Array Boolean -> Int
countTrue = foldl (\acc x -> if x then acc + 1 else acc) 0

valid :: String -> Int
valid = countTrue <<< map check <<< parse
