module proplogic.
accumulate smlists.
kind  form          type.
type  ff, tt        form.
type  and, or, ==>  form -> form -> form.
type  prove         list form -> form -> o.

prove L F :- member ff L.
prove L F :- memb_and_rest (and A B) L L', prove (A::B::L') F.
prove L (and F1 F2) :- prove L F1, prove L F2.
prove L (==> F1 F2) :- prove (F1::L) F2.
prove L F :- 
  memb_and_rest (or A B) L L', 
  prove (A::L') F, prove (B::L') F.
prove L (or F1 F2) :- prove L F1; prove L F2.
prove L F :- member F L.
prove L F :-
  memb_and_rest (==> F1 F2) L L', 
  prove L F1, prove (F2::L') F.
  
end

% [proplogic] ?- prove [tt] F.
% Simulator: Stack overflow.

% [proplogic] ?- prove [ff] F.

% The answer substitution:
% F = F

% More solutions (y/n)? y

% The answer substitution:
% F = and _T1 _T2

% More solutions (y/n)? y

% The answer substitution:
% F = and _T1 (and _T2 _T3)

% More solutions (y/n)? y

% The answer substitution:
% F = and _T1 (and _T2 (and _T3 _T4))

% More solutions (y/n)? n

% yes