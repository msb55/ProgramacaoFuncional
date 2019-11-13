{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_ArcaWeb (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/bin"
libdir     = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2/ArcaWeb-0.1.0.0"
dynlibdir  = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/share/x86_64-linux-ghc-8.0.2/ArcaWeb-0.1.0.0"
libexecdir = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/libexec"
sysconfdir = "/home/marcos/Documentos/Programa\231\227o Funcional/ProgramacaoFuncional/ArcaWeb/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ArcaWeb_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ArcaWeb_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ArcaWeb_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ArcaWeb_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ArcaWeb_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ArcaWeb_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
