#!/bin/bash

cabal run -- hs-bindgen-cli preprocess \
  --overwrite-files \
  --unique-id com.well-typed.hs-bindgen-0.1-alpha-blogpost \
  --enable-record-dot \
  --hs-output-dir generated/A \
  --module LibraryA \
  -I "$(pwd)/cbits" library_a.h \
  --gen-binding-spec libraryA.yaml

cabal run -- hs-bindgen-cli preprocess \
  --overwrite-files \
  --unique-id com.well-typed.hs-bindgen-0.1-alpha-blogpost \
  --enable-record-dot \
  --hs-output-dir generated/B \
  --module LibraryB \
  --external-binding-spec libraryA.yaml \
  -I "$(pwd)/cbits" library_b.h
