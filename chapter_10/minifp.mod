module minifp.

kind tm       type.

% Lambda calculus with special forms
type abs      (tm -> tm) -> tm.          % function abstraction
type @        tm -> tm -> tm.            % application
infixl        @ 4.                       % application is infix
type cond     tm -> tm -> tm -> tm.      % conditional
type fixpt    (tm -> tm) -> tm.          % recursive functions
type cns      tm -> tm -> tm.            % list constructor

% Builtin datatypes and builtin functions over them
type i                            int -> tm. % integer coercion
type and, or, ff, tt                     tm. % for booleans
type cons, car, cdr, nullp, consp, null  tm. % for lists
type greater, zerop, minus, sum, times   tm. % for integers
type equal                               tm. % general equality

type prog     string -> tm -> o.

prog "fib" (fixpt fib\ abs n\
  cond (zerop @ n) (i 0) 
       (cond (equal @ n @ (i 1)) (i 1) 
             (sum @ (fib @ (minus @ n @ (i 1))) @ 
                    (fib @ (minus @ n @ (i 2)))))).

prog "mem" (fixpt mem\ abs x\ abs l\ 
  cond (nullp @ l) ff 
       (cond (and @ (consp @ l) @ (equal @ (car @ l) @ x)) tt 
             (mem @ x @ (cdr @ l)))).

prog "appnd" (fixpt appnd\ abs l\ abs k\
  cond (nullp @ l) k (cons @ (car @ l) @ (appnd @ (cdr @ l) @ k))).

prog "map" (fixpt map\ abs f\ abs l\ 
  cond (nullp @ l) null (cons @ (f @ (car @ l)) @ 
                                (map @ f @ (cdr @ l)))).

kind ty                type.
type int, bool         ty.
type lst               ty -> ty.
type arr               ty -> ty -> ty.
type typeof            tm -> ty -> o.

typeof (M @ N) A          :- typeof M (arr B A), typeof N B.
typeof (cond P Q R) A     :- typeof P bool, typeof Q A, typeof R A.
typeof (abs M) (arr A B)  :- pi x\ typeof x A => typeof (M x) B.
typeof (fixpt M) A        :- pi x\ typeof x A => typeof (M x) A.

typeof tt bool & typeof and (arr bool (arr bool bool)).
typeof ff bool & typeof or  (arr bool (arr bool bool)).
typeof equal (arr A (arr A bool)).

typeof null  (lst A)             & typeof cons  (arr A (arr (lst A) (lst A))).
typeof car   (arr (lst A) A)     & typeof cdr   (arr (lst A) (lst A)).
typeof consp (arr (lst A) bool)  & typeof nullp (arr (lst A) bool).

typeof (i I) int                        & typeof zerop   (arr int bool).
typeof greater (arr int (arr int bool)) & typeof minus   (arr int (arr int int)).
typeof sum     (arr int (arr int int))  & typeof times   (arr int (arr int int)).

typeof (abs w\ w) (arr int int).
typeof (abs w\ w) (arr bool bool).
pi t\ typeof (abs w\ w) (arr t t).

type eval        tm -> tm -> o.
type val         tm -> o.
type apply       tm -> tm -> tm -> o.
type eval_spec   tm -> list tm -> tm -> o.
type special     int -> tm -> o.

type spec        int -> tm -> list tm -> tm. % for specials

type if          o -> o -> o -> o.
if P Q R :- P, !, Q.
if P Q R :- R.

% Description of which expressions denote values
val (abs _) & val (i _)  & val tt   & val ff  & val null.
val (cns _ _) & val (spec _ _ _).

% eval and apply are the heart of evaluation
eval V V               :- val V.
eval (M @ N) V         :- eval M F, eval N U, apply F U V.
eval (fixpt R)    V    :- eval (R (fixpt R)) V.
eval (cond C L R) V    :- eval C B, if (B = tt) (eval L V)
                                                (eval R V).
eval F (spec I F nil)  :- special I F.

apply (abs R) U V :- eval (R U) V.
apply (spec 1 F Args) U V :- eval_spec F (U::Args) V.
apply (spec C F Args) U (spec D F (U::Args)) :- C > 1, D is C - 1.

% Declaration of the arity of the built-in functions 
special 2 or    & special 2 and   & special 2 equal & 
special 1 car   & special 1 cdr   & special 2 cons  &
special 1 nullp & special 1 consp & special 1 zerop & 
special 2 minus & special 2 sum   & special 2 times &
special 2 greater.

% Description of how to compute the built-in functions
eval_spec car   ((cns V U)::nil) V.
eval_spec cdr   ((cns V U)::nil) U.
eval_spec cons  (U::V::nil) (cns V U).
eval_spec nullp (U::nil) V :- if (U = null) (V = tt) (V = ff).
eval_spec consp (U::nil) V :- if (U = null) (V = ff) (V = tt).
eval_spec and (C::B::nil) V :- if (B = ff) (V = ff) 
                                  (if (C = ff) (V = ff) (V = tt)).
