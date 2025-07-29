module universally_qualified_goals.
  kind jar, bug             type.
  type j                    jar.
  
  type sterile, heated      jar -> o.
  type dead, bug            bug -> o.
  type in                   bug -> jar -> o.
  
  sterile J :- pi x\ bug x => in x J => dead x.
  dead B    :- heated J, in B J, bug B.
  heated J.
end

% [universally_qualified_goals] ?- sterile X.

% The answer substitution:
% X = _T1

% More solutions (y/n)? n

% yes

% [universally_qualified_goals] ?- dead X.

% no (more) solutions

% [universally_qualified_goals] ?- sterile X, heated X.

% The answer substitution:
% X = _T1

% More solutions (y/n)? y

% no (more) solutions