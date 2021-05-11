concrete CommentsIta of Comments = open SyntaxIta, ParadigmsIta in {

    lincat
        Comment = {s: Str} ;    -- This boring fish, Italian cheese, fresh, expensive
        Item = NounPhrase ; -- {s : Str ; n : Number} ;  -- This wine , These wines
        Kind = Noun ;-- {s : Number => Str};      -- Cheese, wine, fish
        Quality = Adjective ;
    lin
        Pred item quality                = mkCl item quality                        ;-- comment;
        This kind                        = mkNP this_Det kind                       ;
        That kind                        = mkNP that_Det kind                       ;
        These kind                       = mkNP these_Det kind                      ;
        Those kind                       = mkNP those_Det kind                      ;
        QKind quality kind               = mkCN quality kind                        ;
        Very quality                     = mkAP very_AdA quality                    ;
        -- This kind                        = mkNP this_Det (mkNP kind)                ;
        -- That kind                        = mkNP that_Det (mkNP kind)                ;
        -- These kind                       = mkNP these_Det (mkNP kind)               ;
        -- Those kind                       = mkNP those_Det (mkNP kind)               ;
        -- Mod  quality kind                = mkCN (mkAP quality) (mkNP kind)          ;
        -- Very quality                     = mkAP (very_AdA (mkAP quality))           ;


    -- From Ch3 ResIta
    param
        Number = Sg | Pl ;
        Gender = Masc | Fem ;
    oper
        NounPhrase : Type = {
                            s : Str ;
                            g : Gender ;
                            n : Number
                            } ;

        Noun : Type = {
                            s : Number => Str ;
                            g : Gender
                            } ;

        Adjective : Type = {
                            s : Gender => Number => Str
                            } ;

        Determiner : Type = {
                              s : Gender => Str;
                              n : Number
                            };

        noun : Str -> Str -> Gender -> Noun =
                 \cane, cani , g -> {
                             s = table {Sg => cane; Pl => cani} ;
                             g = g ;
                             };

        adjective : -- see pg 60 for explanation ResIta in Ch3
            (nero,nera,neri,nere : Str) -> Adjective =
                \nero,nera,neri,nere -> {
                            s = table {
                            Masc => table {Sg => nero ; Pl => neri} ;
                            Fem => table {Sg => nera ; Pl => nere}
                                       }
                            } ;
        regAdj : Str -> Adjective = \nero ->   -- see pg 60 for explanation ResIta in Ch3
                            let ner = init nero
                            in adjective nero (ner+"a") (ner+"i") (ner+"e") ;

        det : Number -> Str -> Str -> Noun -> NounPhrase =
                \n,m,f,cn -> {
                            s = table {Masc => m ; Fem => f} ! cn.g ++
                                cn.s ! n ;
                            g = cn.g ;
                            n = n
                            } ;

        copula : Number => Str =
                            table {Sg => "`e" ; Pl => "sono"} ;

        -- Pred item quality = item ++ "`e" ++ quality ;
        -- NPred item quality = item ++ "non `e" ++ quality ; {-negative Pred-}

        -- Mod quality kind = kind ++ quality ;
        -- From Ch03FoodIta with ResIta
        This            = det Sg "questo" "questa" ;
        That            = det Sg "quel"   "quella" ;
        These           = det Pl "questi" "queste" ;
        Those           = det Pl "quei"   "quelle" ;


        Wine =
            { s = table { Sg => "vino"; Pl => "vini" };
            g = Masc};

        Cheese          = noun "formaggio" "formaggi" Masc ;
        Fish            = noun "pesce" "pesci" Masc ;
        Pizza           = noun "pizza" "pizze" Fem ;

        Very qual =
            {s = \\g,n => "molto" ++ qual.s ! g ! n} ;
        -- Alternative in desugared form
        {-Very qual = {
            s = table { g => table { n => "molto" ++ qual.s ! g ! n}}
        };-}

        -- Alternative 2 with less sugar
        -- Very qual =  table {
        --                     Fem => table {
        --                         Sg => "molto" ++ qual.s ! Fem ! Sg ;
        --                         Pl => "molto" ++ qual.s ! Fem ! Pl} ;
        --                     Masc => table {
        --                         Sg => "molto" ++ qual.s ! Masc ! Sg ;
        --                         Pl => "molto" ++ qual.s ! Masc ! Pl}};

        Fresh           = adjective "fresco" "fresca" "freschi" "fresche" ;
        Warm            = regAdj "caldo" ;
        Italian         = regAdj "italiano" ;
        Expensive       = regAdj "caro" ;
        Delicious       = regAdj "delizioso" ;
        Boring          = regAdj "noioso" ;

}


