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
    parser.add_option('-P', '--plan-type', action='store', dest='plan_type', help='metric to minimize in the plan that reaches the state: shortest (default), metric-related',
                      default='shortest')
    parser.add_option('-p', '--problem-file', action='store', dest='problem_file', help='problem file')
    parser.add_option('-d', '--domain-file', action='store', dest='domain_file', help='domain file')
    parser.add_option('-g', '--goals-file', action='store', dest='goals_file', help='goals file')

    parser.add_option('-f', '--no-force-agent-order-after-split', action='store_false', dest='force_agent_order_after_split', help='don\'t force agent order after split', default=True)
    parser.add_option('-c', '--cost-factor', action='store', dest='cost_factor', help='cost factor', default=10**6, type="float")

    options, args = parser.parse_args()
    return options

def get_goals(file):
    goal_file = open(file, 'r')
    goals = []
    probs = []
    for line in goal_file:
        data = line.split(' - ')
        goal = data[0].split('|')
        probs.append(data[1].strip())
        goals.append(goal)
    goal_file.close()
    return goals, probs


def modify_name(i, name):
    if isinstance(i, str):
        return "g" + i + "_" + name
    else:
        return "g" + str(i) + "_" + name

def main():
    options = parse_options()

    cost_factor = options.cost_factor

    force_agent_order_after_split = options.force_agent_order_after_split

    if options.state == 'centroid' or options.state == 'minimum-covering':
        split_on_goals = False
    elif options.state == 'medoid' or options.state == 'minimum-covering-m':
        split_on_goals = True        
    else:
        raise Exception("Don't know how to handle state ", options.state)        

    
    if options.state == 'minimum-covering' or options.state == 'minimum-covering-m':
        after_split_max = True        
    elif options.state == 'centroid' or options.state == 'medoid':
        after_split_max = False

    assert(options.plan_type == 'shortest')

    assert(not (after_split_max and force_agent_order_after_split))



    print("domain", options.domain_file)
    print("problem", options.problem_file)
    print("goals", options.goals_file)

    (dom,prob) = pddl.parseDomainAndProblem(options.domain_file, options.problem_file)
    goals, gweights = get_goals(options.goals_file)    


    pddl_goals = {}
    for i, g in enumerate(goals):
        pddl_goal = []
        for gfact in g:        
            assert(gfact[0] == "(")
            assert(gfact[-1] == ")")
            goal_parts = gfact[1:-1].split(" ")
            arglist = []
            for arg in goal_parts[1:]:
                arglist.append(pddl.TypedArg(arg))
            pddl_goal_fact = pddl.Predicate(goal_parts[0], pddl.TypedArgList(arglist))
            pddl_goal.append(pddl_goal_fact)
        pddl_goals[i] = pddl_goal

    new_preds = []
    # Add the (split) predicate
    new_preds.append(pddl.Predicate("split", pddl.TypedArgList([])))
    new_preds.append(pddl.Predicate("unsplit", pddl.TypedArgList([])))

    if force_agent_order_after_split:
        # Add the (done_i) predicates
        for i,g in enumerate(goals):
                new_preds.append(pddl.Predicate(modify_name(i, "done___"), pddl.TypedArgList([])))

    if after_split_max:
        # Add (turn_i) predicates
        for i,g in enumerate(goals):
                new_preds.append(pddl.Predicate(modify_name(i, "turn___"), pddl.TypedArgList([])))

    # Duplicate each predicate for each goal
    for pred in dom.predicates:            
        for i,g in enumerate(goals):
            new_pred = pddl.Predicate(modify_name(i, pred.name), pred.args)
            new_preds.append(new_pred)
    dom.predicates = new_preds


    new_acts = []   
    # Create the "do_split" actions
    if split_on_goals:
        for i,g in enumerate(goals):
            goal_facts = []
            for pddl_goal_fact in pddl_goals[i]:
                mod_goal_fact = copy.deepcopy(pddl_goal_fact)
                mod_goal_fact.name = modify_name(i, mod_goal_fact.name)
                goal_facts.append(mod_goal_fact)
            do_split = pddl.Action(
                    "do-split-g"+str(i),
                    pddl.TypedArgList([]),
                    pddl.Formula([pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))])] + goal_facts, "and"),
                    [pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))],"not"), pddl.Formula([pddl.Predicate("split", pddl.TypedArgList([]))])]
                )
            new_acts.append(do_split)
    else:
        do_split = pddl.Action(
                    "do-split",
                    pddl.TypedArgList([]),
                    pddl.Formula([pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))])], "and"),
                    [pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))],"not"), pddl.Formula([pddl.Predicate("split", pddl.TypedArgList([]))])]
                )
        new_acts.append(do_split)

    if force_agent_order_after_split:
        # Create the "mark_done_i" actions
        for i,g in enumerate(goals):
            goal_facts = []
            for pddl_goal_fact in pddl_goals[i]:
                mod_goal_fact = copy.deepcopy(pddl_goal_fact)
                mod_goal_fact.name = modify_name(i, mod_goal_fact.name)
                goal_facts.append(mod_goal_fact)
            do_split = pddl.Action(
                    "mark-done-g"+str(i),
                    pddl.TypedArgList([]),
                    pddl.Formula([pddl.Formula([pddl.Predicate("split", pddl.TypedArgList([]))])] + goal_facts, "and"),
                    [pddl.Formula([pddl.Predicate(modify_name(i, "done___"), pddl.TypedArgList([]))])]
                )
            new_acts.append(do_split)
    
    if after_split_max:
        # Create the "noop_i" actions
        for i,g in enumerate(goals):
            if i == 0:
                cost = cost_factor
            else:
                cost = 0
            noop = pddl.Action(
                    "noop-g"+str(i),
                    pddl.TypedArgList([]),
                    pddl.Formula([pddl.Formula([pddl.Predicate("split", pddl.TypedArgList([]))]), pddl.Formula([pddl.Predicate(modify_name(i, "turn___"), pddl.TypedArgList([]))])], "and"),
                    [pddl.Formula([pddl.Predicate(modify_name(i, "turn___"), pddl.TypedArgList([]))], "not"),
                     pddl.Formula([pddl.Predicate(modify_name((i + 1) % len(goals), "turn___"), pddl.TypedArgList([]))]),
                     pddl.Formula([pddl.FHead("total-cost", pddl.TypedArgList([])), pddl.ConstantNumber(cost)], "increase")
                     ]
                )
            new_acts.append(noop)



    for act in dom.actions:

        # Create the "joint" version of each action
        new_act = pddl.Action(
                modify_name("GLOBAL", act.name), 
                act.parameters, 
                copy.deepcopy(act.pre), 
                copy.deepcopy(act.eff)
            )
        new_acts.append(new_act)
        if new_act.pre.op is None:
            new_act.pre.op = "and"
        assert(new_act.pre.op == "and") 
        assert(new_act.pre.get_predicates(False) == [])
        
        preconds = new_act.pre.get_predicates(True)
        new_pre = []
        new_pre.append(pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))]))
        for precond in preconds:
            for i,g in enumerate(goals):
                mod_precond = copy.deepcopy(precond)
                mod_precond.name = modify_name(i, mod_precond.name)
                new_pre.append(pddl.Formula([mod_precond]))  
        new_act.pre = pddl.Formula(new_pre, "and")

        # Joint action costs 1 (split action costs are multiplied by 1000000)
        new_eff = []
        for eff_part in new_act.eff:                
            if not eff_part.is_numeric: 
                for i,g in enumerate(goals):
                    mod_eff_part = copy.deepcopy(eff_part)
                    preds = mod_eff_part.get_predicates(True) + mod_eff_part.get_predicates(False)
                    for p in preds:
                        p.name = modify_name(i, p.name)
                    new_eff.append(mod_eff_part)
        new_eff.append(pddl.Formula([pddl.FHead("total-cost", pddl.TypedArgList([])), pddl.ConstantNumber(1)], "increase"))
        new_act.eff = new_eff




        for i,g in enumerate(goals):
            #create the "split" version of each action
            new_act = pddl.Action(
                modify_name(i, act.name), 
                act.parameters, 
                copy.deepcopy(act.pre), 
                copy.deepcopy(act.eff)
            )
            new_acts.append(new_act)

            assert(new_act.pre.get_predicates(False) == [])
            preconds = new_act.pre.get_predicates(True)
            for precond in preconds:
                precond.name = modify_name(i, precond.name)
            if new_act.pre.op is None:
                new_act.pre.op = "and"
            new_act.pre.subformulas.append(pddl.Predicate("split", pddl.TypedArgList([])))
            if force_agent_order_after_split and i > 0:
                new_act.pre.subformulas.append(pddl.Predicate(modify_name(i-1, "done___"), pddl.TypedArgList([])))
            if after_split_max:
                new_act.pre.subformulas.append(pddl.Predicate(modify_name(i, "turn___"), pddl.TypedArgList([])))
            
            for eff_part in new_act.eff:                
                if eff_part.is_numeric:                    
                    assert(eff_part.op == "increase")                    
                    assert(eff_part.subformulas[0].name == "total-cost")
                    if after_split_max:
                        assert(eff_part.subformulas[1].val == 1.0)
                        if i == 0:
                            eff_part.subformulas[1] = pddl.ConstantNumber(cost_factor)
                        else:
                            eff_part.subformulas[1] = pddl.ConstantNumber(0)
                    else:
                        # Split action costs the weight of the relevant goal, multiplied by a large cost factor                                       
                        eff_part.subformulas[1] = pddl.ConstantNumber(round(cost_factor * eff_part.subformulas[1].val * float(gweights[i]) / len(goals) ,0))
                else:
                    effs = eff_part.get_predicates(True) + eff_part.get_predicates(False)
                    for eff in effs:
                        eff.name = modify_name(i, eff.name)
            if after_split_max:
                new_act.eff.append(pddl.Formula([pddl.Predicate(modify_name(i, "turn___"), pddl.TypedArgList([]))], "not"))
                new_act.eff.append(pddl.Formula([pddl.Predicate(modify_name((i + 1) % len(goals), "turn___"), pddl.TypedArgList([]))]))
                        

    dom.actions = new_acts


    new_initial_state = []
    new_initial_state.append(
        pddl.Formula([pddl.Predicate("unsplit", pddl.TypedArgList([]))])
    )
    if after_split_max:
        new_initial_state.append(
            pddl.Formula([pddl.Predicate(modify_name(0, "turn___"), pddl.TypedArgList([]))])
        )

    
    for init_f in prob.initialstate:
        if isinstance(init_f, pddl.FExpression):
            new_initial_state.append(init_f)
        else:
            assert(init_f.get_predicates(False) == [])
            for i,g in enumerate(goals):
                new_init_f = copy.deepcopy(init_f)            
                for pred in new_init_f.get_predicates(True):
                    pred.name = modify_name(i, pred.name)
                new_initial_state.append(new_init_f)
    prob.initialstate = new_initial_state
        
    goal_facts = []
    for i,g in enumerate(goals):
        for pddl_goal_fact in pddl_goals[i]:
            mod_goal_fact = copy.deepcopy(pddl_goal_fact)
            mod_goal_fact.name = modify_name(i, mod_goal_fact.name)
            goal_facts.append(mod_goal_fact)
    prob.goal = pddl.Formula(goal_facts, "and")


    nd = open('new_domain.pddl', 'w')
    nd.write(dom.asPDDL())
    nd.close()
    
    np = open('new_problem.pddl', 'w')
    np.write(prob.asPDDL())
    np.close()


if __name__ == '__main__':
    main()
