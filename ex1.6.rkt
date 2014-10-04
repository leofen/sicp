#lang racket

(define (new_if predicate then_clause else_clause)
  (cond (predicate then_clause)
        (else else_clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good_enough guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt_iter guess x)
  (if (good_enough guess x)
  guess
  (sqrt_iter (improve guess x) x)))

(define (mysqrt x)
  (sqrt_iter 1.0 x))

(define (sqrt_iter_cond guess x)
  (cond ((good_enough guess x) guess)
        (else (sqrt_iter_cond (improve guess x) x))))

(define (mysqrt_cond x)
  (sqrt_iter_cond 1.0 x))

(define (sqrt_iter_new_if guess x)
  (new_if (good_enough guess x)
          guess
          (sqrt_iter_new_if (improve guess x) x)))

(define (mysqrt_new_if x)
  (sqrt_iter_new_if 1.0 x))

;可以看到无论直接用 if 还是直接用 cond 都能正确计算，但用函数包装过的模拟 if 的 cond 就不行，
;因为 if 和 cond 都是语法规定了先判断再求值，而普通函数的做法是完全展开再带入求值，所以会造成无限递归。