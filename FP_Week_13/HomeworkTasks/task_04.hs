import Data.List

main :: IO()
main = do
    print $ leavesAreEqual t1 t2 == True
    print $ leavesAreEqual t3 t4 == False

leavesAreEqual :: BTree -> BTree -> Bool
leavesAreEqual tree1 tree2 = sortedLeavesTree1 == sortedLeavesTree2
 where
    sortedLeavesTree1 = sort $ getLeaves tree1
    sortedLeavesTree2 = sort $ getLeaves tree2

getLeaves :: BTree -> [Int]
getLeaves Nil = []
getLeaves (Node value Nil Nil) = [value]
getLeaves (Node _ left right)  = getLeaves left ++ getLeaves right


data BTree = Nil | Node Int BTree BTree

t1 :: BTree
t1 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t2 :: BTree
t2 = Node 25 (Node 10 (Node 1 Nil Nil) Nil) (Node 30 (Node 32 Nil Nil) (Node 26 Nil Nil))

t3 :: BTree -- === t1
t3 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 26 Nil Nil) (Node 32 Nil Nil)))

t4 :: BTree
t4 = Node 10 (Node 1 Nil Nil) (Node 25 Nil (Node 30 (Node 27 Nil Nil) (Node 32 Nil Nil)))