module Minesweeper (annotate) where
import Data.List
import Data.Char(intToDigit)
import Data.Matrix(matrix, toLists)

type Row = Int
type Col = Int 
annotate :: [String] -> [String]
annotate [] = []
annotate [""] = [""]
annotate board = toLists $ matrix row col (\(x, y) -> if hasMine (x-1, y-1) board then '*' else getNeighbourCount (x-1,y-1) board)
    where (row,col) = dimensions board

getNeighbourCount :: (Row, Col) -> [String] -> Char
getNeighbourCount (row,col) board = 
    let mineGrids = filter (\(x,y)-> hasMine (x,y) board) ([(i,j)| i <- [rowLowerBound..rowHigherBound], j <-[colLowerBound..colHigherBound]] \\ [(row, col)])
        (maxRow, maxCol) = dimensions board
        rowLowerBound = max 0 (row - 1)
        rowHigherBound = min (maxRow-1) (row + 1)
        colLowerBound = max 0 (col - 1)
        colHigherBound = min (maxCol-1) (col + 1)
        in if null mineGrids then ' ' else intToDigit $ length mineGrids

hasMine :: (Row, Col) -> [String] -> Bool
hasMine (row, col) board = (board !! row) !! col == '*'

dimensions :: [String] -> (Row, Col)
dimensions board = (row,col) 
    where   row = length board
            col = if row == 0 then 0 else length (board !! 0)
