#!/bin/bash

cabal run -- hs-bindgen-cli preprocess \
  --overwrite-files \
  --unique-id com.well-typed.hs-bindgen-0.1-alpha-blogpost \
  --enable-record-dot \
  --hs-output-dir generated/B \
  --module LibraryB \
  --prescriptive-binding-spec libraryB.yaml \
  -I "$(pwd)/cbits" library_b.h
