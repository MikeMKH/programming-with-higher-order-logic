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

kind term, form  type.
type sq    list form -> form -> goal.
primgoal (sq _ _).

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

memb_and_rest X (X::L) L.
memb_and_rest X (Y::K) (Y::L) :- memb_and_rest X K L.

type initial, and_r, imp_r, all_r, and_l, imp_l, all_l, all_l'
                      goal -> goal -> o.

initial (sq Gamma A) trueg :- memb_and_rest A Gamma _.
and_r   (sq Gamma (A &&  B)) ((sq Gamma A)  cc (sq Gamma B)).
imp_r   (sq Gamma (A ==> B)) (sq (A::Gamma) B).
all_r   (sq Gamma (all A)) (allg x\ sq Gamma (A x)).
and_l   (sq Gamma A) (sq (B::C::Gamma') A) :-
               memb_and_rest (B && C) Gamma Gamma'.
imp_l   (sq Gamma A) ((sq Gamma B) cc (sq (C::Gamma') A)) :-
               memb_and_rest (B ==> C) Gamma Gamma'.
all_l   (sq Gamma A) (sq ((B T)::Gamma) A) :- 
               memb_and_rest (all B) Gamma Gamma'.
all_l'  (sq Gamma A) (sq ((B T)::Gamma') A) :- 
               memb_and_rest (all B) Gamma Gamma'.

end