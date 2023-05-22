main :: IO()
main = do
    print $ flatten (List []) == []     -- concatMap _ [] == []
    print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
    print $ flatten (Elem 1) == [1]

flatten :: NestedList -> [Int]
flatten (Elem n)  = [n]
flatten (List xs) = concatMap flatten xs

data NestedList = Elem Int | List [NestedList]