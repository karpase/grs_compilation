(define (problem p8)
	(:domain blocks)
	(:objects p - block a - block t - block e - block r - block)
	(:init 
		(unsplit )
		(g0_HANDEMPTY )
		(g1_HANDEMPTY )
		(g2_HANDEMPTY )
		(g0_ONTABLE a)
		(g1_ONTABLE a)
		(g2_ONTABLE a)
		(g0_CLEAR a)
		(g1_CLEAR a)
		(g2_CLEAR a)
		(g0_ONTABLE p)
		(g1_ONTABLE p)
		(g2_ONTABLE p)
		(g0_CLEAR t)
		(g1_CLEAR t)
		(g2_CLEAR t)
		(g0_ON t p)
		(g1_ON t p)
		(g2_ON t p)
		(g0_ONTABLE r)
		(g1_ONTABLE r)
		(g2_ONTABLE r)
		(g0_CLEAR e)
		(g1_CLEAR e)
		(g2_CLEAR e)
		(g0_ON e r)
		(g1_ON e r)
		(g2_ON e r)
		(= (total-cost ) 0.0)
	)
	(:goal (and (g0_clear p) (g0_on p e) (g0_on e a) (g0_on a t) (g0_ontable t) (g1_clear e) (g1_on e a) (g1_on a t) (g1_ontable t) (g2_clear p) (g2_on p e) (g2_on e a) (g2_ontable a)))
	(:metric minimize (total-cost ))
)