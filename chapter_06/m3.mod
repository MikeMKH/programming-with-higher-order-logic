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