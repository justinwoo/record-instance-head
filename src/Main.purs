module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Prim.Row as Row
import Record as Record
import Type.Prelude (class TypeEquals, SProxy(..), from)

class MyClass a where
  method :: a -> String

-- -- with Prim type constructor Record
-- instance myClassRecord ::
--   ( Row.Cons "hi" String tail row
--   , TypeEquals (Record (hi :: String | tail)) (Record row)
--   ) => MyClass (Record row) where
--   method r = Record.get (SProxy :: _ "hi") r'
--     where
--       r' = from r

-- with brace syntax sugar
instance myClassRecord ::
  ( TypeEquals { hi :: String | tail } { | row }
  ) => MyClass { | row } where
  method r = (from r).hi -- don't need Record.get if concretely known anyway

main :: Effect Unit
main = do
  log "Hello sailor!"
