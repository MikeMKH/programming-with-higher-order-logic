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