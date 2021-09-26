from pythonpddl import pddl

import os
import optparse
import copy
import math
import time
import subprocess
import tempfile

# We get the parameters
def parse_options():
    parser = optparse.OptionParser()
    parser.add_option('-s', '--state', action='store', dest='state',
                      help='state we want to compute: centroid (default), minimum-covering, medoid, minimum-covering-m, r-centroid, r-minimum-covering, r-medoid, r-minimum-covering-m',
                      default='centroid')
    parser.add_option('-p', '--problem-file', action='store', dest='problem_file', help='problem file')
    parser.add_option('-d', '--domain-file', action='store', dest='domain_file', help='domain file')
    parser.add_option('-g', '--goals-file', action='store', dest='goals_file', help='goals file')
    parser.add_option('-c', '--cost-factor', action='store', dest='cost_factor', help='cost factor', default=10**6, type="float")
    parser.add_option('-f', '--fd-cmd', action='store', dest='fd_cmd', help='Fast Downward Command', default="/home/karpase/fd/fast-downward.py --alias seq-opt-lmcut --search-time-limit 3600s", type="string")
    parser.add_option('-m', '--min-cover-comp', action='store', dest='min_cover_comp', help='Minimum Cover Compilation (direct/binary)', default="direct", type="string")


    options, args = parser.parse_args()
    return options

def call_planner(options, budget):
    print("Creating compilation for budget", budget)

    if budget >= 0:
        cmd = ["python3",os.path.join(options.orig_dir, "grs_compilation.py"), "-s", options.state, "-d",options.domain_file,"-p",options.problem_file,"-g",options.goals_file,"-c",str(options.cost_factor),"-b",str(budget)]
    else:
        cmd = ["python3",os.path.join(options.orig_dir, "grs_compilation.py"), "-s", options.state, "-d", options.domain_file,"-p",options.problem_file,"-g",options.goals_file,"-c",str(options.cost_factor)]
    subprocess.check_call(cmd)

    print("Calling planner for budget", budget)
    fd_cmd = options.fd_cmd.split() + ["new_domain.pddl", "new_problem.pddl"]
    try:
        ret = subprocess.check_call(fd_cmd, timeout=3600)
        print("Planner returned", ret)
        return True
    except subprocess.CalledProcessError as  e:
        print("Got", e)
        return False


def binary_search_minimum_covering(options):
    # First search - increase until finding first solution
    budget_lb = 0 # highest budget that failed
    budget_ub = 0 # lowest budget that succeeded
    solved_first = False
    while not solved_first:
        solved = call_planner(options, budget_ub)
        if solved:
            solved_first = True
        else:
            budget_lb = budget_ub
            if budget_ub == 0:
                budget_ub = 1
            else:
                budget_ub = budget_ub * 2


    # Second search - binary search to zero in on range
    while budget_ub - budget_lb > 1:
        budget = math.ceil((budget_lb + budget_ub) / 2)

        solved = call_planner(options, budget)
        if solved:
            budget_ub = budget
        else:
            budget_lb = budget

    return budget_ub



def main():
    options = parse_options()
    options.orig_dir = os.getcwd()

    tmpdirname = tempfile.TemporaryDirectory()
    print('created temporary directory', tmpdirname)
    os.chdir(tmpdirname.name)


    t1 = time.time()

    if options.min_cover_comp == "binary":
        assert(options.state == 'minimum-covering' or options.state == 'minimum-covering-m')
        val = binary_search_minimum_covering(options)
    else:
        val = call_planner(options, -1)

    t2 = time.time()


    print("*****", options.domain_file, options.problem_file, options.goals_file, options.state, options.min_cover_comp, val, t2-t1)


if __name__ == '__main__':
    main()
