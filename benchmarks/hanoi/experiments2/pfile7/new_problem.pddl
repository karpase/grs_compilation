(define (problem hanoi-7)
	(:domain hanoi)
	(:objects peg1 peg2 peg3 d1 d2 d3 d4 d5 d6 d7)
	(:init 
		(unsplit )
		(g0_smaller peg1 d1)
		(g0_smaller peg1 d2)
		(g0_smaller peg1 d3)
		(g0_smaller peg1 d4)
		(g0_smaller peg1 d5)
		(g0_smaller peg1 d6)
		(g0_smaller peg1 d7)
		(g0_smaller peg2 d1)
		(g0_smaller peg2 d2)
		(g0_smaller peg2 d3)
		(g0_smaller peg2 d4)
		(g0_smaller peg2 d5)
		(g0_smaller peg2 d6)
		(g0_smaller peg2 d7)
		(g0_smaller peg3 d1)
		(g0_smaller peg3 d2)
		(g0_smaller peg3 d3)
		(g0_smaller peg3 d4)
		(g0_smaller peg3 d5)
		(g0_smaller peg3 d6)
		(g0_smaller peg3 d7)
		(g0_smaller d1 d1)
		(g0_smaller d2 d1)
		(g0_smaller d3 d1)
		(g0_smaller d4 d1)
		(g0_smaller d5 d1)
		(g0_smaller d6 d1)
		(g0_smaller d7 d1)
		(g0_smaller d2 d2)
		(g0_smaller d3 d2)
		(g0_smaller d4 d2)
		(g0_smaller d5 d2)
		(g0_smaller d6 d2)
		(g0_smaller d7 d2)
		(g0_smaller d3 d3)
		(g0_smaller d4 d3)
		(g0_smaller d5 d3)
		(g0_smaller d6 d3)
		(g0_smaller d7 d3)
		(g0_smaller d4 d4)
		(g0_smaller d5 d4)
		(g0_smaller d6 d4)
		(g0_smaller d7 d4)
		(g0_smaller d5 d5)
		(g0_smaller d6 d5)
		(g0_smaller d7 d5)
		(g0_smaller d6 d6)
		(g0_smaller d7 d6)
		(g0_clear peg2)
		(g0_clear peg3)
		(g0_clear d1)
		(g0_on d7 peg1)
		(g0_on d6 d7)
		(g0_on d5 d6)
		(g0_on d4 d5)
		(g0_on d3 d4)
		(g0_on d2 d3)
		(g0_on d1 d2)
	)
	(:goal (and (g0_on d7 peg1) (g0_on d6 d7) (g0_on d5 d6) (g0_on d4 d5) (g0_on d3 d4) (g0_on d2 d3) (g0_on d1 d2)))
)