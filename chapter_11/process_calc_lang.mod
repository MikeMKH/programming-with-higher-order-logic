module process_calc_lang.

kind name         type.
kind proc         type.

type null         proc.
type plus, par    proc -> proc -> proc.
type in           name -> (name -> proc) -> proc.
type out, match   name -> name -> proc -> proc.
type taup         proc -> proc.
type nu           (name -> proc) -> proc.
type bang         proc -> proc.

type a, b, c      name.
type example      int -> proc -> o.
example 1 (par (in b y\ null) (out b a null)).
example 2 (plus (in b y\ out b a null) (out b a (in b y\ null))).
example 3 (nu x\ par (in x y\ null) (out x a null)).
example 4 (nu x\ out a x null).
example 5 (in a y\ par  (in y w\ null) (out b b null)).
example 6 (in a y\ plus (in y w\ out b b null) (out b b (in y w\ null))).
example 7 (nu y\ out a y (par  (in y w\ null) (out b b null))).
example 8 (nu y\ out a y (plus (in y w\ out b b null) (out b b (in y w\ null)))).

kind action       type.
type tau          action.
type up, dn       name -> name -> action.

type one          proc ->          action ->           proc  -> o.
type onep         proc -> (name -> action) -> (name -> proc) -> o.

one  (taup P)     tau      P.
one  (out X Y P)  (up X Y) P.
onep (in X M)     (dn X)   M.

one  (match X X P) A P' :- one  P A P'.
onep (match X X P) A P' :- onep P A P'.

one  (plus P Q) A P'    :- one  P A P'; one  Q A P'.
onep (plus P Q) A P'    :- onep P A P'; onep Q A P'.

one  (par  P Q) A (par P' Q) &
one  (par  Q P) A (par Q P') :- one P A P'.

onep (par  P Q) A (y\ par (P' y) Q) &
onep (par  Q P) A (y\ par Q (P' y)) :- onep P A P'.
one  (nu P) A (nu P')               :- pi y\ one  (P y) A (P' y).
onep (nu P) A (x\ nu y\ P' y x)     :- pi y\ onep (P y) A (P' y).
onep (nu P) (up X) P'               :- 
                      pi y\ one  (P y) (up X y) (P' y).

one  (par P Q) tau (nu y\ par (P' y) (Q' y)) &
one  (par Q P) tau (nu y\ par (Q' y) (P' y)) :-
                              onep P (up X) P', onep Q (dn X) Q'.

one  (par P Q) tau (par S (T Y)) :- one  P (up X Y) S, 
                                    onep Q (dn X)   T.
one  (par P Q) tau (par (S Y) T) :- onep P (dn X) S,   
                                    one  Q (up X Y) T.

onep (in X M) (dn X) M.
onep (nu P)   (up X) P' :- pi y\ one  (P y) (up X y) (P' y).
one  (par P Q) tau (nu y\ par (P' y) (Q' y)) &
one  (par Q P) tau (nu y\ par (Q' y) (P' y)) :-
                           onep P (up X) P', onep Q (dn X) Q'.

end