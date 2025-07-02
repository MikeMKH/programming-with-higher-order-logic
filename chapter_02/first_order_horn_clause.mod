module first_order_horn_clause.

  type append list A -> list A -> list A -> o.
  
  % append nil L L.
  % append (X::L1) L2 (X::L3) :- append L1 L2 L3.
  
  pi l\ append nil L L.
  pi x\ pi l1\ pi l2\ pi l3\
    append (x::l1) l2 (x::l3) :- append l1 l2 l3.
    
  type sublist list A -> list A -> o.
  
  % sublist L K :- append _ T K, append L _ T.
  
  pi l\ pi k\
    sublist l k :- append _ T k, append l _ T.
   
  kind bool type.
  type neg bool -> bool.
  type and, or, imp bool -> bool -> bool.
  type ident bool -> bool -> o.
  
  % ident (neg B  ) (neg D  ) :- ident B D.
  % ident (and B C) (and D E) :- ident B D, ident C E.
  % ident (or  B C) (or  D E) :- ident B D, ident C E.
  % ident (imp B C) (imp D E) :- ident B D, ident C E.
  
  ident (neg B  ) (neg D  ) :- ident B D.
  ident (and B C) (and D E) &
  ident (or  B C) (or  D E) &
  ident (imp B C) (imp D E) :- ident B D, ident C E.

end