(define (problem p3)
	(:domain blocks)
	(:objects p - block a - block t - block e - block r - block)
	(:init 
		(unsplit )
		(g0_HANDEMPTY )
		(g1_HANDEMPTY )
		(g2_HANDEMPTY )
		(g0_ONTABLE e)
		(g1_ONTABLE e)
		(g2_ONTABLE e)
		(g0_CLEAR e)
		(g1_CLEAR e)
		(g2_CLEAR e)
		(g0_ONTABLE a)
		(g1_ONTABLE a)
		(g2_ONTABLE a)
		(g0_CLEAR t)
		(g1_CLEAR t)
		(g2_CLEAR t)
		(g0_ON t a)
		(g1_ON t a)
		(g2_ON t a)
		(g0_ONTABLE r)
		(g1_ONTABLE r)
		(g2_ONTABLE r)
		(g0_CLEAR p)
		(g1_CLEAR p)
		(g2_CLEAR p)
		(g0_ON p r)
		(g1_ON p r)
		(g2_ON p r)
		(= (total-cost ) 0.0)
	)
	(:goal (and (g0_clear p) (g0_on p e) (g0_on e t) (g0_ontable t) (g1_clear t) (g1_on t a) (g1_on a p) (g1_on p e) (g1_ontable e) (g2_clear p) (g2_on p e) (g2_on e a) (g2_ontable a)))
	(:metric minimize (total-cost ))
)