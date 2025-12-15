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

end