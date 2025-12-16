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

type maptac  (goal -> goal -> o) -> goal -> goal -> o.

maptac Tac trueg trueg.
maptac Tac (I1 cc I2) (O1 cc O2) :- maptac Tac I1 O1,
                                    maptac Tac I2 O2.
maptac Tac (allg In) (allg Out) :- pi t\ maptac Tac (In t) (Out t).
maptac Tac In Out :- primgoal In, Tac In Out.

type idtac        goal -> goal -> o.
type repeat, try  (goal -> goal -> o) -> goal -> goal -> o.
type then, orelse, orelse!
                  (goal -> goal -> o) -> (goal -> goal -> o) -> goal -> goal -> o.
type invertible   goal -> goal -> o.

idtac              In In.
then     Tac1 Tac2 In Out :- Tac1 In Mid, maptac Tac2 Mid Out.
orelse   Tac1 Tac2 In Out :- Tac1 In Out  ; Tac2 In Out.
orelse!  Tac1 Tac2 In Out :- Tac1 In Out, ! ; Tac2 In Out.
repeat   Tac       In Out :- orelse (then Tac (repeat Tac)) idtac In Out.
try      Tac       In Out :- orelse Tac idtac In Out.

type a', b', c', d', e'  form.
type p', q'              term -> form.  % a predicate of one argument
type f'                  term -> term.  % a term constructor
invertible         In Out :- repeat (orelse and_r (orelse and_l (orelse imp_r all_r))) In Out.

end

% [goals_tactics] ?- invertible (sq [] ((a' && (a' ==> b')) ==> (a' && b'))) Out.

% The answer substitution:
% Out = sq (a' :: (a' ==> b') :: nil) a' cc sq (a' :: (a' ==> b') :: nil) b'

% More solutions (y/n)? y

% The answer substitution:
% Out = sq (a' :: (a' ==> b') :: nil) a' cc sq ((a' && (a' ==> b')) :: nil) b'

% More solutions (y/n)? y

% The answer substitution:
% Out = sq ((a' && (a' ==> b')) :: nil) a' cc sq (a' :: (a' ==> b') :: nil) b'

% More solutions (y/n)? y

% The answer substitution:
% Out = sq ((a' && (a' ==> b')) :: nil) a' cc sq ((a' && (a' ==> b')) :: nil) b'

% More solutions (y/n)? y

% The answer substitution:
% Out = sq (a' :: (a' ==> b') :: nil) a' cc sq (a' :: (a' ==> b') :: nil) b'

% More solutions (y/n)? y

% The answer substitution:
% Out = sq (a' :: (a' ==> b') :: nil) (a' && b')

% More solutions (y/n)? y

% The answer substitution:
% Out = sq ((a' && (a' ==> b')) :: nil) (a' && b')

% More solutions (y/n)? y

% The answer substitution:
% Out = sq nil (a' && (a' ==> b') ==> a' && b')

% More solutions (y/n)? y

% no (more) solutions

% [goals_tactics] ?- invertible (sq [] ((all x\ (p' x) ==> (p' (f' x))) ==> (all x\ (p' x) ==> (p' (f' (f' x)))))) Out.

% The answer substitution:
% Out = allg (W1\ sq (p' W1 :: all (W2\ p' W2 ==> p' (f' W2)) :: nil) (p' (f' (f' W1))))

% More solutions (y/n)? y

% The answer substitution:
% Out = allg (W1\ sq (all (W2\ p' W2 ==> p' (f' W2)) :: nil) (p' W1 ==> p' (f' (f' W1))))

% More solutions (y/n)? y

% The answer substitution:
% Out = sq (all (W1\ p' W1 ==> p' (f' W1)) :: nil) (all (W1\ p' W1 ==> p' (f' (f' W1))))

% More solutions (y/n)? y

% The answer substitution:
% Out = sq nil (all (W1\ p' W1 ==> p' (f' W1)) ==> all (W1\ p' W1 ==> p' (f' (f' W1))))

% More solutions (y/n)? y

% no (more) solutions