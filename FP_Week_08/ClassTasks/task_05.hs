-- Use the `Shape` data type
-- 1. isRound - returns whether a shape has a round side;
-- 2. is2D - returns whether a shape has two dimensions.

main :: IO()
main = do
    print $ isRound (Circle 5) == True
    print $ isRound (Rectangle 2.5 4.5) == False
    print $ isRound (Rectangle 5.5 20.6) == False
    print $ isRound (Triangle 5.3 3.9 4.89) == False
    print $ isRound (Cylinder 20 30) == True

    print $ is2D (Circle 5) == True
    print $ is2D (Rectangle 2.5 4.5) == True
    print $ is2D (Rectangle 5.5 20.6) == True
    print $ is2D (Cylinder 20 30) == False
    print $ is2D (Triangle 5.3 3.9 4.89) == True

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a 

-- Solving the task with simple PM's

is2D :: Shape a -> Bool
is2D (Cylinder _ _) = False
is2D _ = True

isRound :: Shape a -> Bool
isRound (Rectangle _ _) = False
isRound (Triangle _ _ _) = False
isRound _ = True