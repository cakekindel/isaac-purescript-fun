module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (log)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)

import Main

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "addInts" do
    it "`addInts 2 2` should equal `4`" do
      (addInts 2 2) `shouldEqual` 4
    it "`addInts 0 0` should equal `0`" do
      (addInts 0 0) `shouldEqual` 0

  describe "addTwo" do
    it "`addTwo 2` should equal `4`" do
      (addTwo 2) `shouldEqual` 4

  
  describe "mulInts" do
    it "`mulInts 0 0` should equal `0`" do
      (mulInts 0 0) `shouldEqual` 0
    it "`mulInts 10 0` should equal `0`" do
      (mulInts 10 0) `shouldEqual` 0
    it "`mulInts 10 2` should equal `20`" do
      (mulInts 10 2) `shouldEqual` 20
  
