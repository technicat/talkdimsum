#!/usr/local/bin/gosh

; copy assets to flutter and swift projects

(use file.util)

(copy-directory* "assets" "../dartdimsum/assets" :if-exists :supersede)

(copy-directory* "assets/json/dish" "../swiftdimsum/Fugu Dim Sum/dishes" :if-exists :supersede)