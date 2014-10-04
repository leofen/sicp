#lang racket

(define (mycubic x)
  (mycubic_iter 1.0 x))

(define (mycubic_iter guess x)
  (if (good_enough guess x)
      guess
      (mycubic_iter (improve guess x) x)))

(define (good_enough guess x)
  (< (abs (- (improve guess x) guess)) 0.0001))

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 
     3))
