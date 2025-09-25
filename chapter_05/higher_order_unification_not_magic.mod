module higher_order_unification_not_magic.
  kind i      type.
  type a,b    i.
  type f      i -> i -> i.
  
  type extract_a i -> (i -> i) -> o.
  extract_a a x\ x.
  extract_a b x\ b.
  extract_a (f T S) (x\ f (U x) (V x)) :- extract_a T U, extract_a S V.
  
  type rewrite int -> int -> o.
  rewrite (0 + X) X.
  rewrite (1 * X) X.
  rewrite (X - X) 0.
  rewrite (C X) (C Y) :- rewrite X Y.
end

% [higher_order_unification_not_magic] ?- extract_a (f a (f a b)) F.

% The answer substitution:
% F = W1\ f W1 (f W1 b)

% More solutions (y/n)? y

% no (more) solutions

% [higher_order_unification_not_magic] ?- pi a\ sigma F\ (F a) = (f a (f a b)).

% yes

% [higher_order_unification_not_magic] ?- sigma F\ pi a\ (F a) = (f a (f a b)).

% yes

% [higher_order_unification_not_magic] ?- rewrite (0 + 5) R.

% The answer substitution:
% R = 5

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 _T2

% The remaining disagreement pairs list:
% <_T1 (0 + _T2), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 _T2

% The remaining disagreement pairs list:
% <_T1 (1 * _T2), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 0

% The remaining disagreement pairs list:
% <_T1 (_T2 - _T2), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 _T3)

% The remaining disagreement pairs list:
% <_T1 (_T2 (0 + _T3)), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 _T3)

% The remaining disagreement pairs list:
% <_T1 (_T2 (1 * _T3)), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 0)

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 - _T3)), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 _T4))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (0 + _T4))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 _T4))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (1 * _T4))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 0))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 - _T4))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 _T5)))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (0 + _T5)))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 _T5)))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (1 * _T5)))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 0)))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 - _T5)))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 _T6))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (0 + _T6))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 _T6))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (1 * _T6))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 0))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (_T6 - _T6))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 (_T6 _T7)))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (_T6 (0 + _T7)))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 (_T6 _T7)))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (_T6 (1 * _T7)))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 (_T6 0)))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (_T6 (_T7 - _T7)))))), 0 + 5>

% More solutions (y/n)? y

% The answer substitution:
% R = _T1 (_T2 (_T3 (_T4 (_T5 (_T6 (_T7 _T8))))))

% The remaining disagreement pairs list:
% <_T1 (_T2 (_T3 (_T4 (_T5 (_T6 (_T7 (0 + _T8))))))), 0 + 5>

% More solutions (y/n)? n

% yes