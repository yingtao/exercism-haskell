module School (School, add, empty, grade, sorted) where

import qualified Data.Map as Map
import Data.List (sort)

type School = Map.Map Grade [Name]
type Grade = Int
type Name = String

add :: Grade -> Name -> School -> School
add gradeNum student school = Map.adjust sort gradeNum $ Map.insertWith (++) gradeNum [student] school

empty :: School
empty = Map.empty

grade :: Grade -> School -> [Name]
grade = Map.findWithDefault []

sorted :: School -> [(Int, [String])]
sorted school = map f l where 
    l = Map.toAscList school
    f (c, names) = (c, sort names)
