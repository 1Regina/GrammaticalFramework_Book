abstract BoolTable = {
  flags startcat = Sentence ;
  cat
    Sentence ; Boolean ;
  fun
    -- Pred : Boolean -> Sentence ;  -- doesnt account for type
    True, False : Boolean ;
    PredT, PredF : Boolean -> Sentence;

}