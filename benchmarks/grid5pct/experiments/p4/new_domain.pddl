(define (domain maze)
	(:requirements :strips :typing)
	(:types cell - place player - locatable)
	(:constants )
	(:functions
		(total-cost )
	)
	(:predicates
		(split )
		(unsplit )
		(g0_done___ )
		(g1_done___ )
		(g2_done___ )
		(g3_done___ )
		(g0_at ?x1 - locatable ?x2 - cell)
		(g1_at ?x1 - locatable ?x2 - cell)
		(g2_at ?x1 - locatable ?x2 - cell)
		(g3_at ?x1 - locatable ?x2 - cell)
		(g0_connected ?x1 - cell ?x2 - cell)
		(g1_connected ?x1 - cell ?x2 - cell)
		(g2_connected ?x1 - cell ?x2 - cell)
		(g3_connected ?x1 - cell ?x2 - cell)
		(g0_free ?x1 - cell)
		(g1_free ?x1 - cell)
		(g2_free ?x1 - cell)
		(g3_free ?x1 - cell)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_at p0 c0_15))
	:effect (and (g0_done___ ))
)
(:action mark-done-g1
	:parameters ()
	:precondition (and (split ) (g1_at p0 c3_0))
	:effect (and (g1_done___ ))
)
(:action mark-done-g2
	:parameters ()
	:precondition (and (split ) (g2_at p0 c9_12))
	:effect (and (g2_done___ ))
)
(:action mark-done-g3
	:parameters ()
	:precondition (and (split ) (g3_at p0 c2_17))
	:effect (and (g3_done___ ))
)
(:action gGLOBAL_move
	:parameters (?x1 - player ?x2 - cell ?x3 - cell)
	:precondition (and (unsplit ) (g0_at ?x1 ?x2) (g1_at ?x1 ?x2) (g2_at ?x1 ?x2) (g3_at ?x1 ?x2) (g0_free ?x3) (g1_free ?x3) (g2_free ?x3) (g3_free ?x3) (g0_connected ?x2 ?x3) (g1_connected ?x2 ?x3) (g2_connected ?x2 ?x3) (g3_connected ?x2 ?x3))
	:effect (and (not (g0_at ?x1 ?x2)) (not (g1_at ?x1 ?x2)) (not (g2_at ?x1 ?x2)) (not (g3_at ?x1 ?x2)) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (g0_free ?x2) (g1_free ?x2) (g2_free ?x2) (g3_free ?x2) (not (g0_free ?x3)) (not (g1_free ?x3)) (not (g2_free ?x3)) (not (g3_free ?x3)) (increase (total-cost ) 1))
)
(:action g0_move
	:parameters (?x1 - player ?x2 - cell ?x3 - cell)
	:precondition (and (g0_at ?x1 ?x2) (g0_free ?x3) (g0_connected ?x2 ?x3) (split ))
	:effect (and (not (g0_at ?x1 ?x2)) (g0_at ?x1 ?x3) (g0_free ?x2) (not (g0_free ?x3)) (increase (total-cost ) 250000.0))
)
(:action g1_move
	:parameters (?x1 - player ?x2 - cell ?x3 - cell)
	:precondition (and (g1_at ?x1 ?x2) (g1_free ?x3) (g1_connected ?x2 ?x3) (split ) (g0_done___ ))
	:effect (and (not (g1_at ?x1 ?x2)) (g1_at ?x1 ?x3) (g1_free ?x2) (not (g1_free ?x3)) (increase (total-cost ) 250000.0))
)
(:action g2_move
	:parameters (?x1 - player ?x2 - cell ?x3 - cell)
	:precondition (and (g2_at ?x1 ?x2) (g2_free ?x3) (g2_connected ?x2 ?x3) (split ) (g1_done___ ))
	:effect (and (not (g2_at ?x1 ?x2)) (g2_at ?x1 ?x3) (g2_free ?x2) (not (g2_free ?x3)) (increase (total-cost ) 250000.0))
)
(:action g3_move
	:parameters (?x1 - player ?x2 - cell ?x3 - cell)
	:precondition (and (g3_at ?x1 ?x2) (g3_free ?x3) (g3_connected ?x2 ?x3) (split ) (g2_done___ ))
	:effect (and (not (g3_at ?x1 ?x2)) (g3_at ?x1 ?x3) (g3_free ?x2) (not (g3_free ?x3)) (increase (total-cost ) 250000.0))
)
)