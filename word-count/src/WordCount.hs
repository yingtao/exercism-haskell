module WordCount (wordCount) where
import Data.Char(toLower)
import Data.List(sort, group)
import Data.List.Split(splitOneOf)

wordCount :: String -> [(String, Int)]
wordCount = 
    map (\l -> (head l, length l)) 
    . group 
    . sort 
    . map (removeSingleQuote) 
    . filter (\x -> x /= "") 
    . (splitOneOf " ,.!&@$%^&:\n")  -- work around special test cases.
    . map toLower 

-- there should be better ways to deal with the 
-- pesty single quote while still support apostrophe.
-- need more research...
removeSingleQuote :: String -> String
removeSingleQuote [] = []
removeSingleQuote s@(x:xs)
    | first == '\'' && end == '\'' = init xs
    | first == '\'' = xs
    | end == '\'' = init s
    | otherwise = s
    where   first = x
            end = last s