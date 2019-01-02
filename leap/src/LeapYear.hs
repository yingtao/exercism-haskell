module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year 
    | isDivisable year 400 || not (isDivisable year 100) && isDivisable year 4  = True
    | otherwise = False

isDivisable :: Integer -> Integer -> Bool
isDivisable numerator demominator = numerator `rem` demominator == 0