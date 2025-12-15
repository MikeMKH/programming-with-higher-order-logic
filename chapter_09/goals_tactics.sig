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

end