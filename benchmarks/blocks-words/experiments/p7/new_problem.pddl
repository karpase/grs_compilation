(define (problem p7)
	(:domain blocks)
	(:objects p - block a - block t - block e - block r - block)
	(:init 
		(unsplit )
		(g0_HANDEMPTY )
		(g1_HANDEMPTY )
		(g2_HANDEMPTY )
		(g0_ONTABLE p)
		(g1_ONTABLE p)
		(g2_ONTABLE p)
		(g0_CLEAR p)
		(g1_CLEAR p)
		(g2_CLEAR p)
		(g0_ONTABLE t)
		(g1_ONTABLE t)
		(g2_ONTABLE t)
		(g0_CLEAR a)
		(g1_CLEAR a)
		(g2_CLEAR a)
		(g0_ON a t)
		(g1_ON a t)
		(g2_ON a t)
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
	(:goal (and (g0_clear r) (g0_on r a) (g0_on a p) (g0_on p t) (g0_ontable t) (g1_clear p) (g1_on p a) (g1_on a t) (g1_on t e) (g1_ontable e) (g2_clear t) (g2_on t a) (g2_on a p) (g2_on p e) (g2_on e r) (g2_ontable r)))
	(:metric minimize (total-cost ))
)