-- Check whether a number is between two numbers

main :: IO()
main = do
    print $ isInside 1 5 4 == True -- x = 1, y = 5, n = 4
    print $ isInside 5 1 4 == True
    print $ isInside 10 50 20 == True
    print $ isInside 10 50 1 == False

isInside :: Int -> Int -> Int -> Bool
isInside x y n = elem n [min x y .. max x y]
-- Alternative solutions
-- isInside x y n = any (== n) [min x y .. max x y]
-- isInside x y n = any (\ k -> n == k) [min x y .. max x y]