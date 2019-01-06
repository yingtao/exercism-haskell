module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split (chunksOf)
import Data.List (transpose)

encode :: String -> String
encode xs = unwords . transpose $ buildSquare xs

normalize :: String -> String
normalize xs = filter (isAlphaNum) $ map toLower xs

getDimensions :: Int -> (Int, Int)
getDimensions a 
    | row * row == a  = (row, row)
    | otherwise = (row, (row + 1))
    where row = floor $ sqrt (fromIntegral a) 

buildSquare :: String -> [String]
buildSquare xs = chunksOf col encodingSeq
    where
        (row, col) = getDimensions $ length cleanString
        padCount = row * col - length cleanString
        encodingSeq = cleanString ++ replicate padCount ' '
        cleanString = normalize xs

