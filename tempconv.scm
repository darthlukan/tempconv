#!/usr/bin/guile \
-e main -s
!#


(define celcius
  (lambda (t)
    (round (/ (* (- t 32) 5) 9))))


(define fahrenheit
  (lambda (t)
    (round (+ (/ (* t 9) 5) 32))))


(define convert-temp
  (lambda (t u)
    (cond 
      [(char-ci=? u #\f) (string-append "" (number->string (celcius t)) "C")]
      [(char-ci=? u #\c) (string-append "" (number->string (fahrenheit t)) "F")])))


(define yank-unit
  (lambda (s)
    (string-ref s (- (string-length s) 1))))


(define yank-temp
  (lambda (s)
    (string->number (substring s 0 (- (string-length s) 1)))))


(define (main args)
  (map
    (lambda (arg)
      (display (convert-temp (yank-temp arg) (yank-unit arg))) (display " "))
    (cdr args))
    (newline))
