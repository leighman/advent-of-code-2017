module Day01 where

import Prelude
import Global (readInt)
import Data.Array (drop, length, snoc, take, uncons, zipWith)
import Data.Foldable (sum)
import Data.Int (floor)
import Data.Maybe (Maybe(..))
import Data.String (singleton, toCharArray)

shift :: forall a. Array a -> Array a
shift xs = case uncons xs of
  Nothing -> []
  Just {head, tail} -> snoc tail head

rotate :: forall a. Array a -> Array a
rotate xs = drop n xs <> take n xs
  where
    n = length xs / 2

digits :: String -> Array Int
digits = map (floor <<< readInt 10 <<< singleton) <<< toCharArray

pairWith :: (Array Int -> Array Int) -> Array Int -> Array Int
pairWith transform xs = zipWith f xs (transform xs)
  where
    f x y = if x == y then x else 0

captcha :: String -> Int
captcha = sum <<< pairWith shift <<< digits

captcha2 :: String -> Int
captcha2 = sum <<< pairWith rotate <<< digits
