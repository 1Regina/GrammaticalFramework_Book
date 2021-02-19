concrete FoodIta of Food = {
    lincat
        Comment, Item, Kind, Quality, ComplexKind = Str ; {-add ComplexKind for unambiguous-}
    lin
        Pred item quality = item ++ "`e" ++ quality ;
        NPred item quality = item ++ "non `e" ++ quality ; {-negative Pred-}
        This kind = "questo" ++ kind ;
        That kind = "quel" ++ kind ;
        Mod quality kind = kind ++ quality ;
        Wine = "vino" ;
        Cheese = "formaggio" ;
        Fish = "pesce" ;
        Very quality = "molto" ++ quality ;
        Fresh = "fresco" ;
        Warm = "caldo" ;
        Italian = "italiano" ;
        Expensive = "caro" ;
        Delicious = "delizioso" ;
        Boring = "noioso" ;

        --2.8 ambiguous
        -- With kind1 kind2 = kind1 ++ "con" kind2;

         --2.8 unambiguous"
        With kind complexkind = kind ++ "con" ++ complexkind; 
        Kind2C kind = kind;
}   