module difference_lists.
  kind dlist type -> type.
  type dl    list A -> list A -> dlist A.
  
  type concat dlist A -> dlist A -> dlist A -> o.
  concat (dl L1 L2) (dl L2 L3) (dl L1 L3).
  
  kind btree type -> type.
  type empty btree A.
  type bt    A -> btree A -> btree A -> btree A.
  
  type collect btree A -> list A -> o.
  type aux     btree A -> dlist A -> o.
  collect Bt L :- aux Bt (dl L nil).
  aux empty      (dl A A).
  aux (bt N L R) (dl A B) :- aux L (dl A (N::C)), aux R (dl C B).
  
  kind fdlist type -> type.
  type fdl    (list A -> list A) -> fdlist A.
  
  type collect' btree A -> list A -> o.
  type aux'     btree A -> fdlist A -> o.
  collect' Bt (A nil) :- aux' Bt (fdl A).
  aux' empty      (fdl x\ x).
  aux' (bt N L R) (fdl x\ A (N::(B x))) :- aux' L (fdl A), aux' R (fdl B).
  
  type palindrome fdlist A -> o.
  palindrome (fdl x\ x).
  palindrome (fdl x\ Y::x).
  palindrome (fdl x\ Y::(F (Y::x))) :- palindrome (fdl F).
end

% [difference_lists] ?- palindrome (fdl x\ 1::2::3::2::1::x).

% yes

% [difference_lists] ?- palindrome (fdl x\ X::1::X::x).

% The answer substitution:
% X = _T1

% More solutions (y/n)? y

% no (more) solutions

% [difference_lists] ?- palindrome (fdl x\ 1::2::3::x).

% no (more) solutions

% [difference_lists] ?- palindrome (fdl x\ X::Y::Z::x).

% The answer substitution:
% Z = _T1
% Y = _T2
% X = _T1

% More solutions (y/n)? y

% no (more) solutions