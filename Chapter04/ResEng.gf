resource ResEng = open Prelude in {
    param
        Number = Sg | Pl;
        Case = Nom | Gen;                 -- for Nominative vs Genitive in Method 3
    oper
        NounPhrase = Type =
            {s : Str ; n : Number};
        Noun : Type = { s : Number => Str };
        Adjective : Type = { s : Str};


    -- det refers to This and Those 
        det : Number -> Str ->
            {s : Number => Str} -> {s : Str ; n : Number} =
                \n,det,noun -> {s = det ++ noun.s ! n ; n = n} ;

        
        
        --Method 1: limited where everything is add only 's' or 'ies'
        flynoun : Str  -> {s : Number => Str} = 
            \fly ->   
            let flies : Str = case fly of {
               fl + "y"        => fl + "ies";
               _               => fly + "s"     
            }
                 
            in {s = table { Sg => fly; Pl => flies}};

        -- Method 2:  From GF Tutorial Lesson_3 Smarter Paradigns (https://github.com/1Regina/GrammaticalFramework_tutorial/blob/master/lesson_3/SmarterParadigms.gf)
        Noun : Type = {s : Number => Str} ; 

        mkNoun : Str -> Str -> Noun = \x, y -> 
            {s = 
                table {
                    Sg => x ;
                    Pl => y
                }
            };

        --  most simple case.
        -- regNoun : Str -> Noun =\word -> mkNoun word (word + "s") ;

        regNoun : Str -> Noun = \w ->
            let
                ws : Str = case w of {
                _ + ("a" | "e" | "i"  | "o") + "o" => w + "s"   ; -- bamboo
                _ + ("s" | "x" | "sh" | "o" )      => w + "es"  ; -- bus, hero
                _ + "z"                            => w + "zes" ; -- quiz
                _ + ("a" | "e" | "o" | "u" ) + "y" => w + "s"   ; -- boy
                x + "y"                            => x + "ies" ; -- fly
                _                                  => w + "s"     -- car 
                }
        in w ws   ;                                          

        
        -- Method 3 Noun for Nom & Gen
        NounNomGen : Type = {s : Number => Case => Str} ;
        mkNounNomGen : Str -> Str -> NounNomGen = \x,y -> {
            s = table {
                Sg => table {
                    Nom => x ;
                    Gen => x + "’s"
                    } ;
                Pl => table {
                    Nom => y ;
                    Gen => case y of {
                        _ + "s" => y + "’" ;
                        _       => y + "’s"
                    }
                }
            } ;

        regNounNomGen : Str -> NounNomGen = \x -> mkNounNomGen x (x + "s"); -- Simple

        -- complex nouns. with argu1 : Number ; argu2: noun; argu3: Nom | Gen
        regNounNomGen : Str -> Str -> NounNomGen = \x, y -> {
            s = table {
                Sg => table {
                    Nom => x; 
                    Gen => x + "'s"
                    };
                 Pl => table {
                     Nom => y ;            
                     Gen => case y of {  
            
                _ + ("a" | "e" | "i"  | "o") + "o" => w + "s'"   ; -- bamboo
                _ + ("s" | "x" | "sh" | "o" )      => w + "es'"  ; -- bus, hero
                _ + "z"                            => w + "zes'" ; -- quiz
                _ + ("a" | "e" | "o" | "u" ) + "y" => w + "s'"   ; -- boy
                _ + ("hild")                       => w + "ren's"; -- child
                x + "y"                            => x + "ies'" ; -- fly
                _                                  => w + "s'"     -- car 
                }
        in w ws   ;  


        -- For all and any
        adj : Str -> {s : Str} = \cold -> 
            {s = cold} ;
        copula : Number => Str =
            table {Sg => "is" ; Pl => "are"} ; 




}