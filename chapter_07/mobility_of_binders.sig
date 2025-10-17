sig mobility_of_binders.
kind  term, tm type.
type  term   tm -> o.

type  app   tm -> (tm -> tm).
type  abs   (tm -> tm) -> tm.
end