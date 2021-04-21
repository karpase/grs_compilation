(define (domain gripper-strips)
	(:requirements :strips)
	(:types )
	(:constants )
	(:predicates
		(split )
		(unsplit )
		(g0_done___ )
		(g1_done___ )
		(g0_room ?r)
		(g1_room ?r)
		(g0_ball ?b)
		(g1_ball ?b)
		(g0_gripper ?g)
		(g1_gripper ?g)
		(g0_at-robby ?r)
		(g1_at-robby ?r)
		(g0_at ?b ?r)
		(g1_at ?b ?r)
		(g0_free ?g)
		(g1_free ?g)
		(g0_carry ?o ?g)
		(g1_carry ?o ?g)
	)
(:action do-split
	:parameters ()
	:precondition (and (unsplit ))
	:effect (and (not (unsplit )) (split ))
)
(:action mark-done-g0
	:parameters ()
	:precondition (and (split ) (g0_at ball5 roomb) (g0_at ball7 roomb))
	:effect (and (g0_done___ ))
)
(:action mark-done-g1
	:parameters ()
	:precondition (and (split ) (g1_at ball9 roomb) (g1_at ball3 roomb))
	:effect (and (g1_done___ ))
)
(:action gGLOBAL_move
	:parameters (?from ?to)
	:precondition (and (unsplit ) (g0_room ?from) (g1_room ?from) (g0_room ?to) (g1_room ?to) (g0_at-robby ?from) (g1_at-robby ?from))
	:effect (and (g0_at-robby ?to) (g1_at-robby ?to) (not (g0_at-robby ?from)) (not (g1_at-robby ?from)) (increase (total-cost ) 1))
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
(:action gGLOBAL_pick
	:parameters (?obj ?room ?gripper)
	:precondition (and (unsplit ) (g0_ball ?obj) (g1_ball ?obj) (g0_room ?room) (g1_room ?room) (g0_gripper ?gripper) (g1_gripper ?gripper) (g0_at ?obj ?room) (g1_at ?obj ?room) (g0_at-robby ?room) (g1_at-robby ?room) (g0_free ?gripper) (g1_free ?gripper))
	:effect (and (g0_carry ?obj ?gripper) (g1_carry ?obj ?gripper) (not (g0_at ?obj ?room)) (not (g1_at ?obj ?room)) (not (g0_free ?gripper)) (not (g1_free ?gripper)) (increase (total-cost ) 1))
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
(:action gGLOBAL_drop
	:parameters (?obj ?room ?gripper)
	:precondition (and (unsplit ) (g0_ball ?obj) (g1_ball ?obj) (g0_room ?room) (g1_room ?room) (g0_gripper ?gripper) (g1_gripper ?gripper) (g0_carry ?obj ?gripper) (g1_carry ?obj ?gripper) (g0_at-robby ?room) (g1_at-robby ?room))
	:effect (and (g0_at ?obj ?room) (g1_at ?obj ?room) (g0_free ?gripper) (g1_free ?gripper) (not (g0_carry ?obj ?gripper)) (not (g1_carry ?obj ?gripper)) (increase (total-cost ) 1))
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
)