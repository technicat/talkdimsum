#!/usr/local/bin/gosh

(use file.util)

; copy assets to flutter project

;(copy-directory* "assets" "../dartdimsum/assets" :if-exists :supersede)

; copy assets to swift project

(copy-directory* "assets/json" "../swiftdimsum/Fugu Dim Sum/json" :if-exists :supersede)