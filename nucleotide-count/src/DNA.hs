module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import Text.Read

import qualified Data.Map.Strict as SM

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Enum, Bounded, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right $ SM.fromList [(A,0),(C,0),(G,0),(T,0)] 
nucleotideCounts (x:xs) = 
    case readEither [x] of
        Right y -> case (nucleotideCounts xs) of
            Right m -> Right $ SM.adjust (+1) y m
            Left e' -> Left e'
        Left e  -> Left e

-- f :: Either String (Map Nucleotide Int) -> Char -> Either String (Map Nucleotide Int)
-- f (Left x) _ = Left x
-- f (Right ) 


-- fromChar :: Char -> Either String Nucleotide
-- fromChar 'A' = Right A
-- fromChar 'C' = Right C
-- fromChar 'G' = Right G
-- fromChar 'T' = Right T
-- fromChar  c  = Left ("Invalid Symbol " ++ show c)
