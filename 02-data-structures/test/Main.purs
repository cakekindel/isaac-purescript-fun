module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (log)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual, fail)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

import Main

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "Option#omap" do
    it "omap None should still be None" do
      let none  = None :: Option Int
      let none' = omap (\_ -> 12) none
      case none' of
        Some int -> fail $ "expected None, got Some " <> (show int)
        None -> pure unit
    it "omap Some should change value" do
      let some  = Some 12
      let some' = omap (\n -> n + 12) some
      case some' of
        Some 24 -> pure unit
        Some int -> fail $ "expected Some 24, got Some " <> (show int)
        None -> fail $ "expected Some 24, got None"

  {-
  describe "Option#andThen" do
    it "andThen None should still be None" do
      let none  = None :: Option Int
      let none' = andThen (\_ -> Some 12) none
      case none' of
        Some int -> fail $ "expected None, got Some " <> (show int)
        None -> pure unit
    it "andThen Some should return Some when callback returns Some" do
      let some  = Some 12
      let some' = andThen (\n -> Some (n + 12)) some
      case some' of
        Some 24 -> pure unit
        Some int -> fail $ "expected Some 24, got Some " <> (show int)
        None -> fail $ "expected Some 24, got None"
    it "andThen Some should return None when callback returns None" do
      let some  = Some 12
      let some' = andThen (\n -> None :: Option Int) some
      case some' of
        Some int -> fail $ "expected None, got Some " <> (show int)
        None -> pure unit
  -}
