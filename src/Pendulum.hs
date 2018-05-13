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

import Prelude
  ( Float
  , (.)
  , ($)
  , (*)
  , (/)
  , (+)
  , sin
  )

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
  { angle = Angle.fromRadians $ theta + deltaTheta
  , angularVelocity = Angle.fromRadians $ omega + deltaOmega
  }
  where
    theta :: Float
    theta = Angle.toRadians . angle $ s
    omega :: Float
    omega = Angle.toRadians . angularVelocity $ s
    deltaTheta :: Float
    deltaTheta = delta * omega
    deltaOmega :: Float
    deltaOmega = delta * (-(g / l) * sin(theta))
      where
        g = 9.81
        l = length p
