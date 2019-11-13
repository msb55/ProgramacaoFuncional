{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import Yesod hiding (get)
import Test.Robot

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/left LeftR GET
/right RightR GET
/up UpR GET
/down DownR GET
|]

instance Yesod HelloWorld
    
getLeftR :: HandlerFor HelloWorld ()
getLeftR = liftIO $ (runRobot $ tap _Left)

getRightR :: HandlerFor HelloWorld ()
getRightR = liftIO $ (runRobot $ tap _Right)

getUpR :: HandlerFor HelloWorld ()
getUpR = liftIO $ (runRobot $ tap _Up)

getDownR :: HandlerFor HelloWorld ()
getDownR = liftIO $ (runRobot $ tap _Down)

main :: IO ()
main = warp 3000 HelloWorld