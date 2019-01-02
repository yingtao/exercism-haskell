module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)

import qualified Data.Map.Strict as SM

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right $ SM.fromList [(A,0),(C,0),(G,0),(T,0)] 
nucleotideCounts (x:xs) = 
    case fromChar(x) of
        Right y -> case (nucleotideCounts xs) of
            Right m -> Right $ SM.adjust (+1) y m
            Left e' -> Left e'
        Left e  -> Left e

fromChar :: Char -> Either String Nucleotide
fromChar 'A' = Right A
fromChar 'C' = Right C
fromChar 'G' = Right G
fromChar 'T' = Right T
fromChar  c  = Left ("Invalid Symbol " ++ show c)
