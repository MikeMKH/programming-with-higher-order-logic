module extended_higher_order_hereditary_harrop_formulas.
  type reverse, rev list A -> list A -> o.
  
  reverse L K :-
    (rev nil K &
     (pi X\ pi L\ pi K\ rev (X::L) K :- rev L (X::K)))
       => rev L nil.
  
  rev nil K.
  rev (X::L) K :- rev L (X::K).
end

% [extended_higher_order_hereditary_harrop_formulas] ?- reverse (1::2::nil) P.

% The answer substitution:
% P = 2 :: 1 :: nil

% More solutions (y/n)? y

% The answer substitution:
% P = P

% More solutions (y/n)? y

% The answer substitution:
% P = 2 :: 1 :: nil

% More solutions (y/n)? n

% yes

% [extended_higher_order_hereditary_harrop_formulas] ?- rev (1::2::nil) nil.

% yes