{-# LANGUAGE OverloadedLabels #-}

module Main where

import Control.Monad
import Data.IORef
import Foreign
import Optics

import HsBindgen.Runtime.Prelude

import LibraryA
import LibraryA.Safe
import LibraryB
import LibraryB.Safe
import LibraryA_TH qualified as A_TH

main :: IO ()
main = do
    showVersion $ Version 2 3

    alloca $ \(driverPtr :: Ptr Driver) -> do
      initDriver driverPtr

      driver <- peek driverPtr
      poke driverPtr $ driver & #version % #minor .~ 2
      showDriver driverPtr

      poke driverPtr.version.minor 3
      showDriver driverPtr

      counter <- newIORef 0
      let run :: RunDriver
          run = RunDriver $ \_self ->
                  atomicModifyIORef counter $ \x -> (succ x, x)
      withFunPtr run $ \funPtr -> do
        poke driverPtr.run funPtr
        replicateM_ 5 $ print =<< callDriver driverPtr

    A_TH.showVersion $ A_TH.Version 2 3

inputPort :: Ptr Word8 -> Ptr Word8
inputPort = iNPUT_PORT
