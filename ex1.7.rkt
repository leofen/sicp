#lang racket

(define (mysqrt x)
  (mysqrt_iter 1.0 x))

(define (mysqrt_iter guess x)
  (if (good_enough guess x)
      guess
      (mysqrt_iter (improve guess x) x)))

(define (good_enough guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))