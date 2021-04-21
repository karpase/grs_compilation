(define (problem hanoi-2)
	(:domain hanoi)
	(:objects peg1 peg2 peg3 d1 d2)
	(:init 
		(unsplit )
		(g0_smaller peg1 d1)
		(g0_smaller peg1 d2)
		(g0_smaller peg2 d1)
		(g0_smaller peg2 d2)
		(g0_smaller peg3 d1)
		(g0_smaller peg3 d2)
		(g0_smaller d1 d1)
		(g0_smaller d2 d1)
		(g0_clear peg2)
		(g0_clear peg3)
		(g0_clear d1)
		(g0_on d2 peg1)
		(g0_on d1 d2)
	)
	(:goal (and (g0_on d2 peg1) (g0_on d1 d2)))
)