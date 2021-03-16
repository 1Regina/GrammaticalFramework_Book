resource ResEng = open Prelude in {
    param
        Number = Sg | Pl;
        Case = Nom | Gen;                 -- for Nominative vs Genitive in Method 3
        
        -- Ex 4-2; 4-3
        VerbForm =
              VPresent Number
            | VConti  
            | VPast
            | VPresPart
            | VPastPart         ;

    oper
        NounPhrase : Type =
            {s : Str ; n : Number};
        Noun : Type = { s : Number => Str };
        Adjective : Type = { s : Str};
 
    -- det refers to This and Those and in here, it is used as a function bcos of needing 3 arguments.
        det : Number -> Str ->
            {- {s : Number => Str} -> {s : Str ; n : Number} replace it with this for easier understanding -}
             Noun -> NounPhrase =
                \number,det,noun -> {s = det ++ noun.s ! number ; n = number} ;

        
        
        --Method 1: limited where everything is add only 's' or 'ies'
        flynoun : Str  -> {s : Number => Str} = 
            \fly ->   
            let flies : Str = case fly of {
               fl + "y"        => fl + "ies";
               _               => fly + "s"     
            }
                 
            in mkNoun fly flies ; {- with using mkNoun function -} -- alternative {s = table { Sg => fly; Pl => flies}};

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
        in mkNoun w ws   ;                                          

        
        -- Method 3 Noun for Nom & Gen
        NounNomGen : Type = {s : Number => Case => Str} ;
{--     mkNounNomGen is also below. Choose one.
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
--}
        regNounNomGen : Str -> NounNomGen = \x -> mkNounNomGen x (x + "s"); -- Simple


        -- complex nouns. with argu1 : Number ; argu2: noun; argu3: Nom | Gen?
        mkNounNomGen : Str -> Str -> NounNomGen = \nomSg, nomPl -> {
            s = table {
                Sg => table {
                    Nom => nomSg; 
                    Gen => nomSg + "'s"
                    };
                 Pl => table {
                     Nom => nomPl ;            
                     Gen => case nomPl of {  
                         _ + ("s")  => nomPl + "'" ;-- cars
                         _          => nomPl + "'s" }-- children
                    }
                }
            };
        


        -- For all and any
        adj : Str -> {s : Str} = \cold -> 
            {s = cold} ;
        copula : Number => Str =
            table {Sg => "is" ; Pl => "are"} ; 

        -- Ex4-2 & Ex4-3      
        regVerb : Str -> {s : VerbForm => Str} =
            \talk -> {
                s = table {
                    VPresent Sg     => talk + "s"    ;
                    VPresent Pl     => talk          ;
                    VConti          => talk + "ing"  ;
                    _               => talk + "ed"   
                }
            }; 
           
        allVerb : Str -> {s : VerbForm => Str} =
            \verb -> {
                s = table {
                    VPresent Sg     => case verb of {
                                    _ + "y"       => verb + "ies"  ; -- try/ cry    
                                    _             => verb + "s"  
                                    };
                    -- verb  + "s"   ;
                    VPresent Pl     => verb          ;
                    VConti          => verb + "ing"  ;
                    VPast           => case verb of {
                                    dr + "in" + nk => dr + "an" + nk ; -- sing/drink
                                    _ + "y"        => verb + "ied" ; -- try/ cry
                                    _              => verb + "ed"  
                                    };
                    _               => case verb of {
                                    dr + "in" + nk => dr + "un" + nk ; -- sing/drink
                                    _ + "y"        => verb + "ied"  ; -- try/ cry
                                    _              => verb + "ed"  
                                    }
                    }
        }; 


}