module poly.

  kind lst            type.
  type null           lst.
  type cons           A -> lst -> lst.

end

% [btree] ?- append (1::nil) (2::nil) X, append ("abc"::nil) ("efg"::nil) Y.

% The answer substitution:
% Y = "abc" :: "efg" :: nil
% X = 1 :: 2 :: nil

% More solutions (y/n)? y

% no (more) solutions