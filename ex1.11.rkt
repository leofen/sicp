#lang racket

(define (f_recur n)
  (if (< n 3)
      n
      (+ (f_recur (- n 1)) (* 2 (f_recur (- n 2))) (* 3 (f_recur (- n 3))))))

(define (f_iter n)
  (define (_f_iter a b c count)
    (if (= 0 count)
        c
        (_f_iter b c (+ c (* 2 b) (* 3 a)) (- count 1)))
  )
  (if (< n 3)
      n
      (_f_iter 0 1 2 (- n 2)))
)