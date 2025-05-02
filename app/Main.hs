{-# LANGUAGE ImportQualifiedPost #-}

module Main where

import MyLib qualified (findFetch)

main :: IO ()
main = do
  res <- MyLib.findFetch
  print res
