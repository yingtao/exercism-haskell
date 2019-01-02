module Diamond (diamond) where
import Data.Maybe (fromMaybe)
import Data.List (elemIndex)
import Data.Char (toUpper, isLetter)

diamond :: Char -> Maybe [String]
diamond c 
    | (not . isLetter . toUpper) c = Nothing
    | otherwise  = Just $ top ++ (drop 1 $ reverse top)
    where 
        l = ['A'..c]
        top = [generateOneRow l ch | ch <- l]

generateOneRow :: [Char] -> Char -> [Char]
generateOneRow l c = pading ++ [c] ++ rest ++ pading
    where 
        x = length l - (fromMaybe 0 $ elemIndex c l) - 1
        pading = replicate x ' '
        middleBlank = 2 * (length l) - 2 * x - 3
        rest = if middleBlank==0 || c == 'A'
            then ""
            else replicate middleBlank ' ' ++ [c]