module Phone (number) where
import Data.Char(isDigit)

number :: String -> Maybe String
number xs
    | len == 10 = checkNumber numberOnly
    | len < 10 || len > 11 = Nothing
    | head numberOnly /= '1' = Nothing
    | otherwise = checkNumber $ tail numberOnly
    where   numberOnly = filter (isDigit) xs
            len = length numberOnly

checkNumber :: String -> Maybe String
checkNumber xs = if (xs !! 0 < '2' || xs !! 3 < '2') then Nothing else Just xs