module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
    | x < 1         = Nothing
    | aliNum == x   = Just Perfect
    | aliNum > x    = Just Abundant
    | otherwise     = Just Deficient
    where aliNum = aliquotSum x

aliquotSum :: Int -> Int
aliquotSum n = sum $ filter (\x -> n `rem` x == 0) [1..n-1]


