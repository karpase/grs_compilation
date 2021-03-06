(define (domain ferry)
	(:requirements :strips)
	(:types )
	(:constants )
	(:predicates
		(split )
		(unsplit )
		(g0_done___ )
		(g1_done___ )
		(g2_done___ )
		(g3_done___ )
		(g4_done___ )
		(g5_done___ )
		(g6_done___ )
		(g0_not-eq ?x ?y)
		(g1_not-eq ?x ?y)
		(g2_not-eq ?x ?y)
		(g3_not-eq ?x ?y)
		(g4_not-eq ?x ?y)
		(g5_not-eq ?x ?y)
		(g6_not-eq ?x ?y)
		(g0_car ?c)
		(g1_car ?c)
		(g2_car ?c)
		(g3_car ?c)
		(g4_car ?c)
		(g5_car ?c)
		(g6_car ?c)
		(g0_location ?l)
		(g1_location ?l)
		(g2_location ?l)
		(g3_location ?l)
		(g4_location ?l)
		(g5_location ?l)
		(g6_location ?l)
		(g0_at-ferry ?l)
		(g1_at-ferry ?l)
		(g2_at-ferry ?l)
		(g3_at-ferry ?l)
		(g4_at-ferry ?l)
		(g5_at-ferry ?l)
		(g6_at-ferry ?l)
		(g0_at ?c ?l)
		(g1_at ?c ?l)
		(g2_at ?c ?l)
		(g3_at ?c ?l)
		(g4_at ?c ?l)
		(g5_at ?c ?l)
		(g6_at ?c ?l)
		(g0_empty-ferry )
		(g1_empty-ferry )
		(g2_empty-ferry )
		(g3_empty-ferry )
		(g4_empty-ferry )
		(g5_empty-ferry )
		(g6_empty-ferry )
		(g0_on ?c)
		(g1_on ?c)
		(g2_on ?c)
		(g3_on ?c)
		(g4_on ?c)
		(g5_on ?c)
		(g6_on ?c)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_at c0 l4))
	:effect (and (g0_done___ ))
)
(:action mark-done-g1
	:parameters ()
	:precondition (and (split ) (g1_at c1 l10))
	:effect (and (g1_done___ ))
)
(:action mark-done-g2
	:parameters ()
	:precondition (and (split ) (g2_at c2 l0))
	:effect (and (g2_done___ ))
)
(:action mark-done-g3
	:parameters ()
	:precondition (and (split ) (g3_at c3 l5))
	:effect (and (g3_done___ ))
)
(:action mark-done-g4
	:parameters ()
	:precondition (and (split ) (g4_at c4 l8))
	:effect (and (g4_done___ ))
)
(:action mark-done-g5
	:parameters ()
	:precondition (and (split ) (g5_at c5 l9))
	:effect (and (g5_done___ ))
)
(:action mark-done-g6
	:parameters ()
	:precondition (and (split ) (g6_at c6 l9))
	:effect (and (g6_done___ ))
)
(:action gGLOBAL_sail
	:parameters (?from ?to)
	:precondition (and (unsplit ) (g0_not-eq ?from ?to) (g1_not-eq ?from ?to) (g2_not-eq ?from ?to) (g3_not-eq ?from ?to) (g4_not-eq ?from ?to) (g5_not-eq ?from ?to) (g6_not-eq ?from ?to) (g0_location ?from) (g1_location ?from) (g2_location ?from) (g3_location ?from) (g4_location ?from) (g5_location ?from) (g6_location ?from) (g0_location ?to) (g1_location ?to) (g2_location ?to) (g3_location ?to) (g4_location ?to) (g5_location ?to) (g6_location ?to) (g0_at-ferry ?from) (g1_at-ferry ?from) (g2_at-ferry ?from) (g3_at-ferry ?from) (g4_at-ferry ?from) (g5_at-ferry ?from) (g6_at-ferry ?from))
	:effect (and (g0_at-ferry ?to) (g1_at-ferry ?to) (g2_at-ferry ?to) (g3_at-ferry ?to) (g4_at-ferry ?to) (g5_at-ferry ?to) (g6_at-ferry ?to) (not (g0_at-ferry ?from)) (not (g1_at-ferry ?from)) (not (g2_at-ferry ?from)) (not (g3_at-ferry ?from)) (not (g4_at-ferry ?from)) (not (g5_at-ferry ?from)) (not (g6_at-ferry ?from)) (increase (total-cost ) 1))
)
(:action g0_sail
	:parameters (?from ?to)
	:precondition (and (g0_not-eq ?from ?to) (g0_location ?from) (g0_location ?to) (g0_at-ferry ?from) (split ))
	:effect (and (g0_at-ferry ?to) (not (g0_at-ferry ?from)))
)
(:action g1_sail
	:parameters (?from ?to)
	:precondition (and (g1_not-eq ?from ?to) (g1_location ?from) (g1_location ?to) (g1_at-ferry ?from) (split ) (g0_done___ ))
	:effect (and (g1_at-ferry ?to) (not (g1_at-ferry ?from)))
)
(:action g2_sail
	:parameters (?from ?to)
	:precondition (and (g2_not-eq ?from ?to) (g2_location ?from) (g2_location ?to) (g2_at-ferry ?from) (split ) (g1_done___ ))
	:effect (and (g2_at-ferry ?to) (not (g2_at-ferry ?from)))
)
(:action g3_sail
	:parameters (?from ?to)
	:precondition (and (g3_not-eq ?from ?to) (g3_location ?from) (g3_location ?to) (g3_at-ferry ?from) (split ) (g2_done___ ))
	:effect (and (g3_at-ferry ?to) (not (g3_at-ferry ?from)))
)
(:action g4_sail
	:parameters (?from ?to)
	:precondition (and (g4_not-eq ?from ?to) (g4_location ?from) (g4_location ?to) (g4_at-ferry ?from) (split ) (g3_done___ ))
	:effect (and (g4_at-ferry ?to) (not (g4_at-ferry ?from)))
)
(:action g5_sail
	:parameters (?from ?to)
	:precondition (and (g5_not-eq ?from ?to) (g5_location ?from) (g5_location ?to) (g5_at-ferry ?from) (split ) (g4_done___ ))
	:effect (and (g5_at-ferry ?to) (not (g5_at-ferry ?from)))
)
(:action g6_sail
	:parameters (?from ?to)
	:precondition (and (g6_not-eq ?from ?to) (g6_location ?from) (g6_location ?to) (g6_at-ferry ?from) (split ) (g5_done___ ))
	:effect (and (g6_at-ferry ?to) (not (g6_at-ferry ?from)))
)
(:action gGLOBAL_board
	:parameters (?car ?loc)
	:precondition (and (unsplit ) (g0_car ?car) (g1_car ?car) (g2_car ?car) (g3_car ?car) (g4_car ?car) (g5_car ?car) (g6_car ?car) (g0_location ?loc) (g1_location ?loc) (g2_location ?loc) (g3_location ?loc) (g4_location ?loc) (g5_location ?loc) (g6_location ?loc) (g0_at ?car ?loc) (g1_at ?car ?loc) (g2_at ?car ?loc) (g3_at ?car ?loc) (g4_at ?car ?loc) (g5_at ?car ?loc) (g6_at ?car ?loc) (g0_at-ferry ?loc) (g1_at-ferry ?loc) (g2_at-ferry ?loc) (g3_at-ferry ?loc) (g4_at-ferry ?loc) (g5_at-ferry ?loc) (g6_at-ferry ?loc) (g0_empty-ferry ) (g1_empty-ferry ) (g2_empty-ferry ) (g3_empty-ferry ) (g4_empty-ferry ) (g5_empty-ferry ) (g6_empty-ferry ))
	:effect (and (g0_on ?car) (g1_on ?car) (g2_on ?car) (g3_on ?car) (g4_on ?car) (g5_on ?car) (g6_on ?car) (not (g0_at ?car ?loc)) (not (g1_at ?car ?loc)) (not (g2_at ?car ?loc)) (not (g3_at ?car ?loc)) (not (g4_at ?car ?loc)) (not (g5_at ?car ?loc)) (not (g6_at ?car ?loc)) (not (g0_empty-ferry )) (not (g1_empty-ferry )) (not (g2_empty-ferry )) (not (g3_empty-ferry )) (not (g4_empty-ferry )) (not (g5_empty-ferry )) (not (g6_empty-ferry )) (increase (total-cost ) 1))
)
(:action g0_board
	:parameters (?car ?loc)
	:precondition (and (g0_car ?car) (g0_location ?loc) (g0_at ?car ?loc) (g0_at-ferry ?loc) (g0_empty-ferry ) (split ))
	:effect (and (g0_on ?car) (not (g0_at ?car ?loc)) (not (g0_empty-ferry )))
)
(:action g1_board
	:parameters (?car ?loc)
	:precondition (and (g1_car ?car) (g1_location ?loc) (g1_at ?car ?loc) (g1_at-ferry ?loc) (g1_empty-ferry ) (split ) (g0_done___ ))
	:effect (and (g1_on ?car) (not (g1_at ?car ?loc)) (not (g1_empty-ferry )))
)
(:action g2_board
	:parameters (?car ?loc)
	:precondition (and (g2_car ?car) (g2_location ?loc) (g2_at ?car ?loc) (g2_at-ferry ?loc) (g2_empty-ferry ) (split ) (g1_done___ ))
	:effect (and (g2_on ?car) (not (g2_at ?car ?loc)) (not (g2_empty-ferry )))
)
(:action g3_board
	:parameters (?car ?loc)
	:precondition (and (g3_car ?car) (g3_location ?loc) (g3_at ?car ?loc) (g3_at-ferry ?loc) (g3_empty-ferry ) (split ) (g2_done___ ))
	:effect (and (g3_on ?car) (not (g3_at ?car ?loc)) (not (g3_empty-ferry )))
)
(:action g4_board
	:parameters (?car ?loc)
	:precondition (and (g4_car ?car) (g4_location ?loc) (g4_at ?car ?loc) (g4_at-ferry ?loc) (g4_empty-ferry ) (split ) (g3_done___ ))
	:effect (and (g4_on ?car) (not (g4_at ?car ?loc)) (not (g4_empty-ferry )))
)
(:action g5_board
	:parameters (?car ?loc)
	:precondition (and (g5_car ?car) (g5_location ?loc) (g5_at ?car ?loc) (g5_at-ferry ?loc) (g5_empty-ferry ) (split ) (g4_done___ ))
	:effect (and (g5_on ?car) (not (g5_at ?car ?loc)) (not (g5_empty-ferry )))
)
(:action g6_board
	:parameters (?car ?loc)
	:precondition (and (g6_car ?car) (g6_location ?loc) (g6_at ?car ?loc) (g6_at-ferry ?loc) (g6_empty-ferry ) (split ) (g5_done___ ))
	:effect (and (g6_on ?car) (not (g6_at ?car ?loc)) (not (g6_empty-ferry )))
)
(:action gGLOBAL_debark
	:parameters (?car ?loc)
	:precondition (and (unsplit ) (g0_car ?car) (g1_car ?car) (g2_car ?car) (g3_car ?car) (g4_car ?car) (g5_car ?car) (g6_car ?car) (g0_location ?loc) (g1_location ?loc) (g2_location ?loc) (g3_location ?loc) (g4_location ?loc) (g5_location ?loc) (g6_location ?loc) (g0_on ?car) (g1_on ?car) (g2_on ?car) (g3_on ?car) (g4_on ?car) (g5_on ?car) (g6_on ?car) (g0_at-ferry ?loc) (g1_at-ferry ?loc) (g2_at-ferry ?loc) (g3_at-ferry ?loc) (g4_at-ferry ?loc) (g5_at-ferry ?loc) (g6_at-ferry ?loc))
	:effect (and (g0_at ?car ?loc) (g1_at ?car ?loc) (g2_at ?car ?loc) (g3_at ?car ?loc) (g4_at ?car ?loc) (g5_at ?car ?loc) (g6_at ?car ?loc) (g0_empty-ferry ) (g1_empty-ferry ) (g2_empty-ferry ) (g3_empty-ferry ) (g4_empty-ferry ) (g5_empty-ferry ) (g6_empty-ferry ) (not (g0_on ?car)) (not (g1_on ?car)) (not (g2_on ?car)) (not (g3_on ?car)) (not (g4_on ?car)) (not (g5_on ?car)) (not (g6_on ?car)) (increase (total-cost ) 1))
)
(:action g0_debark
	:parameters (?car ?loc)
	:precondition (and (g0_car ?car) (g0_location ?loc) (g0_on ?car) (g0_at-ferry ?loc) (split ))
	:effect (and (g0_at ?car ?loc) (g0_empty-ferry ) (not (g0_on ?car)))
)
(:action g1_debark
	:parameters (?car ?loc)
	:precondition (and (g1_car ?car) (g1_location ?loc) (g1_on ?car) (g1_at-ferry ?loc) (split ) (g0_done___ ))
	:effect (and (g1_at ?car ?loc) (g1_empty-ferry ) (not (g1_on ?car)))
)
(:action g2_debark
	:parameters (?car ?loc)
	:precondition (and (g2_car ?car) (g2_location ?loc) (g2_on ?car) (g2_at-ferry ?loc) (split ) (g1_done___ ))
	:effect (and (g2_at ?car ?loc) (g2_empty-ferry ) (not (g2_on ?car)))
)
(:action g3_debark
	:parameters (?car ?loc)
	:precondition (and (g3_car ?car) (g3_location ?loc) (g3_on ?car) (g3_at-ferry ?loc) (split ) (g2_done___ ))
	:effect (and (g3_at ?car ?loc) (g3_empty-ferry ) (not (g3_on ?car)))
)
(:action g4_debark
	:parameters (?car ?loc)
	:precondition (and (g4_car ?car) (g4_location ?loc) (g4_on ?car) (g4_at-ferry ?loc) (split ) (g3_done___ ))
	:effect (and (g4_at ?car ?loc) (g4_empty-ferry ) (not (g4_on ?car)))
)
(:action g5_debark
	:parameters (?car ?loc)
	:precondition (and (g5_car ?car) (g5_location ?loc) (g5_on ?car) (g5_at-ferry ?loc) (split ) (g4_done___ ))
	:effect (and (g5_at ?car ?loc) (g5_empty-ferry ) (not (g5_on ?car)))
)
(:action g6_debark
	:parameters (?car ?loc)
	:precondition (and (g6_car ?car) (g6_location ?loc) (g6_on ?car) (g6_at-ferry ?loc) (split ) (g5_done___ ))
	:effect (and (g6_at ?car ?loc) (g6_empty-ferry ) (not (g6_on ?car)))
)
)