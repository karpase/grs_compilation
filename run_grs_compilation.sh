#!/bin/sh
# $1 - domain
# $2 - problem
# $3 - goals



python3 grs_compilation.py -d $1 -p $2 -g $3 -c 1000000
~/fd/fast-downward.py new_domain.pddl new_problem.pddl --search "astar(lmcut())" > fd_output.txt

pcost=`grep "Plan cost:" fd_output.txt | gawk '{print $NF / 1000000;}'`
ptime=`grep "Total time:" fd_output.txt | gawk '{print $NF;}'`

echo $1, $2, $pcost, $ptime >> grs_compilation_results.txt