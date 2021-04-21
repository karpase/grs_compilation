(define (domain logistics)
	(:requirements :strips :typing)
	(:types city - object place - object physobj - object package - physobj vehicle - physobj truck - vehicle airplane - vehicle airport - place location - place)
	(:constants )
	(:predicates
		(split )
		(unsplit )
		(g0_done___ )
		(g1_done___ )
		(g2_done___ )
		(g3_done___ )
		(g0_in-city ?x1 - place ?x2 - city)
		(g1_in-city ?x1 - place ?x2 - city)
		(g2_in-city ?x1 - place ?x2 - city)
		(g3_in-city ?x1 - place ?x2 - city)
		(g0_at ?x1 - physobj ?x2 - place)
		(g1_at ?x1 - physobj ?x2 - place)
		(g2_at ?x1 - physobj ?x2 - place)
		(g3_at ?x1 - physobj ?x2 - place)
		(g0_in ?x1 - package ?x2 - vehicle)
		(g1_in ?x1 - package ?x2 - vehicle)
		(g2_in ?x1 - package ?x2 - vehicle)
		(g3_in ?x1 - package ?x2 - vehicle)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_at obj13 pos22))
	:effect (and (g0_done___ ))
)
(:action mark-done-g1
	:parameters ()
	:precondition (and (split ) (g1_at obj12 pos23))
	:effect (and (g1_done___ ))
)
(:action mark-done-g2
	:parameters ()
	:precondition (and (split ) (g2_at obj13 pos22))
	:effect (and (g2_done___ ))
)
(:action mark-done-g3
	:parameters ()
	:precondition (and (split ) (g3_at obj11 pos21))
	:effect (and (g3_done___ ))
)
(:action gGLOBAL_LOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (unsplit ) (g0_at ?x2 ?x3) (g1_at ?x2 ?x3) (g2_at ?x2 ?x3) (g3_at ?x2 ?x3) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3))
	:effect (and (not (g0_at ?x1 ?x3)) (not (g1_at ?x1 ?x3)) (not (g2_at ?x1 ?x3)) (not (g3_at ?x1 ?x3)) (g0_in ?x1 ?x2) (g1_in ?x1 ?x2) (g2_in ?x1 ?x2) (g3_in ?x1 ?x2) (increase (total-cost ) 1))
)
(:action g0_LOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g0_at ?x2 ?x3) (g0_at ?x1 ?x3) (split ))
	:effect (and (not (g0_at ?x1 ?x3)) (g0_in ?x1 ?x2))
)
(:action g1_LOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g1_at ?x2 ?x3) (g1_at ?x1 ?x3) (split ) (g0_done___ ))
	:effect (and (not (g1_at ?x1 ?x3)) (g1_in ?x1 ?x2))
)
(:action g2_LOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g2_at ?x2 ?x3) (g2_at ?x1 ?x3) (split ) (g1_done___ ))
	:effect (and (not (g2_at ?x1 ?x3)) (g2_in ?x1 ?x2))
)
(:action g3_LOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g3_at ?x2 ?x3) (g3_at ?x1 ?x3) (split ) (g2_done___ ))
	:effect (and (not (g3_at ?x1 ?x3)) (g3_in ?x1 ?x2))
)
(:action gGLOBAL_LOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (unsplit ) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (g0_at ?x2 ?x3) (g1_at ?x2 ?x3) (g2_at ?x2 ?x3) (g3_at ?x2 ?x3))
	:effect (and (not (g0_at ?x1 ?x3)) (not (g1_at ?x1 ?x3)) (not (g2_at ?x1 ?x3)) (not (g3_at ?x1 ?x3)) (g0_in ?x1 ?x2) (g1_in ?x1 ?x2) (g2_in ?x1 ?x2) (g3_in ?x1 ?x2) (increase (total-cost ) 1))
)
(:action g0_LOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g0_at ?x1 ?x3) (g0_at ?x2 ?x3) (split ))
	:effect (and (not (g0_at ?x1 ?x3)) (g0_in ?x1 ?x2))
)
(:action g1_LOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g1_at ?x1 ?x3) (g1_at ?x2 ?x3) (split ) (g0_done___ ))
	:effect (and (not (g1_at ?x1 ?x3)) (g1_in ?x1 ?x2))
)
(:action g2_LOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g2_at ?x1 ?x3) (g2_at ?x2 ?x3) (split ) (g1_done___ ))
	:effect (and (not (g2_at ?x1 ?x3)) (g2_in ?x1 ?x2))
)
(:action g3_LOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g3_at ?x1 ?x3) (g3_at ?x2 ?x3) (split ) (g2_done___ ))
	:effect (and (not (g3_at ?x1 ?x3)) (g3_in ?x1 ?x2))
)
(:action gGLOBAL_UNLOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (unsplit ) (g0_at ?x2 ?x3) (g1_at ?x2 ?x3) (g2_at ?x2 ?x3) (g3_at ?x2 ?x3) (g0_in ?x1 ?x2) (g1_in ?x1 ?x2) (g2_in ?x1 ?x2) (g3_in ?x1 ?x2))
	:effect (and (not (g0_in ?x1 ?x2)) (not (g1_in ?x1 ?x2)) (not (g2_in ?x1 ?x2)) (not (g3_in ?x1 ?x2)) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (increase (total-cost ) 1))
)
(:action g0_UNLOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g0_at ?x2 ?x3) (g0_in ?x1 ?x2) (split ))
	:effect (and (not (g0_in ?x1 ?x2)) (g0_at ?x1 ?x3))
)
(:action g1_UNLOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g1_at ?x2 ?x3) (g1_in ?x1 ?x2) (split ) (g0_done___ ))
	:effect (and (not (g1_in ?x1 ?x2)) (g1_at ?x1 ?x3))
)
(:action g2_UNLOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g2_at ?x2 ?x3) (g2_in ?x1 ?x2) (split ) (g1_done___ ))
	:effect (and (not (g2_in ?x1 ?x2)) (g2_at ?x1 ?x3))
)
(:action g3_UNLOAD-TRUCK
	:parameters (?x1 - package ?x2 - truck ?x3 - place)
	:precondition (and (g3_at ?x2 ?x3) (g3_in ?x1 ?x2) (split ) (g2_done___ ))
	:effect (and (not (g3_in ?x1 ?x2)) (g3_at ?x1 ?x3))
)
(:action gGLOBAL_UNLOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (unsplit ) (g0_in ?x1 ?x2) (g1_in ?x1 ?x2) (g2_in ?x1 ?x2) (g3_in ?x1 ?x2) (g0_at ?x2 ?x3) (g1_at ?x2 ?x3) (g2_at ?x2 ?x3) (g3_at ?x2 ?x3))
	:effect (and (not (g0_in ?x1 ?x2)) (not (g1_in ?x1 ?x2)) (not (g2_in ?x1 ?x2)) (not (g3_in ?x1 ?x2)) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (increase (total-cost ) 1))
)
(:action g0_UNLOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g0_in ?x1 ?x2) (g0_at ?x2 ?x3) (split ))
	:effect (and (not (g0_in ?x1 ?x2)) (g0_at ?x1 ?x3))
)
(:action g1_UNLOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g1_in ?x1 ?x2) (g1_at ?x2 ?x3) (split ) (g0_done___ ))
	:effect (and (not (g1_in ?x1 ?x2)) (g1_at ?x1 ?x3))
)
(:action g2_UNLOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g2_in ?x1 ?x2) (g2_at ?x2 ?x3) (split ) (g1_done___ ))
	:effect (and (not (g2_in ?x1 ?x2)) (g2_at ?x1 ?x3))
)
(:action g3_UNLOAD-AIRPLANE
	:parameters (?x1 - package ?x2 - airplane ?x3 - place)
	:precondition (and (g3_in ?x1 ?x2) (g3_at ?x2 ?x3) (split ) (g2_done___ ))
	:effect (and (not (g3_in ?x1 ?x2)) (g3_at ?x1 ?x3))
)
(:action gGLOBAL_DRIVE-TRUCK
	:parameters (?x1 - truck ?x2 - place ?x3 - place ?x4 - city)
	:precondition (and (unsplit ) (g0_at ?x1 ?x2) (g1_at ?x1 ?x2) (g2_at ?x1 ?x2) (g3_at ?x1 ?x2) (g0_in-city ?x2 ?x4) (g1_in-city ?x2 ?x4) (g2_in-city ?x2 ?x4) (g3_in-city ?x2 ?x4) (g0_in-city ?x3 ?x4) (g1_in-city ?x3 ?x4) (g2_in-city ?x3 ?x4) (g3_in-city ?x3 ?x4))
	:effect (and (not (g0_at ?x1 ?x2)) (not (g1_at ?x1 ?x2)) (not (g2_at ?x1 ?x2)) (not (g3_at ?x1 ?x2)) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (increase (total-cost ) 1))
)
(:action g0_DRIVE-TRUCK
	:parameters (?x1 - truck ?x2 - place ?x3 - place ?x4 - city)
	:precondition (and (g0_at ?x1 ?x2) (g0_in-city ?x2 ?x4) (g0_in-city ?x3 ?x4) (split ))
	:effect (and (not (g0_at ?x1 ?x2)) (g0_at ?x1 ?x3))
)
(:action g1_DRIVE-TRUCK
	:parameters (?x1 - truck ?x2 - place ?x3 - place ?x4 - city)
	:precondition (and (g1_at ?x1 ?x2) (g1_in-city ?x2 ?x4) (g1_in-city ?x3 ?x4) (split ) (g0_done___ ))
	:effect (and (not (g1_at ?x1 ?x2)) (g1_at ?x1 ?x3))
)
(:action g2_DRIVE-TRUCK
	:parameters (?x1 - truck ?x2 - place ?x3 - place ?x4 - city)
	:precondition (and (g2_at ?x1 ?x2) (g2_in-city ?x2 ?x4) (g2_in-city ?x3 ?x4) (split ) (g1_done___ ))
	:effect (and (not (g2_at ?x1 ?x2)) (g2_at ?x1 ?x3))
)
(:action g3_DRIVE-TRUCK
	:parameters (?x1 - truck ?x2 - place ?x3 - place ?x4 - city)
	:precondition (and (g3_at ?x1 ?x2) (g3_in-city ?x2 ?x4) (g3_in-city ?x3 ?x4) (split ) (g2_done___ ))
	:effect (and (not (g3_at ?x1 ?x2)) (g3_at ?x1 ?x3))
)
(:action gGLOBAL_FLY-AIRPLANE
	:parameters (?x1 - airplane ?x2 - airport ?x3 - airport)
	:precondition (and (unsplit ) (g0_at ?x1 ?x2) (g1_at ?x1 ?x2) (g2_at ?x1 ?x2) (g3_at ?x1 ?x2))
	:effect (and (not (g0_at ?x1 ?x2)) (not (g1_at ?x1 ?x2)) (not (g2_at ?x1 ?x2)) (not (g3_at ?x1 ?x2)) (g0_at ?x1 ?x3) (g1_at ?x1 ?x3) (g2_at ?x1 ?x3) (g3_at ?x1 ?x3) (increase (total-cost ) 1))
)
(:action g0_FLY-AIRPLANE
	:parameters (?x1 - airplane ?x2 - airport ?x3 - airport)
	:precondition (and (g0_at ?x1 ?x2) (split ))
	:effect (and (not (g0_at ?x1 ?x2)) (g0_at ?x1 ?x3))
)
(:action g1_FLY-AIRPLANE
	:parameters (?x1 - airplane ?x2 - airport ?x3 - airport)
	:precondition (and (g1_at ?x1 ?x2) (split ) (g0_done___ ))
	:effect (and (not (g1_at ?x1 ?x2)) (g1_at ?x1 ?x3))
)
(:action g2_FLY-AIRPLANE
	:parameters (?x1 - airplane ?x2 - airport ?x3 - airport)
	:precondition (and (g2_at ?x1 ?x2) (split ) (g1_done___ ))
	:effect (and (not (g2_at ?x1 ?x2)) (g2_at ?x1 ?x3))
)
(:action g3_FLY-AIRPLANE
	:parameters (?x1 - airplane ?x2 - airport ?x3 - airport)
	:precondition (and (g3_at ?x1 ?x2) (split ) (g2_done___ ))
	:effect (and (not (g3_at ?x1 ?x2)) (g3_at ?x1 ?x3))
)
)