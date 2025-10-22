sig mobility_of_binders.
kind  term, tm type.
type  term   tm -> o.

type  app   tm -> (tm -> tm).
type  abs   (tm -> tm) -> tm.

type bnorm, bbnorm  tm -> o.

type redex, red1, reduce  tm -> tm -> o.
type repeat    (A -> A -> o) -> A -> A -> o.
type reduce'   tm -> tm -> o.

kind path type.
type bnd           (path -> path) -> path.
type left, right   path -> path.
type path          tm -> path -> o.

type foreach, forsome (A -> o) -> list A -> o.

type beta     tm -> (tm -> tm) -> tm.
type addbeta  tm -> tm -> o.
type bpath    tm -> path -> o.
end