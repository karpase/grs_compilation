(define (problem ferry-l10-c5)
	(:domain ferry)
	(:objects l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 c0 c1 c2 c3 c4)
	(:init 
		(unsplit )
		(g0_location l0)
		(g1_location l0)
		(g2_location l0)
		(g3_location l0)
		(g4_location l0)
		(g0_location l1)
		(g1_location l1)
		(g2_location l1)
		(g3_location l1)
		(g4_location l1)
		(g0_location l2)
		(g1_location l2)
		(g2_location l2)
		(g3_location l2)
		(g4_location l2)
		(g0_location l3)
		(g1_location l3)
		(g2_location l3)
		(g3_location l3)
		(g4_location l3)
		(g0_location l4)
		(g1_location l4)
		(g2_location l4)
		(g3_location l4)
		(g4_location l4)
		(g0_location l5)
		(g1_location l5)
		(g2_location l5)
		(g3_location l5)
		(g4_location l5)
		(g0_location l6)
		(g1_location l6)
		(g2_location l6)
		(g3_location l6)
		(g4_location l6)
		(g0_location l7)
		(g1_location l7)
		(g2_location l7)
		(g3_location l7)
		(g4_location l7)
		(g0_location l8)
		(g1_location l8)
		(g2_location l8)
		(g3_location l8)
		(g4_location l8)
		(g0_location l9)
		(g1_location l9)
		(g2_location l9)
		(g3_location l9)
		(g4_location l9)
		(g0_car c0)
		(g1_car c0)
		(g2_car c0)
		(g3_car c0)
		(g4_car c0)
		(g0_car c1)
		(g1_car c1)
		(g2_car c1)
		(g3_car c1)
		(g4_car c1)
		(g0_car c2)
		(g1_car c2)
		(g2_car c2)
		(g3_car c2)
		(g4_car c2)
		(g0_car c3)
		(g1_car c3)
		(g2_car c3)
		(g3_car c3)
		(g4_car c3)
		(g0_car c4)
		(g1_car c4)
		(g2_car c4)
		(g3_car c4)
		(g4_car c4)
		(g0_not-eq l0 l1)
		(g1_not-eq l0 l1)
		(g2_not-eq l0 l1)
		(g3_not-eq l0 l1)
		(g4_not-eq l0 l1)
		(g0_not-eq l1 l0)
		(g1_not-eq l1 l0)
		(g2_not-eq l1 l0)
		(g3_not-eq l1 l0)
		(g4_not-eq l1 l0)
		(g0_not-eq l0 l2)
		(g1_not-eq l0 l2)
		(g2_not-eq l0 l2)
		(g3_not-eq l0 l2)
		(g4_not-eq l0 l2)
		(g0_not-eq l2 l0)
		(g1_not-eq l2 l0)
		(g2_not-eq l2 l0)
		(g3_not-eq l2 l0)
		(g4_not-eq l2 l0)
		(g0_not-eq l0 l3)
		(g1_not-eq l0 l3)
		(g2_not-eq l0 l3)
		(g3_not-eq l0 l3)
		(g4_not-eq l0 l3)
		(g0_not-eq l3 l0)
		(g1_not-eq l3 l0)
		(g2_not-eq l3 l0)
		(g3_not-eq l3 l0)
		(g4_not-eq l3 l0)
		(g0_not-eq l0 l4)
		(g1_not-eq l0 l4)
		(g2_not-eq l0 l4)
		(g3_not-eq l0 l4)
		(g4_not-eq l0 l4)
		(g0_not-eq l4 l0)
		(g1_not-eq l4 l0)
		(g2_not-eq l4 l0)
		(g3_not-eq l4 l0)
		(g4_not-eq l4 l0)
		(g0_not-eq l0 l5)
		(g1_not-eq l0 l5)
		(g2_not-eq l0 l5)
		(g3_not-eq l0 l5)
		(g4_not-eq l0 l5)
		(g0_not-eq l5 l0)
		(g1_not-eq l5 l0)
		(g2_not-eq l5 l0)
		(g3_not-eq l5 l0)
		(g4_not-eq l5 l0)
		(g0_not-eq l0 l6)
		(g1_not-eq l0 l6)
		(g2_not-eq l0 l6)
		(g3_not-eq l0 l6)
		(g4_not-eq l0 l6)
		(g0_not-eq l6 l0)
		(g1_not-eq l6 l0)
		(g2_not-eq l6 l0)
		(g3_not-eq l6 l0)
		(g4_not-eq l6 l0)
		(g0_not-eq l0 l7)
		(g1_not-eq l0 l7)
		(g2_not-eq l0 l7)
		(g3_not-eq l0 l7)
		(g4_not-eq l0 l7)
		(g0_not-eq l7 l0)
		(g1_not-eq l7 l0)
		(g2_not-eq l7 l0)
		(g3_not-eq l7 l0)
		(g4_not-eq l7 l0)
		(g0_not-eq l0 l8)
		(g1_not-eq l0 l8)
		(g2_not-eq l0 l8)
		(g3_not-eq l0 l8)
		(g4_not-eq l0 l8)
		(g0_not-eq l8 l0)
		(g1_not-eq l8 l0)
		(g2_not-eq l8 l0)
		(g3_not-eq l8 l0)
		(g4_not-eq l8 l0)
		(g0_not-eq l0 l9)
		(g1_not-eq l0 l9)
		(g2_not-eq l0 l9)
		(g3_not-eq l0 l9)
		(g4_not-eq l0 l9)
		(g0_not-eq l9 l0)
		(g1_not-eq l9 l0)
		(g2_not-eq l9 l0)
		(g3_not-eq l9 l0)
		(g4_not-eq l9 l0)
		(g0_not-eq l1 l2)
		(g1_not-eq l1 l2)
		(g2_not-eq l1 l2)
		(g3_not-eq l1 l2)
		(g4_not-eq l1 l2)
		(g0_not-eq l2 l1)
		(g1_not-eq l2 l1)
		(g2_not-eq l2 l1)
		(g3_not-eq l2 l1)
		(g4_not-eq l2 l1)
		(g0_not-eq l1 l3)
		(g1_not-eq l1 l3)
		(g2_not-eq l1 l3)
		(g3_not-eq l1 l3)
		(g4_not-eq l1 l3)
		(g0_not-eq l3 l1)
		(g1_not-eq l3 l1)
		(g2_not-eq l3 l1)
		(g3_not-eq l3 l1)
		(g4_not-eq l3 l1)
		(g0_not-eq l1 l4)
		(g1_not-eq l1 l4)
		(g2_not-eq l1 l4)
		(g3_not-eq l1 l4)
		(g4_not-eq l1 l4)
		(g0_not-eq l4 l1)
		(g1_not-eq l4 l1)
		(g2_not-eq l4 l1)
		(g3_not-eq l4 l1)
		(g4_not-eq l4 l1)
		(g0_not-eq l1 l5)
		(g1_not-eq l1 l5)
		(g2_not-eq l1 l5)
		(g3_not-eq l1 l5)
		(g4_not-eq l1 l5)
		(g0_not-eq l5 l1)
		(g1_not-eq l5 l1)
		(g2_not-eq l5 l1)
		(g3_not-eq l5 l1)
		(g4_not-eq l5 l1)
		(g0_not-eq l1 l6)
		(g1_not-eq l1 l6)
		(g2_not-eq l1 l6)
		(g3_not-eq l1 l6)
		(g4_not-eq l1 l6)
		(g0_not-eq l6 l1)
		(g1_not-eq l6 l1)
		(g2_not-eq l6 l1)
		(g3_not-eq l6 l1)
		(g4_not-eq l6 l1)
		(g0_not-eq l1 l7)
		(g1_not-eq l1 l7)
		(g2_not-eq l1 l7)
		(g3_not-eq l1 l7)
		(g4_not-eq l1 l7)
		(g0_not-eq l7 l1)
		(g1_not-eq l7 l1)
		(g2_not-eq l7 l1)
		(g3_not-eq l7 l1)
		(g4_not-eq l7 l1)
		(g0_not-eq l1 l8)
		(g1_not-eq l1 l8)
		(g2_not-eq l1 l8)
		(g3_not-eq l1 l8)
		(g4_not-eq l1 l8)
		(g0_not-eq l8 l1)
		(g1_not-eq l8 l1)
		(g2_not-eq l8 l1)
		(g3_not-eq l8 l1)
		(g4_not-eq l8 l1)
		(g0_not-eq l1 l9)
		(g1_not-eq l1 l9)
		(g2_not-eq l1 l9)
		(g3_not-eq l1 l9)
		(g4_not-eq l1 l9)
		(g0_not-eq l9 l1)
		(g1_not-eq l9 l1)
		(g2_not-eq l9 l1)
		(g3_not-eq l9 l1)
		(g4_not-eq l9 l1)
		(g0_not-eq l2 l3)
		(g1_not-eq l2 l3)
		(g2_not-eq l2 l3)
		(g3_not-eq l2 l3)
		(g4_not-eq l2 l3)
		(g0_not-eq l3 l2)
		(g1_not-eq l3 l2)
		(g2_not-eq l3 l2)
		(g3_not-eq l3 l2)
		(g4_not-eq l3 l2)
		(g0_not-eq l2 l4)
		(g1_not-eq l2 l4)
		(g2_not-eq l2 l4)
		(g3_not-eq l2 l4)
		(g4_not-eq l2 l4)
		(g0_not-eq l4 l2)
		(g1_not-eq l4 l2)
		(g2_not-eq l4 l2)
		(g3_not-eq l4 l2)
		(g4_not-eq l4 l2)
		(g0_not-eq l2 l5)
		(g1_not-eq l2 l5)
		(g2_not-eq l2 l5)
		(g3_not-eq l2 l5)
		(g4_not-eq l2 l5)
		(g0_not-eq l5 l2)
		(g1_not-eq l5 l2)
		(g2_not-eq l5 l2)
		(g3_not-eq l5 l2)
		(g4_not-eq l5 l2)
		(g0_not-eq l2 l6)
		(g1_not-eq l2 l6)
		(g2_not-eq l2 l6)
		(g3_not-eq l2 l6)
		(g4_not-eq l2 l6)
		(g0_not-eq l6 l2)
		(g1_not-eq l6 l2)
		(g2_not-eq l6 l2)
		(g3_not-eq l6 l2)
		(g4_not-eq l6 l2)
		(g0_not-eq l2 l7)
		(g1_not-eq l2 l7)
		(g2_not-eq l2 l7)
		(g3_not-eq l2 l7)
		(g4_not-eq l2 l7)
		(g0_not-eq l7 l2)
		(g1_not-eq l7 l2)
		(g2_not-eq l7 l2)
		(g3_not-eq l7 l2)
		(g4_not-eq l7 l2)
		(g0_not-eq l2 l8)
		(g1_not-eq l2 l8)
		(g2_not-eq l2 l8)
		(g3_not-eq l2 l8)
		(g4_not-eq l2 l8)
		(g0_not-eq l8 l2)
		(g1_not-eq l8 l2)
		(g2_not-eq l8 l2)
		(g3_not-eq l8 l2)
		(g4_not-eq l8 l2)
		(g0_not-eq l2 l9)
		(g1_not-eq l2 l9)
		(g2_not-eq l2 l9)
		(g3_not-eq l2 l9)
		(g4_not-eq l2 l9)
		(g0_not-eq l9 l2)
		(g1_not-eq l9 l2)
		(g2_not-eq l9 l2)
		(g3_not-eq l9 l2)
		(g4_not-eq l9 l2)
		(g0_not-eq l3 l4)
		(g1_not-eq l3 l4)
		(g2_not-eq l3 l4)
		(g3_not-eq l3 l4)
		(g4_not-eq l3 l4)
		(g0_not-eq l4 l3)
		(g1_not-eq l4 l3)
		(g2_not-eq l4 l3)
		(g3_not-eq l4 l3)
		(g4_not-eq l4 l3)
		(g0_not-eq l3 l5)
		(g1_not-eq l3 l5)
		(g2_not-eq l3 l5)
		(g3_not-eq l3 l5)
		(g4_not-eq l3 l5)
		(g0_not-eq l5 l3)
		(g1_not-eq l5 l3)
		(g2_not-eq l5 l3)
		(g3_not-eq l5 l3)
		(g4_not-eq l5 l3)
		(g0_not-eq l3 l6)
		(g1_not-eq l3 l6)
		(g2_not-eq l3 l6)
		(g3_not-eq l3 l6)
		(g4_not-eq l3 l6)
		(g0_not-eq l6 l3)
		(g1_not-eq l6 l3)
		(g2_not-eq l6 l3)
		(g3_not-eq l6 l3)
		(g4_not-eq l6 l3)
		(g0_not-eq l3 l7)
		(g1_not-eq l3 l7)
		(g2_not-eq l3 l7)
		(g3_not-eq l3 l7)
		(g4_not-eq l3 l7)
		(g0_not-eq l7 l3)
		(g1_not-eq l7 l3)
		(g2_not-eq l7 l3)
		(g3_not-eq l7 l3)
		(g4_not-eq l7 l3)
		(g0_not-eq l3 l8)
		(g1_not-eq l3 l8)
		(g2_not-eq l3 l8)
		(g3_not-eq l3 l8)
		(g4_not-eq l3 l8)
		(g0_not-eq l8 l3)
		(g1_not-eq l8 l3)
		(g2_not-eq l8 l3)
		(g3_not-eq l8 l3)
		(g4_not-eq l8 l3)
		(g0_not-eq l3 l9)
		(g1_not-eq l3 l9)
		(g2_not-eq l3 l9)
		(g3_not-eq l3 l9)
		(g4_not-eq l3 l9)
		(g0_not-eq l9 l3)
		(g1_not-eq l9 l3)
		(g2_not-eq l9 l3)
		(g3_not-eq l9 l3)
		(g4_not-eq l9 l3)
		(g0_not-eq l4 l5)
		(g1_not-eq l4 l5)
		(g2_not-eq l4 l5)
		(g3_not-eq l4 l5)
		(g4_not-eq l4 l5)
		(g0_not-eq l5 l4)
		(g1_not-eq l5 l4)
		(g2_not-eq l5 l4)
		(g3_not-eq l5 l4)
		(g4_not-eq l5 l4)
		(g0_not-eq l4 l6)
		(g1_not-eq l4 l6)
		(g2_not-eq l4 l6)
		(g3_not-eq l4 l6)
		(g4_not-eq l4 l6)
		(g0_not-eq l6 l4)
		(g1_not-eq l6 l4)
		(g2_not-eq l6 l4)
		(g3_not-eq l6 l4)
		(g4_not-eq l6 l4)
		(g0_not-eq l4 l7)
		(g1_not-eq l4 l7)
		(g2_not-eq l4 l7)
		(g3_not-eq l4 l7)
		(g4_not-eq l4 l7)
		(g0_not-eq l7 l4)
		(g1_not-eq l7 l4)
		(g2_not-eq l7 l4)
		(g3_not-eq l7 l4)
		(g4_not-eq l7 l4)
		(g0_not-eq l4 l8)
		(g1_not-eq l4 l8)
		(g2_not-eq l4 l8)
		(g3_not-eq l4 l8)
		(g4_not-eq l4 l8)
		(g0_not-eq l8 l4)
		(g1_not-eq l8 l4)
		(g2_not-eq l8 l4)
		(g3_not-eq l8 l4)
		(g4_not-eq l8 l4)
		(g0_not-eq l4 l9)
		(g1_not-eq l4 l9)
		(g2_not-eq l4 l9)
		(g3_not-eq l4 l9)
		(g4_not-eq l4 l9)
		(g0_not-eq l9 l4)
		(g1_not-eq l9 l4)
		(g2_not-eq l9 l4)
		(g3_not-eq l9 l4)
		(g4_not-eq l9 l4)
		(g0_not-eq l5 l6)
		(g1_not-eq l5 l6)
		(g2_not-eq l5 l6)
		(g3_not-eq l5 l6)
		(g4_not-eq l5 l6)
		(g0_not-eq l6 l5)
		(g1_not-eq l6 l5)
		(g2_not-eq l6 l5)
		(g3_not-eq l6 l5)
		(g4_not-eq l6 l5)
		(g0_not-eq l5 l7)
		(g1_not-eq l5 l7)
		(g2_not-eq l5 l7)
		(g3_not-eq l5 l7)
		(g4_not-eq l5 l7)
		(g0_not-eq l7 l5)
		(g1_not-eq l7 l5)
		(g2_not-eq l7 l5)
		(g3_not-eq l7 l5)
		(g4_not-eq l7 l5)
		(g0_not-eq l5 l8)
		(g1_not-eq l5 l8)
		(g2_not-eq l5 l8)
		(g3_not-eq l5 l8)
		(g4_not-eq l5 l8)
		(g0_not-eq l8 l5)
		(g1_not-eq l8 l5)
		(g2_not-eq l8 l5)
		(g3_not-eq l8 l5)
		(g4_not-eq l8 l5)
		(g0_not-eq l5 l9)
		(g1_not-eq l5 l9)
		(g2_not-eq l5 l9)
		(g3_not-eq l5 l9)
		(g4_not-eq l5 l9)
		(g0_not-eq l9 l5)
		(g1_not-eq l9 l5)
		(g2_not-eq l9 l5)
		(g3_not-eq l9 l5)
		(g4_not-eq l9 l5)
		(g0_not-eq l6 l7)
		(g1_not-eq l6 l7)
		(g2_not-eq l6 l7)
		(g3_not-eq l6 l7)
		(g4_not-eq l6 l7)
		(g0_not-eq l7 l6)
		(g1_not-eq l7 l6)
		(g2_not-eq l7 l6)
		(g3_not-eq l7 l6)
		(g4_not-eq l7 l6)
		(g0_not-eq l6 l8)
		(g1_not-eq l6 l8)
		(g2_not-eq l6 l8)
		(g3_not-eq l6 l8)
		(g4_not-eq l6 l8)
		(g0_not-eq l8 l6)
		(g1_not-eq l8 l6)
		(g2_not-eq l8 l6)
		(g3_not-eq l8 l6)
		(g4_not-eq l8 l6)
		(g0_not-eq l6 l9)
		(g1_not-eq l6 l9)
		(g2_not-eq l6 l9)
		(g3_not-eq l6 l9)
		(g4_not-eq l6 l9)
		(g0_not-eq l9 l6)
		(g1_not-eq l9 l6)
		(g2_not-eq l9 l6)
		(g3_not-eq l9 l6)
		(g4_not-eq l9 l6)
		(g0_not-eq l7 l8)
		(g1_not-eq l7 l8)
		(g2_not-eq l7 l8)
		(g3_not-eq l7 l8)
		(g4_not-eq l7 l8)
		(g0_not-eq l8 l7)
		(g1_not-eq l8 l7)
		(g2_not-eq l8 l7)
		(g3_not-eq l8 l7)
		(g4_not-eq l8 l7)
		(g0_not-eq l7 l9)
		(g1_not-eq l7 l9)
		(g2_not-eq l7 l9)
		(g3_not-eq l7 l9)
		(g4_not-eq l7 l9)
		(g0_not-eq l9 l7)
		(g1_not-eq l9 l7)
		(g2_not-eq l9 l7)
		(g3_not-eq l9 l7)
		(g4_not-eq l9 l7)
		(g0_not-eq l8 l9)
		(g1_not-eq l8 l9)
		(g2_not-eq l8 l9)
		(g3_not-eq l8 l9)
		(g4_not-eq l8 l9)
		(g0_not-eq l9 l8)
		(g1_not-eq l9 l8)
		(g2_not-eq l9 l8)
		(g3_not-eq l9 l8)
		(g4_not-eq l9 l8)
		(g0_empty-ferry )
		(g1_empty-ferry )
		(g2_empty-ferry )
		(g3_empty-ferry )
		(g4_empty-ferry )
		(g0_at c0 l4)
		(g1_at c0 l4)
		(g2_at c0 l4)
		(g3_at c0 l4)
		(g4_at c0 l4)
		(g0_at c1 l8)
		(g1_at c1 l8)
		(g2_at c1 l8)
		(g3_at c1 l8)
		(g4_at c1 l8)
		(g0_at c2 l5)
		(g1_at c2 l5)
		(g2_at c2 l5)
		(g3_at c2 l5)
		(g4_at c2 l5)
		(g0_at c3 l5)
		(g1_at c3 l5)
		(g2_at c3 l5)
		(g3_at c3 l5)
		(g4_at c3 l5)
		(g0_at c4 l6)
		(g1_at c4 l6)
		(g2_at c4 l6)
		(g3_at c4 l6)
		(g4_at c4 l6)
		(g0_at-ferry l5)
		(g1_at-ferry l5)
		(g2_at-ferry l5)
		(g3_at-ferry l5)
		(g4_at-ferry l5)
	)
	(:goal (and (g0_at c3 l5) (g1_at c2 l5) (g2_at c4 l6) (g3_at c1 l8) (g4_at c0 l4)))
)