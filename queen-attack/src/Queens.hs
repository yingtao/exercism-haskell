module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = concat $ map (calculateChar white black) [(x,y) | x <- [0..7], y <- [0..7]]

calculateChar :: Maybe (Int, Int) -> Maybe (Int, Int) -> (Int, Int) -> String

calculateChar Nothing Nothing (_, y) = "_" ++ getPadding y

calculateChar (Just (a, b))  (Just (c, d))  x = 
    case x of
        (row, col) 
            | row == a && col == b  -> "W" ++ getPadding col
            | row == c && col == d  -> "B" ++ getPadding col
            | otherwise             -> "_" ++ getPadding col

calculateChar (Just (a, b)) Nothing x = 
    case x of
        (row, col) 
            | row == a && col == b  -> "W" ++ getPadding col
            | otherwise             -> "_" ++ getPadding col

calculateChar Nothing (Just (c, d)) x =
    case x of
        (row, col)
            | row == c && col == d  -> "B" ++ getPadding col
            | otherwise             -> "_" ++ getPadding col

getPadding :: Int -> String
getPadding y = if y == 7 then "\n" else " "

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA queenB
    |fst queenB == fst queenA || snd queenA == snd queenB           = True
    |abs (fst queenB - fst queenA) == abs (snd queenB - snd queenA) = True
    |otherwise                                                  = False
