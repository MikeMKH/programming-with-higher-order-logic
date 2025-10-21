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