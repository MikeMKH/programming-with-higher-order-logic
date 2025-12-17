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

end