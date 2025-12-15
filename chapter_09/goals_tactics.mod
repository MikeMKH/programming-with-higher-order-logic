module goals_tactics.

kind  goal   type.
type  trueg  goal.                 % vacuously true goal
type  cc     goal -> goal -> goal. % conjunctive goal
type  allg   (A -> goal) -> goal.  % universally quantified goal
infixl cc    3.

type  goalreduce, redex, red1  goal -> goal -> o.
type  primgoal                 goal -> o.

redex (trueg cc G) G & redex (G cc trueg) G.
redex (allg x\trueg) trueg.

red1 G H :- redex G H, !.
red1 (G cc H) (Gx cc H) & 
red1 (H cc G) (H cc Gx) :- red1 G Gx.
red1 (allg G) (allg Gx) :- pi x\ red1 (G x) (Gx x).

goalreduce G H :- red1 G Gx, !, goalreduce Gx H.
goalreduce G G.

kind node           type.
type a, b, c, d, e  node.
type adj, path      node -> node -> goal.

primgoal (adj _ _)  &  primgoal (path _ _).

type adj_tac, path_base_tac, path_rec_tac  goal -> goal -> o.

adj_tac (adj a b) trueg  &  adj_tac (adj a c) trueg.
adj_tac (adj b d) trueg  &  adj_tac (adj c d) trueg.
adj_tac (adj d a) trueg  &  adj_tac (adj d e) trueg.
path_base_tac  (path X Y) (adj X Y).
path_rec_tac   (path X Y) ((adj X Z) cc (path Z Y)).

end