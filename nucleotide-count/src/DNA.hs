module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import Text.Read
import Control.Monad (foldM)

import qualified Data.Map.Strict as SM

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Enum, Bounded, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldl merge (Right $ SM.fromList [(x,0)| x <- [minBound .. maxBound]]) xs

merge :: Either String (Map Nucleotide Int) -> Char -> Either String (Map Nucleotide Int)
merge cur char = case readEither [char] of
    Left e -> Left e
    Right a -> case cur of
        Right m -> Right $ SM.adjust (+1) a m
        Left e' -> Left e'