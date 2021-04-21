(define (domain hanoi)
	(:requirements :strips)
	(:types )
	(:constants )
	(:predicates
		(split )
		(unsplit )
		(g0_done___ )
		(g0_clear ?x)
		(g0_on ?x ?y)
		(g0_smaller ?x ?y)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_on d8 peg1) (g0_on d7 d8) (g0_on d6 d7) (g0_on d5 d6) (g0_on d4 d5) (g0_on d3 d4) (g0_on d2 d3) (g0_on d1 d2))
	:effect (and (g0_done___ ))
)
(:action gGLOBAL_move
	:parameters (?disc ?from ?to)
	:precondition (and (unsplit ) (g0_smaller ?to ?disc) (g0_on ?disc ?from) (g0_clear ?disc) (g0_clear ?to))
	:effect (and (g0_clear ?from) (g0_on ?disc ?to) (not (g0_on ?disc ?from)) (not (g0_clear ?to)) (increase (total-cost ) 1))
)
(:action g0_move
	:parameters (?disc ?from ?to)
	:precondition (and (g0_smaller ?to ?disc) (g0_on ?disc ?from) (g0_clear ?disc) (g0_clear ?to) (split ))
	:effect (and (g0_clear ?from) (g0_on ?disc ?to) (not (g0_on ?disc ?from)) (not (g0_clear ?to)))
)
)