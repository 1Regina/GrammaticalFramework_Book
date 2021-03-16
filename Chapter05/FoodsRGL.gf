
abstract FoodsRGL ={
    flags   
        startcat = Utt;    

    cat
        --  these 5 phrasal categories would suffice
        Utt ;  -- utterance                  e.g. "this pizza is warm"
        Cl ;   -- clause                     e.g. "this pizza is warm"
        NP ;   -- noun phrase                e.g. "this warm pizza"
        CN ;   -- common noun                e.g. "warm pizza"
        AP ;   -- adjectival phrase          e.g. "very warm"

    
    fun
        -- Syntactic combi
        mkUtt     :  Cl  -> Utt       ;  -- e.g. "this pizza is warm" 
        mkCl      :  NP  -> AP -> Cl  ;  -- e.g. "this pizza is warm"
        mkNP      :  Det -> CN -> NP  ;  -- e.g. "this pizza" 
        mkCN      :  AP  -> CN -> CN  ;  -- e.g. "warm pizza"
        mkAP      :  AdA -> AP -> AP  ;  -- e.g. "very warm"

        -- lexical insertion rules for single words -> phrase
        mkCN      :  N   -> NP        ;
        mkAP      :  A   -> AP        ;

}