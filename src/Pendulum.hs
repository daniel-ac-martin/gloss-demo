module Pendulum
  ( Angle.Angle
  , Angle.fromDegrees
  , Angle.fromPiRadians
  , Angle.fromRadians
  , Angle.toDegrees
  , Angle.toPiRadians
  , Angle.toRadians
  , Pendulum(..)
  , State(..)
  , StepSize
  , step
  ) where

import qualified Angle as Angle
  ( Angle
  , fromDegrees
  , fromPiRadians
  , fromRadians
  , toDegrees
  , toPiRadians
  , toRadians
  )

data Pendulum = Pendulum
  { length :: Float
  , mass :: Float
  }

data State = State
  { angle :: Angle.Angle
  , angularVelocity :: Angle.Angle
  }

type StepSize = Float

step :: Pendulum -> StepSize -> State -> State
step p delta s = State
  { angle = Angle.fromRadians . (+ delta) . Angle.toRadians . angle $ s
  , angularVelocity = angularVelocity s
  }
