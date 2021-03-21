(define (problem p5)
(:domain blocks)
(:objects
p a t e r - block)

(:init
(HANDEMPTY)
(ONTABLE r)
(CLEAR t)
(ON p r)
(ON a p)
(ON e a)
(ON t e)
(= (total-cost) 0)
)

(:goal (and
(HYOPTHESIS)
)
)
(:metric minimize (total-cost))
)
