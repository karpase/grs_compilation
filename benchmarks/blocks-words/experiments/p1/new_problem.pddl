(define (problem p1)
	(:domain blocks)
	(:objects p - block a - block t - block e - block r - block)
	(:init 
		(unsplit )
		(g0_HANDEMPTY )
		(g1_HANDEMPTY )
		(g2_HANDEMPTY )
		(g0_ONTABLE r)
		(g1_ONTABLE r)
		(g2_ONTABLE r)
		(g0_CLEAR t)
		(g1_CLEAR t)
		(g2_CLEAR t)
		(g0_ON t r)
		(g1_ON t r)
		(g2_ON t r)
		(g0_ONTABLE p)
		(g1_ONTABLE p)
		(g2_ONTABLE p)
		(g0_CLEAR e)
		(g1_CLEAR e)
		(g2_CLEAR e)
		(g0_ON a p)
		(g1_ON a p)
		(g2_ON a p)
		(g0_ON e a)
		(g1_ON e a)
		(g2_ON e a)
		(= (total-cost ) 0.0)
	)
	(:goal (and (g0_clear e) (g0_on e a) (g0_on a t) (g0_ontable t) (g1_clear a) (g1_on a p) (g1_on p t) (g1_on t e) (g1_on e r) (g1_ontable r) (g2_clear t) (g2_on t e) (g2_on e a) (g2_on a r) (g2_ontable r)))
	(:metric minimize (total-cost ))
)