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
/easy EasyR GET
/medium MediumR GET
/hard HardR GET
/potion PotionR GET
/status StatusR GET
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

getEasyR :: HandlerFor HelloWorld ()
getEasyR = liftIO $ (runRobot $ tap _1)

getMediumR :: HandlerFor HelloWorld ()
getMediumR = liftIO $ (runRobot $ tap _2)

getHardR :: HandlerFor HelloWorld ()
getHardR = liftIO $ (runRobot $ tap _3)

getPotionR :: HandlerFor HelloWorld ()
getPotionR = liftIO $ (runRobot $ tap _P)

getStatusR :: HandlerFor HelloWorld String
getStatusR = liftIO $ (readFile "../status")

main :: IO ()
main = warp 3000 HelloWorld