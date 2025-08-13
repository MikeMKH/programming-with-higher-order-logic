module terms_syntax.
  type foreach  (A -> o) -> list A -> o.
  type example  o.
  
  example :- foreach (x\ x > 5, x < 9) (3::10::6::8::nil).
end

% [terms_syntax] ?- example.

% no (more) solutions