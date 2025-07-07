module fsm1.

  type append             list A -> list A -> list A -> o.
  append nil L L.
  append (X::L) K (X::M) :- append L K M.
  
  type lists              list A -> o.
  lists nil.
  lists (_::L) :- lists L.

  kind state, letter      type.
  type q1, q2, q3, q4, q5 state.
  type a, b               letter.
  type start, final       state -> o.
  type path, trans        state -> list letter -> state -> o.
  type accept             list letter -> o.
  
  path S nil S.
  path S Letters T :-
    trans S Arc M,
    append Arc Rest Letters,
    path M Rest T.
  accept W :- start S, path S W F, final F.
  
  start q1 & final q2 & final q3.
  trans q1 (a :: nil) q1      & trans q1 (b :: nil) q1.
  trans q1 (a :: b :: nil) q2 & trans q1 (b :: a :: nil) q3.
  
  start q1 & final q4 & final q5.
  trans q1 (a :: nil) q2  & trans q1 (b :: nil) q3.
  trans q2 (a :: nil) q1  & trans q2 (b :: nil) q4.
  trans q3 (a :: nil) q5  & trans q3 (b :: nil) q1.
  trans q4 (a :: nil) q5  & trans q4 (b :: nil) q3.
  trans q5 (a :: nil) q2  & trans q5 (b :: nil) q4.
  
end

% [fsm1] ?- accept (b::b::a::b::nil).

% yes

% [fsm1] ?- accept (b::b::X::Y::nil).

% The answer substitution:
% Y = a
% X = a

% More solutions (y/n)? y

% The answer substitution:
% Y = b
% X = a

% More solutions (y/n)? n

% yes

% [fsm1] ?- lists L.

% The answer substitution:
% L = nil

% More solutions (y/n)? y

% The answer substitution:
% L = _T1 :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = _T1 :: _T2 :: nil

% More solutions (y/n)? n

% yes

% [fsm1] ?- lists L, accept L.

% The answer substitution:
% L = a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: b :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = b :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: a :: a :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = a :: a :: b :: nil

% More solutions (y/n)? n

% yes