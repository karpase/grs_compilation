from pythonpddl import pddl

import os
import optparse
import copy
import math

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
    parser.add_option('-f', '--fd-cmd', action='store', dest='fd_cmd', help='Fast Downward Command', default="~/fd/fast-downward.py --alias seq-opt-lmcut", type="string")


    options, args = parser.parse_args()
    return options

def call_planner(options, budget):
    print("Creating compilation for budget", budget)

    cmd = "python3 grs_compilation.py -s " + options.state + " -d " + options.domain_file + " -p " + options.problem_file + " -g " + options.goals_file + " -c " + str(options.cost_factor) + " -b " + str(budget)
    os.system(cmd)

    print("Calling planner for budget", budget)
    fd_cmd = options.fd_cmd + " new_domain.pddl new_problem.pddl"
    ret = os.system(fd_cmd)
    print("Planner returned", ret)
    if ret == 0:
        return True
    else:
        return False



def main():
    options = parse_options()

    assert(options.state == 'minimum-covering' or options.state == 'minimum-covering-m')

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

    print("Minimum covering: ", budget_ub)
    return budget_ub





if __name__ == '__main__':
    main()
