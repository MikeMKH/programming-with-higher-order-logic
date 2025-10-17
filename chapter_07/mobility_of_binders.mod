module mobility_of_binders.
kind  term, tm type.
type  term   tm -> o.

type  app   tm -> (tm -> tm).
type  abs   (tm -> tm) -> tm.

term (app M N) :- term M, term N.
term (abs R)   :- pi x\ term x => term (R x).
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