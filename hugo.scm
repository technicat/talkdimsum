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
    (let ((cats (read-json "assets/json/dish/categories.json"))
      (dishes (read-json "assets/json/dish/dishes.json")))
     (if v (print cats))
       (if v (print dishes))
     (if o
        (write-categories cats o))))))

(define (help file)
 (print "dimsum.scm -f file -o outfile -v -h"))

(define (write-categories r file)
 (call-with-output-file file
  (lambda (out)
    (for-each (lambda (r) (markdown-profile r out)) p))))