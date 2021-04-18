module Main where

import Prelude

import Data.Maybe (Maybe(Nothing, Just))
import Data.Array ((!!))
import Effect (Effect)
import Effect.Console (log)

reduce :: forall curr acc.
  (
    curr -> acc 
    -> acc
  )
    -> acc
    -> Array curr
    -> acc
reduce reducer init arr = go 0 init
  where go ix acc = case arr !! ix of
                      Nothing -> acc
                      Just a -> go (ix + 1) (reducer a acc)

-- sum :: Array Int -> Int

main :: Effect Unit
main = do
  log "🍝"
