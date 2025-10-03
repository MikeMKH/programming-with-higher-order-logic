module stack.
kind stack         type -> type.
type emp           stack A.
type stk           A -> stack A -> stack A.
type init          stack A -> o.
type add, remove   A -> stack A -> stack A -> o.

init  emp.
add   X S (stk X S).
remove X (stk X S) S.
end

% [stack] ?- init A.

% no (more) solutions

% [stack] ?- sigma A\ sigma B\ sigma C\ init A, add 1 A B, remove X B C.

% The answer substitution:
% X = 1

% More solutions (y/n)? y

% no (more) solutions