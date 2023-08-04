#!/usr/local/bin/gosh

; convert json files for hugo website

(use file.util)
(use gauche.array)
(use gauche.collection)
(use gauche.parseopt)
(use rfc.json)

(include "../schematic/lib/json.scm")
(include "../schematic/lib/md.scm")

(define (main args)
 (let-args (cdr args)
  ((h "h|help" => (cut help (car args)))
   (f "f|file=s")
   (i "i|image")
   (o "o|out")
   (v "v|verbose")
   . restargs)
  (if (not h)
   (let ((dishes (read-dishes)))
    (if i (copy-images))
    (if v (print dishes))
    (if o (write-dishes dishes))))))

(define (help file)
 (print "hugo.scm -o -v -i -h"))

(define (copy-images)
 (copy-directory* "assets/images" "../hugodimsum/content/dishes/images" :if-exists :supersede))

(define (read-dishes)
 (let ((files (read-json "assets/json/dishes.json")))
  (concatenate (vector->list (vector-map (lambda (file)
                                          (vector->list (read-json #"assets/json/dish/~|file|.json")))
                              files)))))

(define (write-dishes dishes)
 (for-each (lambda (dish)
            (write-dish-file dish))
  dishes))

(define (write-dish-file dish)
 (let ((file #"../hugodimsum/content/dishes/~(text (cantonese dish)).md"))
  (call-with-output-file file (lambda (out)
                               (write-dish dish out)))))

(define (write-dish dish out)
 (write-string "---" out)
 (newline out)
 (write-string #"title: ~(english dish)" out)
 (newline out)
 (write-string #"showDate: false" out)
 (newline out)
 (write-string "---" out)
 (news out)
 (h1 "Chinese" out)
 (write-string #"Cantonese: ~(text (cantonese dish))" out)
 (news out)
 (if (yale dish)
  (write-string (yale dish) out)
  (write-string "Missing Yale" out))
 (news out)
 (embed (image-place dish) #"images/~(image-name dish)" out)
 (news out)
 (write-dish-description dish out))

(define (write-dish-description dish out)
 (h1 "Description" out)
 (write-string (description dish) out)
 (news out)
 (let ((wd (word-description dish)))
  (if wd
   (begin
    (news out)
    (h2 "Characters" out)
    (write-string (word-description dish) out)
    (newline out)))))

(define (word dish)
 (res-value "word" dish))

(define (english dish)
 (res-value "English" (word dish)))

(define (cantonese dish)
 (res-value "Cantonese" (word dish)))

(define (mandarin dish)
 (res-value "Mandarin" (word dish)))

(define (simplified dish)
 (res-value "Simplified" (word dish)))

(define (yale dish)
 (res-value "Yale" (word dish)))

(define (pinyin dish)
 (res-value "Pinyin" (word dish)))

(define (image dish)
 (vector-ref (res-value "images" dish) 0))

(define (image-name dish)
 (res-value "image" (image dish)))

(define (image-place dish)
 (res-value "place" (image dish)))

(define (text chinese)
 (if (string? chinese)
  chinese
  (res-value "text" chinese)))

(define (description dish)
 (res-value "description" dish))

(define (word-description dish)
 (res-value "description" (word dish)))

; categories

(define (read-cats)
 (let ((words (read-json "assets/json/dish/categories.json")))))
