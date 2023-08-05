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
  (concatenate (map (lambda (file)
                     (vector->list (read-json #"assets/json/dish/~|file|.json")))
                files))))

(define (write-dishes dishes)
 (for-each (lambda (dish)
            (write-dish-file dish))
  dishes))

(define (write-dish-file dish)
 (let ((file #"../hugodimsum/content/dishes/~(text (cantonese dish)).md"))
  (call-with-output-file file (lambda (out)
                               (write-dish dish out)))))

(define (write-dish-header dish out)
 (write-string "---" out)
 (newline out)
 (write-string #"title: \"~(english dish)\"" out)
 (newline out)
 (let ((tags (tags dish)))
  (if tags
   (let ((qtags (map (lambda (tag) #"\"~tag\"") tags)))
    (write-string #"tags: [~(comma-list qtags)]" out))))
 (newline out)
 (write-string #"showDate: false" out)
 (newline out)
 (write-string "---" out)
 (news out))

(define (write-dish dish out)
 (write-dish-header dish out)
 (write-dish-chinese dish out)
 (write-dish-simplified dish out)
 ; (write-string #"{{< figure src=\"images/~(image-name dish).jpg\" title=\"~(image-place dish)\" >}}" out)
 (embed (image-place dish) #"images/~(image-name dish).jpg" out)
 (news out)
 (write-dish-description dish out))

(define (write-dish-chinese dish out)
 (h1 "Chinese" out)
 (write-dish-cantonese dish out)
 (write-dish-mandarin dish out)
 )

(define (write-dish-cantonese dish out)
 (h2 "Cantonese" out)
 (write-string (text (cantonese dish)) out)
 (news out)
 (if (yale dish)
  (write-string (yale dish) out)
  (write-string "Missing Yale" out))
 (news out))

(define (write-dish-mandarin dish out)
 (h2 "Mandarin" out)
 (write-string (text (mandarin dish)) out)
 (news out)
 (if (pinyin dish)
  (write-string (pinyin dish) out)
  (write-string "Missing Pinyin" out))
 (news out))

(define (write-dish-simplified dish out)
 (h2 "Simplified" out)
 (write-string (text (simplified dish)) out)
 (news out))

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
 (or (res-value "Mandarin" (word dish))
  (cantonese dish)))

(define (simplified dish)
 (or (res-value "Simplified" (word dish))
  (mandarin dish)))

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

(define (tags dish)
 (res-value "tags" dish))

; categories

(define (read-cats)
 (let ((words (read-json "assets/json/dish/categories.json")))))
