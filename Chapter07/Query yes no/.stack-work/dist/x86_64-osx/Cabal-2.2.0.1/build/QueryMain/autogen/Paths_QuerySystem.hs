{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_QuerySystem (
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
version = Version [0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/bin"
libdir     = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/lib/x86_64-osx-ghc-8.4.4/QuerySystem-0.1-AusLeB5Xm94EosqfsD350a-QueryMain"
dynlibdir  = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/lib/x86_64-osx-ghc-8.4.4"
datadir    = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/share/x86_64-osx-ghc-8.4.4/QuerySystem-0.1"
libexecdir = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/libexec/x86_64-osx-ghc-8.4.4/QuerySystem-0.1"
sysconfdir = "/Users/regina/Code/GrammaticalFramework_book/Chapter07/Query yes no/.stack-work/install/x86_64-osx/a01d0040609cfe3f1b7110b5b4af8bf87655f235385c498da44799ad26d49a09/8.4.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "QuerySystem_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "QuerySystem_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "QuerySystem_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "QuerySystem_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "QuerySystem_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "QuerySystem_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
