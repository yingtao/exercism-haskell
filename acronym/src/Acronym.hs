module Acronym (abbreviate) where
import Data.Char as Char
import Data.List.Split (splitOn)


abbreviate :: String -> String
abbreviate xs = filter (\c -> c /= ' ' ) $ unwords $ map pick $ words (unwords $ (splitOn ['-'] xs))

pick::String -> String
pick [] = []
pick (x:xs) = map Char.toUpper $ x:if all Char.isUpper xs then [] else filter Char.isUpper xs
