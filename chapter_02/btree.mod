module btree.
  type append           list A -> list A -> list A -> o.
  append nil L L.
  append (X :: L1) L2 (X :: L3) :- append L1 L2 L3.

  kind btree            type -> type.
  type empty            btree A.
  type node             A -> btree A -> btree A -> btree A.
  
  type insert           int -> btree int -> btree int -> o.
  insert X empty (node X empty empty).
  insert X (node Y L R) (node Y L1 R) :- X < Y, insert X L L1.
  insert X (node Y L R) (node Y L R1) :- X >= Y, insert X R R1.
end

% [btree] ?- insert 4 (node 3 (node 2 empty empty) empty) T.

% The answer substitution:
% T = node 3 (node 2 empty empty) (node 4 empty empty)

% More solutions (y/n)? y

% no (more) solutions