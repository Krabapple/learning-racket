;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname cross) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
#|
HtDP Exercise 17.1.2.
Develop cross. The function consumes a list of symbols and a list of numbers and produces all possible pairs of symbols and numbers.
Example:
(cross '(a b c) '(1 2))
;; expected value: 
(list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 2))
|#

#| 17.1.2 Develop cross
------------------------------------------------------------
;Data Definition:
A list-of-numbers is either
  1. empty or
  2. (cons n lon) 
     where n is a number and lon is a list-of-numbers

A list-of-symbols is either 
  1. empty or
  2. (cons s los) 
     where s is a symbol and los is a list-of-symbols

A pair is
  (list s n)
  where s is a symbol and n is a number

A list-of-pairs is either
  1. empty or
  2. (cons p lop) 
     where p is a pair and lop is a list-of-pairs

;list template:
(define (cross alos alon)
  (cond
    [(empty? alos) ...]
    [else ... (first alos)... 
          ... (cross (rest alos) alon)... ]
|#

;;cross: list-of-symbols list-of-numbers -> list-of-pairs
;;consumes a list of symbols and a list of numbers and 
;;produces all possible pairs of symbols and numbers
(define (cross alos alon)
  (cond
    [(empty? alos) 
     empty]
    [else 
     (append (make-pairs (first alos) alon) 
             (cross (rest alos) alon))]))

;Tests:
(check-expect 
 (cross empty empty)
 empty)

(check-expect 
 (cross empty (list 1 2 3))
 empty)

(check-expect 
 (cross (list 'a 'b 'c) empty)
 empty)

(check-expect 
 (cross (list 'a) (list 1 2 3))
 (list (list 'a 1) (list 'a 2) (list 'a 3)))

(check-expect 
 (cross (list 'a 'b) (list 1 2 3))
 (list (list 'a 1) (list 'a 2) (list 'a 3) 
       (list 'b 1) (list 'b 2) (list 'b 3)))

(check-expect 
 (cross (list 'a 'b 'c) (list 1 2 3))
 (list (list 'a 1) (list 'a 2) (list 'a 3) 
       (list 'b 1) (list 'b 2) (list 'b 3)
       (list 'c 1) (list 'c 2) (list 'c 3)))

#| We need a helper function that will build a list-of-pairs
------------------------------------------------------------
;list template:
(define (make-pairs asymbol alon)
  (cond
    [(empty? alon)...]
    [else ... (first alon)...
          ... (make-pairs asymbol (rest alon))...]))
|#

;;make-pairs: symbol list-of-numbers -> list-of-pairs
;;consumes a symbol and a list-of-numbers and produces 
;;a list of pairs that contain the symbol and each of 
;;the numbers in the list-of-numbers
(define (make-pairs asymbol alon)
  (cond
    [(empty? alon) 
     empty]
    [else 
     (cons (list asymbol (first alon))
           (make-pairs asymbol (rest alon)))]))

;Tests:
(check-expect 
 (make-pairs 'a empty)
 empty)

(check-expect 
 (make-pairs 'a (list 1))
 (list (list 'a 1)))

(check-expect 
 (make-pairs 'a (list 1 2))
 (list (list 'a 1) (list 'a 2)))

(check-expect 
 (make-pairs 'a (list 1 2 3))
 (list (list 'a 1) (list 'a 2) (list 'a 3)))