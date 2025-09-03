module extended_higher_order_hereditary_harrop_formulas.
  type reverse list A -> list A -> o.
  
  reverse L K :- pi rev\
    (pi L\ rev nil L L) &
    (pi X\ pi L\ pi K\ pi M\ rev (X::L) K M :- rev L K (X::M))
      => rev L K nil.
end

% [extended_higher_order_hereditary_harrop_formulas] ?- (reverse (1::2::3::nil) K).

% no (more) solutions