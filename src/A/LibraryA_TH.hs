{-# LANGUAGE CApiFFI              #-}
{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE DerivingStrategies   #-}
{-# LANGUAGE DerivingVia          #-}
{-# LANGUAGE MagicHash            #-}
{-# LANGUAGE OverloadedLabels     #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE UndecidableInstances #-}

module LibraryA_TH where

import HsBindgen.TH
import Optics

let cfg :: Config
    cfg = def & #clang % #extraIncludeDirs .~ [Pkg "cbits"]
 in withHsBindgen cfg def $
       hashInclude "library_a.h"