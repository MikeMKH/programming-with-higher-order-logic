module examples.
  type foreach, forsome (A -> o) -> list A -> o.
  type mappred          (A -> B -> o) -> list A -> list B -> o.
  type sublist          (A -> o) -> list A -> list A -> o.
  
  foreach P nil.
  foreach P (X::L) :- P X, foreach P L.
  
  forsome P (X::L) :- P X; forsome P L.
  
  mappred P nil nil.
  mappred P (X::L) (Y::K) :- P X Y, mappred P L K.
  
  sublist P (X::L) (X::K) :- P X, sublist P L K.
  sublist P (X::L) K :- sublist P L K.
  sublist P nil nil.
  
  kind name                    type.
  type bob, sue, ned, jay      name.
  type age                     name -> int -> o.
  type male, female, nonbinary name -> o.
  
  age bob 23 & age sue 24 & age ned 23 & age jay 25.
  male bob   & female sue & male ned   & nonbinary jay.
end

% [examples] ?- mappred age (ned::bob::sue::jay::nil) L.

% The answer substitution:
% L = 23 :: 23 :: 24 :: 25 :: nil

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- mappred age L (23::24::nil).

% The answer substitution:
% L = bob :: sue :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = ned :: sue :: nil

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- sublist male (ned::sue::bob::jay::nil) L.

% The answer substitution:
% L = ned :: bob :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = ned :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = bob :: nil

% More solutions (y/n)? y

% The answer substitution:
% L = nil

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- forsome female (ned::sue::bob::jay::nil).

% yes

% [examples] ?- foreach female (ned::sue::bob::jay::nil).

% no (more) solutions