{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "02-data-structures"
, dependencies = [ "spec", "console", "effect", "psci-support", "prelude", "aff" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
