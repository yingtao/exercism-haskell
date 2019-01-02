{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_word_count (
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
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/bin"
libdir     = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/lib/x86_64-osx-ghc-8.4.3/word-count-1.2.0.6-5Bd1aaWj4D0Gz5O096llDu-test"
dynlibdir  = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/lib/x86_64-osx-ghc-8.4.3"
datadir    = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/share/x86_64-osx-ghc-8.4.3/word-count-1.2.0.6"
libexecdir = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/libexec/x86_64-osx-ghc-8.4.3/word-count-1.2.0.6"
sysconfdir = "/Users/jiangyi/exercism/haskell/word-count/.stack-work/install/x86_64-osx/lts-12.4/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "word_count_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "word_count_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "word_count_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "word_count_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "word_count_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "word_count_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
