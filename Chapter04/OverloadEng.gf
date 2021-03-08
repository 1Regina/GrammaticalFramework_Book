resource OverloadEng = {
    param
        VerbForm = 
                  PresentSg
                | PresentPl
                | Continuous
                | Past
                | Participle         ;

    oper
        vowel       : pattern Str = #("a"|"e"|"i"|"o"|"u");
        consonant   : pattern Str = #("b"|"d"|"g"|"k"|"l"|"z");

        -- -- 4.14 prefix dependent
        -- pre {
        --     "eu"    =>    "a"  ; -- a euphemism
        --     "uni"   =>    "a"  ; -- a university
        --     "un"    =>    "an" ; -- an uncle
        --     "u"     =>    "a"  ; -- a user
        --     #vowel  =>    "an" ; 
        --     _       =>    "a"
        -- };
        
        Verb        : Type = { s :  VerbForm => Str } ;

        regVerb : (walk : Str) -> Verb = \walk ->
            let walked : Str = case walk of {
                _ + #vowel => walked + "d" ; -- waste + d
                _          => walk  + "ed"  
                }
            in irregVerb walk walked walked ;

        irregVerb : (sing, sang, sung : Str) -> Verb = \sing, sang, sung -> 
            let 
                -- PresentSg
                sings : Str = case sing of {
                    _  + ("ch"|"s"|"sh"|"x"|"o") => sing + "es"  ; -- guess / gush / mix / go  + es 
                    _  + "z"                     => sing + "zes" ; -- quiz + zes
                    fl + "y"                     => fl   + "ies" ; -- fly / cry
                    _                            => sing + "s"
                } ;

                -- PresentPl
                sing -> sing ;

                -- Continuous
                singing : Str = case sing of {
                    saddl + "e"                 => saddl        + "ing" ; -- saddling
                    qui   + z@#consonant        => qui + z + z  + "ing" ;  -- quizzing / installing
                    _                           => sing         + "ing"      
                } ; 

                -- Past
                sang : Str = case sing of {
                    tr  + "y"                   => tr   + "ied" ; -- try / cry 
                    _                           => sing + "ed"
                } ;

                -- Participle
                sung : Str = case sing of {
                    tr + "y"                    => tr   + "ied"  ; -- try / cry
                    _                           => sing + "ed"   
                }
            in worstCaseVerb sings sing singing sang sung ;     


            -- this shouldnt be exposed to the API
            worstCaseVerb : (x1,_,_,_,x5 : Str) -> Verb = \ psg, ppl, cont, past, partic -> {
                s = table {
                    PresentSg   => psg  ; 
                    PresentPl   => ppl  ; 
                    Continuous  => cont ;
                    Past        => past ; 
                    Participle  => partic
                }
            } ;

                 
}