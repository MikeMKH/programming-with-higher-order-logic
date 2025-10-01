module m3.
accumulate m1, m2.
type   s,t    item -> o.
type   b      item.
s X :- p X.
t b.
end

% [m3] ?- s R.

% no (more) solutions

% [m3] ?- s b.

% no (more) solutions

% [m3] ?- s a.
% (1,2) : Error : undeclared constant 'a'

% [m3] ?- s b.

% no (more) solutions

% [m3] ?- sigma x\ t x.

% yes

% [m3] ?- t X.

% The answer substitution:
% X = b

% More solutions (y/n)? y

% no (more) solutions