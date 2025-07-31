module link_goals_and_clauses.
  type reverse  list A -> list A -> o.
  type rev      list A -> list A -> list A -> o.
  
  reverse L K :-
    ((pi L\ rev nil L L) &
     (pi X\ pi L\ pi K\ pi M\ rev (X::L) K M :- rev L K (X::M)))
       => rev L K nil.
  
  rev nil L L.
  rev (X::L) K M :- rev L K (X::M).
end

% [link_goals_and_clauses] ?- reverse (1::2::nil) P.

% The answer substitution:
% P = 2 :: 1 :: nil

% More solutions (y/n)? n

% yes

% [link_goals_and_clauses] ?- rev (1::2::nil) P nil.

% The answer substitution:
% P = 2 :: 1 :: nil

% More solutions (y/n)? n

% yes