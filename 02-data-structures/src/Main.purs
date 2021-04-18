module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

data Option a = None | Some a

omap :: forall a b. (a -> b) -> Option a -> Option b
omap func = andThen (func >>> Some)

andThen :: forall a b. (a -> Option b) -> Option a -> Option b
andThen func option = 
  case option of 
    Some a -> (func a)
    None -> None

main :: Effect Unit
main = do
  log "🍝"
