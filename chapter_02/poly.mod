module poly.

  kind lst            type.
  type null           lst.
  type cons           A -> lst -> lst.
  type separate       lst -> list int -> list real -> o.
  
  separate (cons (X:int)  L) (X::K) M :- separate L K M.
  separate (cons (X:real) L) K (X::M) :- separate L K M.
  separate null nil nil.
  
  kind numb           type.
  type inj_int        int -> numb.
  type inj_real       real -> numb.
  type separate'      list numb -> list int -> list real -> o.
  
  separate' ((inj_int  X)::L) (X::K) M :- separate' L K M.
  separate' ((inj_real X)::L) K (X::M) :- separate' L K M.
  separate' nil nil nil.
  
end

% [poly] ?- separate (cons 1.0 (cons 2 (cons 3.0 null))) L K.

% The answer substitution:
% K = 1.000000 :: 3.000000 :: nil
% L = 2 :: nil

% More solutions (y/n)? y

% no (more) solutions

% [poly] ?- separate' ((inj_real 1.0)::(inj_int 2)::(inj_real 3.0)::nil) L K.

% The answer substitution:
% K = 1.000000 :: 3.000000 :: nil
% L = 2 :: nil

% More solutions (y/n)? y

% no (more) solutions