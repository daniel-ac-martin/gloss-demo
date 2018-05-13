module Main where

import Prelude
  ( Float
  , Int
  , IO
  , String
  , (.)
  , ($)
  , (*)
  , (/)
  , (+)
  , (-)
  , cos
  , fromIntegral
  , sin
  )

import qualified Graphics.Gloss as Gloss (Color, Display(InWindow), Picture(Circle, Color, Line), Point, black, simulate, white)
import qualified Graphics.Gloss.Data.ViewPort as Gloss (ViewPort)
import qualified Pendulum as Pendulum
  ( Angle
  , Pendulum(Pendulum)
  , State(State, angle, angularVelocity)
  , fromDegrees
  , step
  , toRadians
  )

name :: String
name = "Pendulum"

pendulumDisplayLength :: Int
pendulumDisplayLength = 150

pendulumDisplayPadding :: Int
pendulumDisplayPadding = 10

main :: IO ()
main = Gloss.simulate display background fps initialModel render step
  where
    background :: Gloss.Color
    background = Gloss.black
    display :: Gloss.Display
    display = Gloss.InWindow name windowSize windowPosition
      where
        windowSize :: (Int, Int)
        windowSize = (l, l)
          where
            l :: Int
            l = 2 * (pendulumDisplayLength + pendulumDisplayPadding)
        windowPosition :: (Int, Int)
        windowPosition = (0, 0)
    fps :: Int
    fps = 30
    initialModel :: Pendulum.State
    initialModel = Pendulum.State
      { Pendulum.angle = Pendulum.fromDegrees 30
      , Pendulum.angularVelocity = Pendulum.fromDegrees 0
      }
    render :: Pendulum.State -> Gloss.Picture
    render s = Gloss.Color Gloss.white $ Gloss.Line [pivot, mass]
      where
        pivot :: Gloss.Point
        pivot = (originX, originY)
        mass :: Gloss.Point
        mass = (massX, massY)
        originX :: Float
        originX = 0
        originY :: Float
        originY = 0
        massX :: Float
        massX = originX + length * sin(theta)
        massY :: Float
        massY = originY - length * cos(theta)
        length :: Float
        length = fromIntegral pendulumDisplayLength
        theta :: Float
        theta = Pendulum.toRadians . Pendulum.angle $ s
    step :: Gloss.ViewPort -> Float -> Pendulum.State -> Pendulum.State
    step _ _ = Pendulum.step pendulum size
      where
        pendulum :: Pendulum.Pendulum
        pendulum = Pendulum.Pendulum length mass
          where
            length :: Float
            length = 1
            mass :: Float
            mass = 1
        size :: Float
        size = 1 / fromIntegral fps
