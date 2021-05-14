concrete FoodEng of Food =  {
    lincat
        Comment, Item, Kind, Quality = Str ; {-add ComplexKind for unambiguous-}
    lin
        Pred item quality = item ++ "is" ++ quality ;
        NPred item quality = item ++ "isn't" ++ quality ;{-negative Pred-}
        Pron r = "it";  -- need to have another external program to instruct it when to use eg after the 3rd pizza
        This kind = "this" ++ kind ;
        That kind = "that" ++ kind ;
        Mod quality kind = quality ++ kind ;
        Wine = "wine" ;
        Cheese = "cheese" ;
        Fish = "fish" ;
        Very quality = "very" ++ quality ;
        Fresh = "fresh" ;
        Warm = "warm" ;
        Italian = "Italian" ;
        Expensive = "expensive" ;
        Delicious = "delicious" ;
        Boring = "boring" ;
        -- 2.8 ambiguous
        With kind1 kind2 = kind1 ++ "with" ++ kind2 ;
        --2.8 unambiguous"
        -- With kind complexkind = kind ++ "with" ++ complexkind;
        -- Kind2C kind = kind;
}