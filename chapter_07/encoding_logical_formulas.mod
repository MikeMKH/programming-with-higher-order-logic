module encoding_logical_formulas.
kind term, form  type.
type    ff,                            % encoding the false proposition
        tt  form.                      % encoding the true proposition 
type    &&,                            % encoding conjunction
        !!,                            % encoding disjunction
        ==>   form -> form -> form.    % encoding implication
type    neg   form -> form.            % encoding negation
infixl  &&  5.        
infixl  !!  4.       
infixr  ==> 3.

type   p   term -> form.
type   q   term -> term -> form.
type   f   term -> term.
type   a   term.

type  all, some      (term -> form) -> form.

kind   tm     type.
type   app    tm -> tm -> tm.
type   abs    (tm -> tm) -> tm.

type list_instan     list term -> form -> form -> o.
list_instan nil B B.
list_instan (T::Ts) (all B) C :- list_instan Ts (B T) C.

type interp      form -> form -> o.
type backchain   form -> form -> form -> o.
type atom        form -> o.

interp D tt.
interp D (G1 && G2)  :- interp D G1, interp D G2.
interp D (G1 !! G2)  :- interp D G1; interp D G2.
interp D (some   G)  :- interp D (G X).
interp D A           :- atom A, backchain D D A.
backchain D A A.
backchain D (D1 && D2) A   :- backchain D D1 A; backchain D D2 A.
backchain D (all D1) A     :- backchain D (D1 X) A.
backchain D (G ==> D1) A   :- backchain D D1 A, interp D G.

type a, b, c    term.
type adj, path  term -> term -> form.
type prog       form -> o.

atom (adj _ _) & atom (path _ _).
prog ((adj a b) && (adj b c) &&
      (all x\ all y\ (adj x y) ==> (path x y)) &&
      (all x\ all y\ all z\  (adj x y) && (path y z) ==> (path x z))).
end

% [encoding_logical_formulas] ?- prog P, interp P (path a X).

% The answer substitution:
% X = b
% P = adj a b && adj b c && all (W1\ all (W2\ adj W1 W2 ==> path W1 W2)) && all (W1\ all (W2\ all (W3\ adj W1 W2 && path W2 W3 ==> path W1 W3)))

% More solutions (y/n)? y

% The answer substitution:
% X = c
% P = adj a b && adj b c && all (W1\ all (W2\ adj W1 W2 ==> path W1 W2)) && all (W1\ all (W2\ all (W3\ adj W1 W2 && path W2 W3 ==> path W1 W3)))

% More solutions (y/n)? y

% no (more) solutions