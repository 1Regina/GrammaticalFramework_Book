concrete FoodsIta of Foods = open ResIta in {
    lincat
        Comment = {s : Str} ;
        Quality = Adjective ;
        Kind = Noun ;
        Item = NounPhrase ;
    lin
        Pred item quality =
            {s = item.s ++ copula ! item.n ++
                quality.s ! item.g ! item.n} ;
        This  = det Sg "questo" "questa" ;
        That  = det Sg "quel"   "quella" ;
        These = det Pl "questi" "queste" ;
        Those = det Pl "quei"   "quelle" ;
        Mod quality kind = {
            s = \\n => kind.s ! n ++ quality.s ! kind.g ! n ;
            g = kind.g
            } ;
        --Alternative in desugared form
        {-Mod quality kind = {
                s = table {n => kind.s ! n ++ qual.s ! kind.g ! n}
                g = kind.g
                } ;  -}
        -- Wine = noun "vino" "vini" Masc ;
        --Ex 3.2 on wine inflection table
        Wine = 
            { s = table { Sg => "vino"; Pl => "vini" };
            g = Masc};
  

        Cheese = noun "formaggio" "formaggi" Masc ;
        Fish = noun "pesce" "pesci" Masc ;
        Pizza = noun "pizza" "pizze" Fem ;
        
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

        Fresh =
            adjective "fresco" "fresca" "freschi" "fresche" ;
        Warm = regAdj "caldo" ;
        Italian = regAdj "italiano" ;
        Expensive = regAdj "caro" ;
        Delicious = regAdj "delizioso" ;
        Boring = regAdj "noioso" ;
    }