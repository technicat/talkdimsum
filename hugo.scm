#!/usr/local/bin/gosh

; convert json files to hugo

(use file.util)
(use gauche.collection)
(use gauche.parseopt)
(use rfc.json)

(define (main args)
 (let-args (cdr args)
  ((h "h|help" => (cut help (car args)))
   (f "f|file=s")
   (o "o|out=s")
   (v "v|verbose")
   . restargs)
  (if (not h)
    (let ((r (read-categories "assets/json/dish/categories.json")))
     (if v (print r))
     (if o
        (write-categories r o))))))

(define (help file)
 (print "dimsum.scm -f file -o outfile -v -h"))

(define (read-categories file)
 (guard (e (else (print #"JSON error in ~file")
            (print (condition-message e))
            #\f))
  ; assume one json obj, otherwise use parse-json*
  (let ((exp (call-with-input-file file parse-json)))
   exp)))

(define (write-categories r file)
 (call-with-output-file file
  (lambda (out)
    (for-each (lambda (r) (markdown-profile r out)) p))))