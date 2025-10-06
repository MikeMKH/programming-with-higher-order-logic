module quantlogic.
accumulate proplogic, smlists.
kind term        type.
type all, some   (term -> form) -> form. 

prove L F :-
  memb_and_rest (some P) L _, 
  pi c\ prove ((P c)::L) F.
prove L (all P) :- pi c\ prove L (P c).
prove L (some P) :- prove L (P T).
prove L F :-
  memb_and_rest (all P) L K, 
  append K [all P] M, prove ((P T)::M) F.

end

% [quantlogic] ?- prove L (all P).

% The answer substitution:
% P = P
% L = ff :: _T1

% More solutions (y/n)? y

% The answer substitution:
% P = P
% L = and ff _T1 :: _T2

% More solutions (y/n)? y

% The answer substitution:
% P = P
% L = and (and ff _T1) _T2 :: _T3

% More solutions (y/n)? n

% yes

% [quantlogic] ?- prove L (some P).

% The answer substitution:
% P = P
% L = ff :: _T1

% More solutions (y/n)? y

% The answer substitution:
% P = P
% L = and ff _T1 :: _T2

% More solutions (y/n)? y

% The answer substitution:
% P = P
% L = and (and ff _T1) _T2 :: _T3

% More solutions (y/n)? y

% The answer substitution:
% P = P
% L = and (and (and ff _T1) _T2) _T3 :: _T4

% More solutions (y/n)? n

% yes