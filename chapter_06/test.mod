module test.
accumulate comblibrary.
type test list int -> o.
type p list int -> o.
p (2::nil).
test X :- call (p X).
end

% [test] ?- test X.

% The answer substitution:
% X = 2 :: nil

% More solutions (y/n)? y

% no (more) solutions