sig goals_tactics.

kind  goal   type.
type  trueg  goal.                 % vacuously true goal
type  cc     goal -> goal -> goal. % conjunctive goal
type  allg   (A -> goal) -> goal.  % universally quantified goal
infixl cc    3.

type  goalreduce, redex, red1  goal -> goal -> o.
type  primgoal                 goal -> o.

kind node           type.
type a, b, c, d, e  node.
type adj, path      node -> node -> goal.

type adj_tac, path_base_tac, path_rec_tac  goal -> goal -> o.

kind term, form  type.
type sq    list form -> form -> goal.

type    ff,                            % encoding the false proposition
        tt    form.                    % encoding the true proposition 
type    &&,                            % encoding conjunction
        !!,                            % encoding disjunction
        ==>   form -> form -> form.    % encoding implication

infixl  &&  5.        
infixl  !!  4.       
infixr  ==> 3.

type memb_and_rest  A -> list A -> list A -> o.
type  all, some     (term -> form) -> form.

type initial, and_r, imp_r, all_r, and_l, imp_l, all_l, all_l'
                      goal -> goal -> o.

end