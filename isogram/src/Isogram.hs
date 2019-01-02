module Isogram (isIsogram) where
import Data.List as List
import Data.Char as Char

isIsogram :: String -> Bool
isIsogram xs = let l = map Char.toUpper $ filter (\c -> c /= ' ' && c /= '-' ) xs in length l == length (List.nub l)
