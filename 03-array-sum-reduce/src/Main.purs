module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

reduce :: forall a b.
  (
    curr -> acc 
    -> acc
  )
    -> acc
    -> Array curr
    -> acc


sum :: Array Int -> Int



main :: Effect Unit
main = do
  log "🍝"
