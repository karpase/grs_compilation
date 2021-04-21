(define (problem strips-gripper-x-1)
	(:domain gripper-strips)
	(:objects rooma roomb ball4 ball3 ball2 ball1 left right)
	(:init 
		(unsplit )
		(g0_room rooma)
		(g1_room rooma)
		(g2_room rooma)
		(g3_room rooma)
		(g0_room roomb)
		(g1_room roomb)
		(g2_room roomb)
		(g3_room roomb)
		(g0_ball ball4)
		(g1_ball ball4)
		(g2_ball ball4)
		(g3_ball ball4)
		(g0_ball ball3)
		(g1_ball ball3)
		(g2_ball ball3)
		(g3_ball ball3)
		(g0_ball ball2)
		(g1_ball ball2)
		(g2_ball ball2)
		(g3_ball ball2)
		(g0_ball ball1)
		(g1_ball ball1)
		(g2_ball ball1)
		(g3_ball ball1)
		(g0_at-robby rooma)
		(g1_at-robby rooma)
		(g2_at-robby rooma)
		(g3_at-robby rooma)
		(g0_free left)
		(g1_free left)
		(g2_free left)
		(g3_free left)
		(g0_free right)
		(g1_free right)
		(g2_free right)
		(g3_free right)
		(g0_at ball4 rooma)
		(g1_at ball4 rooma)
		(g2_at ball4 rooma)
		(g3_at ball4 rooma)
		(g0_at ball3 rooma)
		(g1_at ball3 rooma)
		(g2_at ball3 rooma)
		(g3_at ball3 rooma)
		(g0_at ball2 rooma)
		(g1_at ball2 rooma)
		(g2_at ball2 rooma)
		(g3_at ball2 rooma)
		(g0_at ball1 rooma)
		(g1_at ball1 rooma)
		(g2_at ball1 rooma)
		(g3_at ball1 rooma)
		(g0_gripper left)
		(g1_gripper left)
		(g2_gripper left)
		(g3_gripper left)
		(g0_gripper right)
		(g1_gripper right)
		(g2_gripper right)
		(g3_gripper right)
	)
	(:goal (and (g0_at ball4 rooma) (g1_at ball3 rooma) (g2_at ball2 rooma) (g3_at ball1 rooma)))
)