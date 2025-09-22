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
  
  type ref, sym, trans (A -> A -> o) -> A -> A -> o.
  
  ref   R X Y :- X = Y; R X Y.
  sym   R X Y :- R X Y; R Y X.
  trans R X Y :- R X Y.
  trans R X Z :- R X Y, R Y Z.
  
  kind node type.
  type a, b, c, d, e node.
  type adj           node -> node -> o.
  
  % a -> b -> c -> e
  %      \   /
  %        d
  adj a b & adj b c & adj b d & adj d c & adj c e.
  
  type union   (A -> B -> o) -> (A -> B -> o) -> A -> B -> o.
  type compose (A -> B -> o) -> (B -> C -> o) -> A -> C -> o.
  type foldl   (A -> B -> B -> o) -> list A -> B -> B -> o.
  
  union   R S X Y :- R X Y; S X Y.
  compose R S X Z :- R X Y, S Y Z.
  
  foldl P nil    X X.
  foldl P (Y::L) X Z :- P Y X YX, foldl P L YX Z.
  
  kind stack         type -> type.
  type emp           stack A.
  type stk           A -> stack A -> stack A.
  type empty         stack A -> o.
  type enter, remove A -> stack A -> stack A -> o.
  type reverse       list A -> list A -> o.
  
  empty  emp.
  enter  X S (stk X S).
  remove X (stk X S) S.
  
  reverse L K :- compose (foldl enter L) (foldl remove K) emp emp.
  
  kind i                             type.
  type jane, mary, john              i.
  type mother, father, wife, husband i -> i -> o.
  type primrel, rel                  (i -> i -> o) -> o.
  
  primrel father & primrel mother & primrel wife & primrel husband.
  
  rel R :- primrel R.
  rel (x\y\ sigma z\ R x z, S z y) :- primrel R, primrel S.
  
  mother jane mary & wife john jane.
  
  type tt, ff o.
  type or     o -> o -> o.
  type exists (A -> o) -> o.
  
  tt.
  or P Q :- P.
  or P Q :- Q.
  exists B :- B T.
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

% [examples] ?- trans adj a d.

% yes

% [examples] ?- trans adj b c.

% yes

% [examples] ?- trans adj d b.

% no (more) solutions

% [examples] ?- sym adj b a.

% yes

% this example with foreach and sigma does not work
% [examples] ?- foreach (x\ sigma y\ age x y) (ned::sue::bob::jay::nil) L.
% (1,0) : Error : operator is not a function
%         operator type: o
%         in expression: foreach (x\ sigma (y\ age x y)) (ned :: sue :: bob :: jay :: nil) L.

% [examples] ?- halt.

% [examples] ?- foreach (x\ age x A) (ned::bob::sue::nil).

% no (more) solutions

% [examples] ?- foreach (x\ age x A) (ned::bob::nil).

% The answer substitution:
% A = 23

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- union adj adj a b.

% yes

% [examples] ?- reverse (1::2::3::nil) YS.

% The answer substitution:
% YS = 3 :: 2 :: 1 :: nil

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- enter 1 emp S, enter 2 S S1, remove Y S1 S0, remove X S0 Z.

% The answer substitution:
% Z = emp
% X = 1
% S0 = stk 1 emp
% Y = 2
% S1 = stk 2 (stk 1 emp)
% S = stk 1 emp

% More solutions (y/n)? n

% yes

% [examples] ?- rel R, R john mary.

% The answer substitution:
% R = W1\ W2\ sigma (W3\ wife W1 W3 , mother W3 W2)

% More solutions (y/n)? y

% no (more) solutions

% [examples] ?- or tt Y.

% The answer substitution:
% Y = Y

% More solutions (y/n)? y
% Error: solve: Ill-formed goal: uninstantiated variable as head.

% no (more) solutions

% [examples] ?- or ff Q.
% Error: solve: Ill-formed goal: uninstantiated variable as head.

% no (more) solutions

% [examples] ?- or ff tt.

% yes