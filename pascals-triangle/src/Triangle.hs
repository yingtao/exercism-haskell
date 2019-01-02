module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n
    |n < 1  = []
    |n == 1 =[[1]]
    |n == 2 =[[1],[1, 1]]
    |otherwise = (rows (n-1)) ++ [[1] ++ oneRow ++[1]]
    where   x = (rows (n-1)) !! (n-2)
            oneRow = newRow x

newRow ::  [Integer] -> [Integer]
newRow xs =map (\(x,y) -> x + y) (zip xs (tail xs))
