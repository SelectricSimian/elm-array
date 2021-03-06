module ControlUtils
  ( untilJust
  , whileJust
  ) where

untilJust : (a -> Maybe b) -> (a -> a) -> a -> b
untilJust condition f init =
  case condition init of
    Just result -> result
    Nothing -> untilJust condition f (f init)

whileJust : (a -> Maybe (b, a)) -> a -> List b
whileJust f init =
  case f init of
    Just (result, new) -> result :: whileJust f new
    Nothing -> []
