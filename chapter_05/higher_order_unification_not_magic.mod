module higher_order_unification_not_magic.
  kind i      type.
  type a,b    i.
  type f      i -> i -> i.
  
  type extract_a i -> (i -> i) -> o.
  extract_a (F a) F :- !.
end

% [higher_order_unification_not_magic] ?- extract_a (f a (f a b)) F.

% The answer substitution:
% F = F

% The remaining disagreement pairs list:
% <F a, f a (f a b)>

% More solutions (y/n)? y

% no (more) solutions

% [higher_order_unification_not_magic] ?- pi a\ sigma F\ (F a) = (f a (f a b)).

% yes

% [higher_order_unification_not_magic] ?- sigma F\ pi a\ (F a) = (f a (f a b)).

% yes