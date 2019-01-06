module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

data BST a = Empty | Node a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft tree = case tree of
    Empty -> Nothing
    Node a left right -> Just left

bstRight :: BST a -> Maybe (BST a)
bstRight tree = case tree of 
    Empty -> Nothing
    Node a left right -> Just right

bstValue :: BST a -> Maybe a
bstValue tree = case tree of
    Empty -> Nothing
    Node a left right -> Just a

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList xs = foldr (insert) Empty (reverse xs)

insert :: Ord a => a -> BST a -> BST a
insert x tree = case tree of
    Empty -> singleton x
    Node a left right -> if x <= a then Node a (insert x left) right else Node a left (insert x right)

singleton :: a -> BST a
singleton x = Node x Empty Empty

toList :: BST a -> [a]
toList tree = case tree of
    Empty -> []
    Node a left right -> toList left ++ [a] ++ toList right
