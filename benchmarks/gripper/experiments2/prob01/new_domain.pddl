(define (domain gripper-strips)
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
		(g0_room ?r)
		(g1_room ?r)
		(g2_room ?r)
		(g3_room ?r)
		(g0_ball ?b)
		(g1_ball ?b)
		(g2_ball ?b)
		(g3_ball ?b)
		(g0_gripper ?g)
		(g1_gripper ?g)
		(g2_gripper ?g)
		(g3_gripper ?g)
		(g0_at-robby ?r)
		(g1_at-robby ?r)
		(g2_at-robby ?r)
		(g3_at-robby ?r)
		(g0_at ?b ?r)
		(g1_at ?b ?r)
		(g2_at ?b ?r)
		(g3_at ?b ?r)
		(g0_free ?g)
		(g1_free ?g)
		(g2_free ?g)
		(g3_free ?g)
		(g0_carry ?o ?g)
		(g1_carry ?o ?g)
		(g2_carry ?o ?g)
		(g3_carry ?o ?g)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_at ball4 rooma))
	:effect (and (g0_done___ ))
)
(:action mark-done-g1
	:parameters ()
	:precondition (and (split ) (g1_at ball3 rooma))
	:effect (and (g1_done___ ))
)
(:action mark-done-g2
	:parameters ()
	:precondition (and (split ) (g2_at ball2 rooma))
	:effect (and (g2_done___ ))
)
(:action mark-done-g3
	:parameters ()
	:precondition (and (split ) (g3_at ball1 rooma))
	:effect (and (g3_done___ ))
)
(:action gGLOBAL_move
	:parameters (?from ?to)
	:precondition (and (unsplit ) (g0_room ?from) (g1_room ?from) (g2_room ?from) (g3_room ?from) (g0_room ?to) (g1_room ?to) (g2_room ?to) (g3_room ?to) (g0_at-robby ?from) (g1_at-robby ?from) (g2_at-robby ?from) (g3_at-robby ?from))
	:effect (and (g0_at-robby ?to) (g1_at-robby ?to) (g2_at-robby ?to) (g3_at-robby ?to) (not (g0_at-robby ?from)) (not (g1_at-robby ?from)) (not (g2_at-robby ?from)) (not (g3_at-robby ?from)) (increase (total-cost ) 1))
)
(:action g0_move
	:parameters (?from ?to)
	:precondition (and (g0_room ?from) (g0_room ?to) (g0_at-robby ?from) (split ))
	:effect (and (g0_at-robby ?to) (not (g0_at-robby ?from)))
)
(:action g1_move
	:parameters (?from ?to)
	:precondition (and (g1_room ?from) (g1_room ?to) (g1_at-robby ?from) (split ) (g0_done___ ))
	:effect (and (g1_at-robby ?to) (not (g1_at-robby ?from)))
)
(:action g2_move
	:parameters (?from ?to)
	:precondition (and (g2_room ?from) (g2_room ?to) (g2_at-robby ?from) (split ) (g1_done___ ))
	:effect (and (g2_at-robby ?to) (not (g2_at-robby ?from)))
)
(:action g3_move
	:parameters (?from ?to)
	:precondition (and (g3_room ?from) (g3_room ?to) (g3_at-robby ?from) (split ) (g2_done___ ))
	:effect (and (g3_at-robby ?to) (not (g3_at-robby ?from)))
)
(:action gGLOBAL_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (unsplit ) (g0_ball ?obj) (g1_ball ?obj) (g2_ball ?obj) (g3_ball ?obj) (g0_room ?room) (g1_room ?room) (g2_room ?room) (g3_room ?room) (g0_gripper ?gripper) (g1_gripper ?gripper) (g2_gripper ?gripper) (g3_gripper ?gripper) (g0_at ?obj ?room) (g1_at ?obj ?room) (g2_at ?obj ?room) (g3_at ?obj ?room) (g0_at-robby ?room) (g1_at-robby ?room) (g2_at-robby ?room) (g3_at-robby ?room) (g0_free ?gripper) (g1_free ?gripper) (g2_free ?gripper) (g3_free ?gripper))
	:effect (and (g0_carry ?obj ?gripper) (g1_carry ?obj ?gripper) (g2_carry ?obj ?gripper) (g3_carry ?obj ?gripper) (not (g0_at ?obj ?room)) (not (g1_at ?obj ?room)) (not (g2_at ?obj ?room)) (not (g3_at ?obj ?room)) (not (g0_free ?gripper)) (not (g1_free ?gripper)) (not (g2_free ?gripper)) (not (g3_free ?gripper)) (increase (total-cost ) 1))
)
(:action g0_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (g0_ball ?obj) (g0_room ?room) (g0_gripper ?gripper) (g0_at ?obj ?room) (g0_at-robby ?room) (g0_free ?gripper) (split ))
	:effect (and (g0_carry ?obj ?gripper) (not (g0_at ?obj ?room)) (not (g0_free ?gripper)))
)
(:action g1_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (g1_ball ?obj) (g1_room ?room) (g1_gripper ?gripper) (g1_at ?obj ?room) (g1_at-robby ?room) (g1_free ?gripper) (split ) (g0_done___ ))
	:effect (and (g1_carry ?obj ?gripper) (not (g1_at ?obj ?room)) (not (g1_free ?gripper)))
)
(:action g2_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (g2_ball ?obj) (g2_room ?room) (g2_gripper ?gripper) (g2_at ?obj ?room) (g2_at-robby ?room) (g2_free ?gripper) (split ) (g1_done___ ))
	:effect (and (g2_carry ?obj ?gripper) (not (g2_at ?obj ?room)) (not (g2_free ?gripper)))
)
(:action g3_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (g3_ball ?obj) (g3_room ?room) (g3_gripper ?gripper) (g3_at ?obj ?room) (g3_at-robby ?room) (g3_free ?gripper) (split ) (g2_done___ ))
	:effect (and (g3_carry ?obj ?gripper) (not (g3_at ?obj ?room)) (not (g3_free ?gripper)))
)
(:action gGLOBAL_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (unsplit ) (g0_ball ?obj) (g1_ball ?obj) (g2_ball ?obj) (g3_ball ?obj) (g0_room ?room) (g1_room ?room) (g2_room ?room) (g3_room ?room) (g0_gripper ?gripper) (g1_gripper ?gripper) (g2_gripper ?gripper) (g3_gripper ?gripper) (g0_carry ?obj ?gripper) (g1_carry ?obj ?gripper) (g2_carry ?obj ?gripper) (g3_carry ?obj ?gripper) (g0_at-robby ?room) (g1_at-robby ?room) (g2_at-robby ?room) (g3_at-robby ?room))
	:effect (and (g0_at ?obj ?room) (g1_at ?obj ?room) (g2_at ?obj ?room) (g3_at ?obj ?room) (g0_free ?gripper) (g1_free ?gripper) (g2_free ?gripper) (g3_free ?gripper) (not (g0_carry ?obj ?gripper)) (not (g1_carry ?obj ?gripper)) (not (g2_carry ?obj ?gripper)) (not (g3_carry ?obj ?gripper)) (increase (total-cost ) 1))
)
(:action g0_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (g0_ball ?obj) (g0_room ?room) (g0_gripper ?gripper) (g0_carry ?obj ?gripper) (g0_at-robby ?room) (split ))
	:effect (and (g0_at ?obj ?room) (g0_free ?gripper) (not (g0_carry ?obj ?gripper)))
)
(:action g1_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (g1_ball ?obj) (g1_room ?room) (g1_gripper ?gripper) (g1_carry ?obj ?gripper) (g1_at-robby ?room) (split ) (g0_done___ ))
	:effect (and (g1_at ?obj ?room) (g1_free ?gripper) (not (g1_carry ?obj ?gripper)))
)
(:action g2_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (g2_ball ?obj) (g2_room ?room) (g2_gripper ?gripper) (g2_carry ?obj ?gripper) (g2_at-robby ?room) (split ) (g1_done___ ))
	:effect (and (g2_at ?obj ?room) (g2_free ?gripper) (not (g2_carry ?obj ?gripper)))
)
(:action g3_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (g3_ball ?obj) (g3_room ?room) (g3_gripper ?gripper) (g3_carry ?obj ?gripper) (g3_at-robby ?room) (split ) (g2_done___ ))
	:effect (and (g3_at ?obj ?room) (g3_free ?gripper) (not (g3_carry ?obj ?gripper)))
)
)