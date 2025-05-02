module MyLib (findFetch) where

-- foldr (+) 0 [1, 2,3]
-- foldr [1,2,3+0] 3 (1 + ( 2 + (3 + 0)))
-- foldr (:) 4 [1, 2, 3]

findFetch :: IO [String]
findFetch = parseFile <$> readFile "./src/test.txt"
  where
    parseFile :: String -> [String]
    parseFile file =
      let res = foldr parser ([], "") file
       in [snd res] <> fst res
      where
        parser :: Char -> ([String], String) -> ([String], String)
        parser '\n' (acc, cur) = (cur : acc, "")
        parser char (acc, cur) = (acc, [char] <> cur)
