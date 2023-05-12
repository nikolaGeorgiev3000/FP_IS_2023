-- find the `annoying` guy that does not trust anybody, and everybody else trusts him 

main :: IO()
main = do
    print $ findJudge 2 [(1, 2)] == 2
    print $ findJudge 3 [(1, 3), (2, 3)] == 3
    print $ findJudge 3 [(1, 3), (2, 3), (3, 1)] == -1
    print $ findJudge 3 [(1, 2), (2, 3)] == -1
    print $ findJudge 4 [(1, 3), (1, 4), (2, 3), (2, 4), (4, 3)] == 3

findJudge :: Int -> [(Int, Int)] -> Int
findJudge n graph
 | null judges = -1
 | otherwise = head judges
 where
    judges :: [Int]
    judges = filter isJudge [1 .. n]

    isJudge :: Int -> Bool
    isJudge p = isLeaf p && everybodyTrusts p

    isLeaf :: Int -> Bool
    isLeaf person = null [p | (p, c) <- graph, p == person] -- `person` should have no heirs

    everybodyTrusts :: Int -> Bool
    everybodyTrusts person = n - 1 == length [p | (p, c) <- graph, c == person] -- number of arcs, connecting all other nodes to `person` should be `n - 1`