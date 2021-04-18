module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

addInts :: Int -> Int -> Int
addInts a b = a + b

addTwo :: Int -> Int
addTwo = addInts 2

mulInts :: Int -> Int -> Int
mulInts a b = a * b

main :: Effect Unit
main = do
  log "🍝"
