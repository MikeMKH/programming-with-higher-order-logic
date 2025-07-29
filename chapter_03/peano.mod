module peano.
  kind nat                type.
  type zero               nat.
  type succ               nat -> nat.
  type plus               nat -> nat -> nat -> o.
  
  plus zero Y Y.
  plus (succ X) Y (succ Z) :- plus X Y Z.
end

% [peano] ?- pi N\ plus zero N N.

% yes

% [peano] ?- pi N\ plus N zero N.

% no (more) solutions