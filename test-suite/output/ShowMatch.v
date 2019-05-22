(* Bug 5546 complained about unqualified constructors in Show Match output, 
   when qualification is needed to disambiguate them
*)

Module A.
  #[universes(template)] Inductive foo := f.
  Show Match foo. (* no need to disambiguate *)
End A. 

Module B.
  #[universes(template)] Inductive foo := f.
  (* local foo shadows A.foo, so constructor "f" needs disambiguation *)
  Show Match A.foo. 
End B.
