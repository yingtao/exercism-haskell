{-# LANGUAGE DeriveAnyClass #-}

module Clock (addDelta, fromHourMin, toString) where
import Text.Printf

data Clock = Clock {
    clockHour::Int,
    clockMinute::Int
} deriving (Show, Eq, Num)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = let  (h, m) = ((hour * 60 + min) `divMod` 60)
                            h' = rollHours (h `rem` 24)
                            in Clock { clockHour = h', clockMinute = m }

toString :: Clock -> String
toString clock = printf "%02d:%02d" (clockHour clock) (clockMinute clock)

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = let   (h,m) = (hour * 60 + min + (clockHour clock) * 60 + clockMinute clock) `divMod` 60
                                h' = rollHours (h `rem` 24) 
                                in Clock { clockHour = h', clockMinute = m } 

rollHours :: Int -> Int
rollHours hour = if hour < 0 then rollHours (hour + 24) else hour