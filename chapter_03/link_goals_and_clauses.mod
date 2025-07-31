module link_goals_and_clauses.
  type reverse, rev list A -> list A -> o.
  
  reverse L K :-
    (rev nil K &
     (pi X\ pi L\ pi K\ rev (X::L) K :- rev L (X::K)))
       => rev L nil.
  
  rev nil K.
  rev (X::L) K :- rev L (X::K).
end

% [link_goals_and_clauses] ?- reverse (1::2::nil) P.

% The answer substitution:
% P = 2 :: 1 :: nil

% More solutions (y/n)? n

% yes

% [link_goals_and_clauses] ?- rev (1::2::nil) nil.

% yes