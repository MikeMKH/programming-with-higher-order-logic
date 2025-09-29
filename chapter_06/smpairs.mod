module smpairs.
accumulate smlists.
   
kind pair    type -> type -> type.
type pr      A -> B -> pair A B.

type assoc, assod   A -> B -> list (pair A B) -> o.

assoc X Y L :- memb (pr X Y) L.
assod X Y L :- member (pr X Y) L.

type domain         list (pair A B) -> list A -> o.

domain nil nil.
domain ((pr X Y)::Alist) (X::L) :- domain Alist L.

type range          list (pair A B) -> list B -> o.

range nil nil.
range ((pr X Y)::Alist) (Y::L)  :- range Alist L.
end

% example has sig and module in same file but that doesn't work:
% ⋊> ~/K/p/chapter_06 on main ◦ tjcc smpairs         05:31:51
% smpairs.mod(1,0) : Error : Unexpected input while parsing module

% [smpairs] ?- assoc 1 2 P.

% The answer substitution:
% P = pr 1 2 :: _T1

% More solutions (y/n)? y

% The answer substitution:
% P = _T1 :: pr 1 2 :: _T2

% More solutions (y/n)? y

% The answer substitution:
% P = _T1 :: _T2 :: pr 1 2 :: _T3

% More solutions (y/n)? n

% yes