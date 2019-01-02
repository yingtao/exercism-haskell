module Luhn (isValid) where
import Data.Char(isDigit, isSpace, digitToInt)
import Data.List(partition)

isValid :: String -> Bool
isValid n = notTooShort && isAllDigit && (sum changedDigits + sum stableDigits) `rem` 10 == 0
    where
    spaceRemoved = filter (not . isSpace) n
    isAllDigit = all (isDigit) spaceRemoved
    notTooShort = length spaceRemoved > 1
    (change, stable) = partition (odd . fst) (zip [0..] (map digitToInt (reverse spaceRemoved)))
    (_, digitsToChange) = unzip change
    (_, stableDigits) = unzip stable
    changedDigits = map transDigit digitsToChange


transDigit :: Int -> Int
transDigit n = if l > 9 then l - 9 else l where l = 2 * n

