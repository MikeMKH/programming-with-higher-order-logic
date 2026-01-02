sig minifp.

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

kind ty                type.
type int, bool         ty.
type lst               ty -> ty.
type arr               ty -> ty -> ty.
type typeof            tm -> ty -> o.

type eval        tm -> tm -> o.
type val         tm -> o.
type apply       tm -> tm -> tm -> o.
type eval_spec   tm -> list tm -> tm -> o.
type special     int -> tm -> o.

type spec        int -> tm -> list tm -> tm. % for specials

type if          o -> o -> o -> o.

type eq          tm -> tm -> o.

type non_val, redex  tm -> o.
type reduce, evalc   tm -> tm -> o.
type context         tm -> (tm -> tm) -> tm -> o.

type mixeval         tm -> tm -> o.

end