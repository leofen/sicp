#lang racket

(define (p) (p))

(define (test x y)
  (if ( = x 0)
      0
      y))

(test 0 (p))

;可以看出使用的是应用序，因为它在不断试图展开（p），自然是死循环，如果是正则序，先展开以后，因为发现 x 就是0，就直接返回了