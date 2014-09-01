#lang racket

(define (bigger_two_of_three x y z) 
  (cond ((and (<= x y) (<= x z)) (+ y z))
        ((and (<= y x) (<= y z)) (+ x z))
        ((and (<= z x) (<= z y)) (+ x y))))

(bigger_two_of_three 2 3 23)