eval_spec or  (C::B::nil) V :- if (B = tt) (V = tt) 
                                  (if (C = tt) (V = tt) (V = ff)).
eval_spec minus ((i N)::(i M)::nil) (i V) :- V is M - N.
eval_spec sum   ((i N)::(i M)::nil) (i V) :- V is M + N.
eval_spec times ((i N)::(i M)::nil) (i V) :- V is M * N.
eval_spec zerop ((i N)::nil) V  :- if (N = 0) (V = tt) (V = ff).
eval_spec equal (C::B::nil) V   :- if (B = C) (V = tt) (V = ff).
eval_spec greater ((i N)::(i M)::nil) V :-
                                   if (M > N) (V = tt) (V = ff).

type eq          tm -> tm -> o.
eq (i N) (i N)  &  eq tt tt  &  eq ff ff.
eq null null.
eq (cns X Y) (cns U V) :- eq X U, eq Y V.

type non_val, redex  tm -> o.
type reduce, evalc   tm -> tm -> o.
type context         tm -> (tm -> tm) -> tm -> o.

% Declare which expressions are not values
non_val (_ @ _) & non_val (fixpt _) & non_val (cond _ _ _).
non_val M :- special _ M.

% Declare which expressions are top-level reducible expressions
redex F       :- special _ F.
redex (U @ V) :- val U, val V.
redex (cond tt _ _) & redex (cond ff _ _) & redex (fixpt _).

% Describe how to reduce a redex
reduce ((abs R) @ N) (R N).
reduce (fixpt R) (R (fixpt R)).
reduce (cond tt L R) L.
reduce (cond ff L R) R.
reduce F (spec C F nil) :- special C F.
reduce ((spec 1 Fun Args) @ N) V :- eval_spec Fun (N::Args) V.
reduce ((spec C Fun Args) @ N) (spec D Fun (N::Args)) :-
  C > 1, D is C - 1.

% Separate an expression into an evaluation context and a redex
context R (x\ x) R :- redex R.
context (cond M N P) (x\ cond (E x) N P) R :-
  non_val M, context M E R.
context (M @ N) (x\ (E x) @ N) R :-
  non_val M, context M E R.
context (V @ M) (x\ V @ (E x)) R :-
  val V, non_val M, context M E R.

% Evaluation repeatedly uses evaluation contexts and redexes
evalc V V :- val V.
evalc M V :- context M E R, reduce R N, evalc (E N) V.

end

% [minifp] ?- sigma Exp\ prog Name Exp, typeof Exp Ty.

% The answer substitution:
% Ty = arr int int
% Name = "fib"

% More solutions (y/n)? y

% The answer substitution:
% Ty = arr _T1 (arr (lst _T1) bool)
% Name = "mem"

% More solutions (y/n)? y

% The answer substitution:
% Ty = arr (lst _T1) (arr (lst _T1) (lst _T1))
% Name = "appnd"

% More solutions (y/n)? y

% The answer substitution:
% Ty = arr (arr _T1 _T2) (arr (lst _T1) (lst _T2))
% Name = "map"

% More solutions (y/n)? y

% no (more) solutions

% [minifp] ?- prog "fib" F, eval (F @ (i 12)) V.

% The answer substitution:
% V = i 144
% F = fixpt (W1\ abs (W2\ cond (zerop @ W2) (i 0) (cond (equal @ W2 @ i 1) (i 1) (sum @ (W1 @ (minus @ W2 @ i 1)) @ (W1 @ (minus @ W2 @ i 2))))))

% More solutions (y/n)? y

% no (more) solutions

% [minifp] ?- prog "fib" Fib, prog "map" Map, eval (Map @ Fib @ (cons @ (i 9) @ (cons @ (i 4) @ null))) V.

% The answer substitution:
% V = cns (i 34) (cns (i 3) null)
% Map = fixpt (W1\ abs (W2\ abs (W3\ cond (nullp @ W3) null (cons @ (W2 @ (car @ W3)) @ (W1 @ W2 @ (cdr @ W3))))))
% Fib = fixpt (W1\ abs (W2\ cond (zerop @ W2) (i 0) (cond (equal @ W2 @ i 1) (i 1) (sum @ (W1 @ (minus @ W2 @ i 1)) @ (W1 @ (minus @ W2 @ i 2))))))

% More solutions (y/n)? y

% no (more) solutions

% [minifp] ?- eval (equal @ (abs x\x) @ (abs y\y)) V.

% The answer substitution:
% V = tt

% More solutions (y/n)? y

% no (more) solutions

% [minifp] ?- context (cond ((abs x\ ff) @ tt) (i 2) (i 3)) E R.

% The answer substitution:
% R = abs (W1\ ff) @ tt
% E = W1\ cond W1 (i 2) (i 3)

% More solutions (y/n)? y

% no (more) solutions

% [minifp] ?- context (cond ff ((abs x\ i 2) @ (i 3)) (i 4)) E R.

% The answer substitution:
% R = cond ff (abs (W1\ i 2) @ i 3) (i 4)
% E = W1\ W1

% More solutions (y/n)? y

% no (more) solutions