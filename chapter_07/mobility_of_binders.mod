module mobility_of_binders.
kind  term, tm type.
type  term   tm -> o.

type  app   tm -> (tm -> tm).
type  abs   (tm -> tm) -> tm.

term (app M N) :- term M, term N.
term (abs R)   :- pi x\ term x => term (R x).

type bnorm, bbnorm  tm -> o.

bnorm (abs M)    :- pi x\ bbnorm x => bnorm (M x).
bnorm H          :- bbnorm H.
bbnorm (app M N) :- bbnorm M, bnorm N.

type redex, red1, reduce  tm -> tm -> o.

redex (app (abs R) N) (R N).
red1 M N :- redex M N.
red1 (app M N) (app P N) & red1 (app N M) (app N P) :- red1 M P.
red1 (abs M) (abs N) :- pi x\ red1 (M x) (N x).

reduce M M :- bnorm M.
reduce M N :- red1 M P, reduce P N.

type repeat    (A -> A -> o) -> A -> A -> o.
type reduce'   tm -> tm -> o.

repeat Pred M N :- Pred M P, !, repeat Pred P N.
repeat Pred M M.

reduce' M N :- repeat red1 M N.

redex (abs x\ app M x) M.

kind path type.
type bnd           (path -> path) -> path.
type left, right   path -> path.
type path          tm -> path -> o.

path (app M _) (left  P) &
path (app _ M) (right P) :- path M P.
path (abs R) (bnd S) :- pi x\ pi p\ path x p => path (R x) (S p).

type foreach, forsome (A -> o) -> list A -> o.
foreach P nil.
foreach P (X::L) :- P X, foreach P L.

type beta     tm -> (tm -> tm) -> tm.
type addbeta  tm -> tm -> o.
type bpath    tm -> path -> o.

bpath (app M _) (left  P) &
bpath (app _ M) (right P) :- bpath M P.
bpath (abs R)   (bnd S)   :- pi x\ pi p\ bpath x p => bpath (R x) (S p).
bpath (beta N R) P        :- pi x\ (pi Q\ bpath x Q :- bpath N Q) => bpath (R x) P.

addbeta (app (abs R) N) (beta M S) :- addbeta (abs R) (abs S), addbeta N M.
addbeta (app (app M N) P) (app O Q) :- addbeta (app M N) O, addbeta P Q.
addbeta (abs R) (abs S) :-
  pi x\ (pi M\ pi N\ addbeta (app x M) (app x N) :- addbeta M N) => (addbeta x x) => addbeta (R x) (S x).

kind ty type.
type arr      ty -> ty -> ty.
type typeof   tm -> ty -> o.
type i        ty.

typeof (app M N) A :- typeof M (arr B A), typeof N B.
typeof (abs M) (arr A B) :- pi x\ typeof x A => typeof (M x) B.
end

% [mobility_of_binders] ?- (term (abs y\ app y y)).

% yes

% [mobility_of_binders] ?- term (app T T).

% The answer substitution:
% T = T

% More solutions (y/n)? y

% The answer substitution:
% T = T

% More solutions (y/n)? y

% The answer substitution:
% T = app _T1 _T2

% More solutions (y/n)? y

% The answer substitution:
% T = app _T1 (app _T2 _T3)

% More solutions (y/n)? y

% The answer substitution:
% T = app _T1 (app _T2 (app _T3 _T4))

% More solutions (y/n)? y

% The answer substitution:
% T = app _T1 (app _T2 (app _T3 (app _T4 _T5)))

% More solutions (y/n)? n

% yes

% [mobility_of_binders] ?- foreach (path N) ((bnd u\ left u) :: (bnd u\ right (bnd v\ left v)) :: (bnd u\ right (bnd v\ right u)) :: nil).

% The answer substitution:
% N = abs (W1\ app W1 (abs (W2\ app W2 W1)))

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- sigma B\ addbeta (app (abs x\x) (abs x\x)) B, bpath B Path.

% The answer substitution:
% Path = bnd (W1\ W1)

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- foreach (P\ path T P) (bnd (W1\ W1) :: nil).

% The answer substitution:
% T = abs (W1\ W1)

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- sigma K\ sigma S\ sigma B\  K = (abs x\ abs y\ x), S = (abs x\ abs y\ abs z\ app (app x z) (app y z)), addbeta (app K (app S K)) B, bpath B Path.

% The answer substitution:
% Path = bnd (W1\ bnd (W2\ bnd (W3\ left (left (bnd (W4\ bnd (W5\ W4)))))))

% More solutions (y/n)? y

% The answer substitution:
% Path = bnd (W1\ bnd (W2\ bnd (W3\ left (right W3))))

% More solutions (y/n)? y

% The answer substitution:
% Path = bnd (W1\ bnd (W2\ bnd (W3\ right (left W2))))

% More solutions (y/n)? y

% The answer substitution:
% Path = bnd (W1\ bnd (W2\ bnd (W3\ right (right W3))))

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- typeof (abs x\ abs y\ abs z\ app (app x z) (app y z)) Ty.

% The answer substitution:
% Ty = arr (arr _T1 (arr _T2 _T3)) (arr (arr _T1 _T2) (arr _T1 _T3))

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- typeof (abs x\x) Ty.

% The answer substitution:
% Ty = arr _T1 _T1

% More solutions (y/n)? y

% no (more) solutions

% [mobility_of_binders] ?- typeof (abs x\ app x x) Ty.

% no (more) solutions

% [mobility_of_binders] ?- typeof (abs x\x) (arr i i).

% yes

% [mobility_of_binders] ?- typeof (abs x\x) (arr i Ty).

% The answer substitution:
% Ty = i

% More solutions (y/n)? y

% no (more) solutions