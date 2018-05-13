module Angle
  ( Angle
  , fromDegrees
  , fromPiRadians
  , fromRadians
  , toDegrees
  , toPiRadians
  , toRadians
  ) where

import Prelude
  ( Float
  , ($)
  , (*)
  , (/)
  , pi
  , undefined
  )

newtype Angle = Angle Float

fromDegrees :: Float -> Angle
fromDegrees x = Angle $ x * pi / 180

fromPiRadians :: Float -> Angle
fromPiRadians x = undefined

fromRadians :: Float -> Angle
fromRadians x = Angle x

toDegrees :: Angle -> Float
toDegrees (Angle x) = x * 180 / pi

toPiRadians :: Angle -> Float
toPiRadians (Angle x) = undefined

toRadians :: Angle -> Float
toRadians (Angle x) = x
