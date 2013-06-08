--
--  Copyright © 2013 Edward O'Callaghan. All Rights Reserved.

module Idris.Target.Triple ( Triple
                           , tripleDefault
                           , setArch
                           , setVendor
                           , buildTriple
                           , setOS ) where

import Control.Monad.State

--
-- Canonical names?
data ArchType = UnknownArch | X86 | ARM | AVR
     deriving (Read, Show, Enum, Eq, Ord)

data VendorType = UnknownVendor | PC
     deriving (Read, Show, Enum, Eq, Ord)

data OSType = UnknownOS | Linux | Darwin | Win32
     deriving (Read, Show, Enum, Eq, Ord)

data EnviromentType = UnknownEnviroment | GNU | MarchO | ELF
     deriving (Read, Show, Enum, Eq, Ord)


--
--  .
data Triple = Triple { arch :: ArchType
                     , vendor :: VendorType
                     , os :: OSType
                     } deriving (Read, Show, Eq)

tripleDefault = Triple { arch = UnknownArch
                       , vendor = UnknownVendor
                       , os = UnknownOS
                       }


--
-- Mutators
setArch :: ArchType -> Triple -> Triple
setArch arch' t = t { arch = arch' }

setVendor :: VendorType -> Triple -> Triple
setVendor vendor' t = t { vendor = vendor' }

setOS :: OSType -> Triple -> Triple
setOS os' t = t { os = os' }

-- TODO: should we have a state monad for all this??
printTriple :: Triple -> IO ()
printTriple t = do
            putStr "Arch: "
            print (arch t)
            putStrLn ","
            putStr "Vendor: "
            print (vendor t)
            putStrLn ","
            putStr "OS: "
            print (os t)
            putStrLn "."

--
-- e.g. --triple=x86-linux-gnu
buildTriple :: String -> Triple
--buildTriple _ = tripleDefault
buildTriple _ = error "Unknown triple" -- FIXME: partial function
