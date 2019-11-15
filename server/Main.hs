{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import Yesod hiding (get)
import Test.Robot

data ArcaServer = ArcaServer

mkYesod "ArcaServer" [parseRoutes|
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

instance Yesod ArcaServer
    
getLeftR :: HandlerFor ArcaServer ()
getLeftR = liftIO $ (runRobot $ tap _Left)

getRightR :: HandlerFor ArcaServer ()
getRightR = liftIO $ (runRobot $ tap _Right)

getUpR :: HandlerFor ArcaServer ()
getUpR = liftIO $ (runRobot $ tap _Up)

getDownR :: HandlerFor ArcaServer ()
getDownR = liftIO $ (runRobot $ tap _Down)

getEasyR :: HandlerFor ArcaServer ()
getEasyR = liftIO $ (runRobot $ tap _1)

getMediumR :: HandlerFor ArcaServer ()
getMediumR = liftIO $ (runRobot $ tap _2)

getHardR :: HandlerFor ArcaServer ()
getHardR = liftIO $ (runRobot $ tap _3)

getPotionR :: HandlerFor ArcaServer ()
getPotionR = liftIO $ (runRobot $ tap _P)

getStatusR :: HandlerFor ArcaServer String
getStatusR = liftIO $ (readFile "../status")

main :: IO ()
main = warp 3000 ArcaServer