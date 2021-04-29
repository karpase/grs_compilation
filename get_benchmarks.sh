#!/bin/bash

for x in `cat problems.txt`; do 
	if test -f "${x%/*}/goals.txt"; then 
		echo "(ulimit -v 16777216 -t 3600; python3 ~/grs_compilation/grs_solve.py -d  ${x%/*}/domain.pddl -p $x -g ~/grs_compilation/${x%/*}/goals.txt.nocost -s centroid > ${x%/*}/rungrs.centroid.txt)";
		echo "(ulimit -v 16777216 -t 3600; python3 ~/grs_compilation/grs_solve.py -d  ${x%/*}/domain.pddl -p $x -g ~/grs_compilation/${x%/*}/goals.txt.nocost -s minimum-covering -m direct > ${x%/*}/rungrs.mincover.direct.txt)";
		echo "(ulimit -v 16777216 -t 3600; python3 ~/grs_compilation/grs_solve.py -d  ${x%/*}/domain.pddl -p $x -g ~/grs_compilation/${x%/*}/goals.txt.nocost -s minimum-covering -m binary > ${x%/*}/rungrs.mincover.binary.txt)";


#		echo "(ulimit -v 16777216 -t 3600; cd ~/GRS_0.1; python goal-related-states.py -d ${x%/*}/domain.pddl -p $x -g ~/grs_compilation/${x%/*}/goals.txt.nocost -e optimal-plan -a all-reachable)";
#		echo "(ulimit -v 16777216 -t 3600; cd ~/GRS_0.1; python goal-related-states.py -d ${x%/*}/domain.pddl -p $x -g ~/grs_compilation/${x%/*}/goals.txt.nocost -e optimal-plan -a all-reachable -s minimum-covering)";
	fi  ; 
done

