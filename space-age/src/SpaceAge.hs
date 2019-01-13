module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = case planet of
    Mercury -> seconds / (earthyearseconds * 0.2408467)
    Venus   -> seconds / (earthyearseconds * 0.61519726)
    Earth   -> seconds / earthyearseconds
    Mars    -> seconds / (earthyearseconds * 1.8808158)
    Jupiter -> seconds / (earthyearseconds * 11.862615)
    Saturn  -> seconds / (earthyearseconds * 29.447498)
    Uranus  -> seconds / (earthyearseconds * 84.016846)
    Neptune -> seconds / (earthyearseconds * 164.79132)

    where earthyearseconds = 31557600
