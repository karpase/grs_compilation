#!/bin/bash

for x in `cat problems.txt`; do 
	if test -f "${x%/*}/goals.txt"; then 
		echo "(ulimit -v 16777216 -t 3600; cd "${x%/*}/"; ~/grs_compilation/run_grs_compilation.sh domain.pddl ${x##*/} goals.txt)"; 
		echo "(ulimit -v 16777216 -t 3600; cd ~/GRS_0.1; python goal-related-states.py -d ${x%/*}/domain.pddl -p $x -g ${x%/*}/goals.txt -e optimal-plan -a all-reachable)";
	fi  ; 
done

