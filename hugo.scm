#!/usr/local/bin/gosh

; convert json files to hugo

(use file.util)
(use gauche.collection)
(use gauche.parseopt)
(use rfc.json)

(include "../schematic/lib/json.scm")

(define (main args)
 (let-args (cdr args)
  ((h "h|help" => (cut help (car args)))
   (f "f|file=s")
   (o "o|out=s")
   (v "v|verbose")
   . restargs)
  (if (not h)
   (let ((dishes (read-dishes)))
    (if v (print dishes))))))

(define (help file)
 (print "dimsum.scm -f file -o outfile -v -h"))

(define (read-dishes)
 (let ((files (read-json "assets/json/dish/dishes.json")))
  (fold 'concat (map (lambda (file)
                      (read-json #"assets/json/dish/~|file|.json"))
                 files) [])))

(define (write-dishes dishes)
 (for-each (lambda (dish)
            (write-dish-file dish)
            dishes)))

(define (write-dish-file dish)
 (let ((file #"../hugodimsum/talkdimsum/dishes/~(cantonese dish)"))
  (call-with-output-file file (lambda (out)
                               (write-dish dish out)))))

(define (write-dish dish out)
 (h1 (english dish) out))

(define (read-cats)
 (let ((words (read-json "assets/json/dish/categories.json")))))

(define (word dish)
 (res-value "word" dish))

(define (english dish)
 (res-value "English" (word dish)))

(define (cantonese dish)
 (res-value "Cantonese" (word dish)))

(define (text chinese)
 (if (string? chinese)
  chinese
  (res-value "text" chinese)))


