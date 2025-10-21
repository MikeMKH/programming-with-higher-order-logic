sig mobility_of_binders.
kind  term, tm type.
type  term   tm -> o.

type  app   tm -> (tm -> tm).
type  abs   (tm -> tm) -> tm.

type bnorm, bbnorm  tm -> o.

type redex, red1, reduce  tm -> tm -> o.
type repeat    (A -> A -> o) -> A -> A -> o.
type reduce'   tm -> tm -> o.
end