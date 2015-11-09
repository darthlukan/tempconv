#!/usr/bin/guile \
-e main -s
!#

(use-modules (ice-9 format))


(define celcius
  (lambda (t)
    (/ (* (- t 32) 5) 9)))


(define fahrenheit
  (lambda (t)
    (+ (* 9/5 t) 32)))


(define convert-temp
  (lambda (t u)
    (cond 
      [(string-ci=? u "f") (format #f "~1,2fC"  (celcius t))]
      [(string-ci=? u "c") (format #f "~1,2fF"  (fahrenheit t))])))


(define yank-unit
  (lambda (s)
    (string-take-right s 1)))


(define yank-temp
  (lambda (s)
    (string->number (string-drop-right s 1))))


(define (main args)
  (map
    (lambda (arg)
      (display (convert-temp (yank-temp arg) (yank-unit arg))) (display " "))
    (cdr args))
    (newline))
