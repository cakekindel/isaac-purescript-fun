module Test.Main where

import Prelude

import Data.Array (snoc)
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
  {-
  describe "sum" do
    it "sum empty array should equal 0" do
      (sum []) `shouldEqual` 0
    it "sum 1-element array should equal that element" do
      (sum [1]) `shouldEqual` 1
    it "sum should sum" do
      (sum [1, 1]) `shouldEqual` 2
      (sum [1, 1, 1]) `shouldEqual` 3
      -}

  describe "reduce" do
    let copy = \cur acc -> snoc acc cur
    it "reduce should return accumulator on empty array" do
      (reduce copy [] []) `shouldEqual` []
    it "reduce should use reducer" do
      (reduce copy [] [1, 2, 3]) `shouldEqual` [1, 2, 3]
