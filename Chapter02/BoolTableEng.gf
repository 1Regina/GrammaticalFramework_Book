concrete BoolTableEng of BoolTable = {
  lincat
    Sentence =  Str ;
    Boolean = {s : Quantum => Str} ;

  lin
    -- Pred boolean = "this is" ++ boolean ;                    -- wrong
    -- True  = {s = table {Norm = "true" ; Quant = "qutrue"}} ; -- wrong
    -- False = {s = table {Norm = "false";  Quant = "qufalse"}} ;-- wrong
    -- Pred boolean = {s = "this is" ++  boolean.s} ;  -- doesnt account for the table choices
    True  = {s = table {Norm => "true" ; Quant => "qutrue"}} ;
    False = {s = table {Norm => "false";  Quant => "qufalse"}} ;
    -- Pred boolean = "this is" ++ boolean ! (Quant|Norm) ;   -- wrong

    PredT boolean = "this is" ++ boolean.s ! Norm ;
    PredF boolean = "this is" ++ boolean.s ! Quant;

  param
    Quantum = Norm | Quant ;

}
