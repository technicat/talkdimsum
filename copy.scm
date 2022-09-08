#!/usr/local/bin/gosh

(use file.util)

; copy assets to flutter project

(copy-directory* "assets" "../dartdimsum/assets" :if-exists :supersede)

; copy assets to swift project

(copy-directory* "assets/json/dish" "../swiftdimsum/Fugu Dim Sum/dishes" :if-exists :supersede)

(copy-directory* "assets/json/place" "../swiftdimsum/Fugu Dim Sum/places" :if-exists :supersede)

(copy-directory* "assets/json/resources" "../swiftdimsum/Fugu Dim Sum/resources" :if-exists :supersede)

(copy-directory* "assets/json/words" "../swiftdimsum/Fugu Dim Sum/words" :if-exists :supersede)

(copy-directory* "assets/json/phrases" "../swiftdimsum/Fugu Dim Sum/phrases" :if-exists :supersede)