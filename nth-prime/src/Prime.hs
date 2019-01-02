module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
    | n <=0     = Nothing
    | otherwise = let result = (filter (isPrime) [2..]) !! (n-1) in Just result

isPrime :: Integer -> Bool
isPrime 2 = True
isPrime n = let a = ceiling $ sqrt $ fromIntegral n
                in all (\x -> n `rem` x /= 0 ) [2..a] 
