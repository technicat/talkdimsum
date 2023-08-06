#!/usr/local/bin/gosh

; convert json files for hugo website

(use file.util)
(use gauche.array)
(use gauche.collection)
(use gauche.parseopt)
(use rfc.json)
(use scheme.list)
(use scheme.set)

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
    (if o (write-dishes (reverse dishes)))))))

(define (help file)
 (print "hugo.scm -o -v -i -h"))

(define (copy-images)
 (copy-directory* "assets/images" "../hugodimsum/assets/images" :if-exists :supersede))

(define (read-dishes)
 (let ((files (read-json "assets/json/dishes.json")))
  (concatenate (map (lambda (file)
                     (vector->list (read-json #"assets/json/dish/~|file|.json")))
                files))))

(define (write-dishes dishes)
 (let ((cats (read-cats)))
  (for-each (lambda (dish)
             (write-dish-file dish cats))
   dishes)))

(define (write-dish-file dish cats)
 (let ((file #"../hugodimsum/content/dishes/~(text (cantonese dish)).md"))
  (call-with-output-file file (lambda (out)
                               (write-dish dish out cats)))))


(define (write-dish dish out cats)
 (write-dish-header dish out cats)
 (write-dish-embed dish out)
 (write-dish-chinese dish out)
 ; (write-string #"{{< figure src=\"images/~(image-name dish).jpg\" title=\"~(image-place dish)\" >}}" out)
 (write-dish-description dish out))

(define (write-dish-embed dish out)
 (news out)
 (embed (image-place dish) #"images/~(image-name dish).jpg" out)
 (news out))

; header

(define (write-dish-header dish out cats)
 (write-string "---" out)
 (newline out)
 (write-dish-title dish out)
 (write-dish-cats dish out cats)
 (write-dish-tags dish out)
 (write-string #"showDate: false" out)
 (newline out)
 (write-string "---" out)
 (news out))

(define (write-dish-title dish out)
 (write-string #"title: \"~(english dish)\"" out)
 (newline out))

(define (write-dish-tags dish out)
 (let ((tags (tags dish)))
  (if tags
   (let ((qtags (map (lambda (tag) #"\"~tag\"") tags)))
    (write-string #"tags: [~(comma-list qtags)]" out)))
  (newline out)))

(define (write-dish-cats dish out cats)
 (let ((tags (tags dish)))
  (if tags
   (let ((qcats (map (lambda (cat) #"\"~cat\"")
                 (lset-intersection equal?
                  (vector->list cats )
                  (vector->list tags)))))
    (write-string #"categories: [~(comma-list qcats)]" out)
    (newline out)))))

(define (write-dish-date dish out)
 (write-string #"showDate: false" out)
 (newline out))

(define (write-dish-chinese dish out)
 (h2"Chinese" out)
 (write-dish-cantonese dish out)
 (write-dish-mandarin dish out)
 (write-dish-simplified dish out))

(define (write-dish-cantonese dish out)
 (h3 "Cantonese" out)
 (write-string (text (cantonese dish)) out)
 (news out)
 (if (yale dish)
  (write-string (yale dish) out)
  (write-string "Missing Yale" out))
 (news out))

(define (write-dish-mandarin dish out)
 (h3 "Mandarin" out)
 (write-string (text (mandarin dish)) out)
 (news out)
 (if (pinyin dish)
  (write-string (pinyin dish) out)
  (write-string "Missing Pinyin" out))
 (news out))

(define (write-dish-simplified dish out)
 (h3 "Simplified" out)
 (write-string (text (simplified dish)) out)
 (news out))

(define (write-dish-description dish out)
 (h2 "Description" out)
 (write-string (description dish) out)
 (news out)
 (let ((wd (word-description dish)))
  (if wd
   (begin
    (news out)
    (h3 "Characters" out)
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

(define (refs dish)
 (res-value "refs" dish))

(define (ref-name ref)
 (res-value "name" ref))

(define (ref-url ref)
 (res-value "URL" ref))

; categories

(define (read-cats)
 (read-json "assets/json/categories.json"))
