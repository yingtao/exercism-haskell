module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (\x -> map toLower x /= map toLower xs && (sort $ map toLower x) == (sort $ map toLower xs))
