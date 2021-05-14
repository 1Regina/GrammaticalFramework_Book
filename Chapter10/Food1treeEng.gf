concrete Food1treeEng of Food = open SyntaxEng, ParadigmsEng in {
    lincat
        -- Comment, Item, Kind, Quality = Str ; {-add ComplexKind for unambiguous-}
        Comment              = Utt;
        Item                 = NP ;
        Kind, ComplexKind    = CN ;
        Quality              = AP;


    lin
        -- Pred item quality = item ++ "is" ++ quality ;
        -- NPred item quality = item ++ "isn't" ++ quality ;{-negative Pred-}
        -- Pron r = "it";  -- need to have another external program to instruct it when to use eg after the 3rd pizza

        Pred item quality = mkUtt (mkCl (mkNP item) (mkAP quality));
        NPred item quality = mkUtt (mkCl (mkNP item) (mkAP quality));  -- item ++ "isn't" ++ quality ;{-negative Pred-}
        Pron r = i_Pron ;
        -- This kind = "this" ++ kind ;
        -- That kind = "that" ++ kind ;
        This item = det this_Det item ;
        That item = det that_Det item ;
        Mod quality kind = mkCN (mkAP quality) (mkNP kind) ;
        -- Mod quality kind = quality ++ kind ;
        -- Wine = "wine" ;
        -- Cheese = "cheese" ;
        -- Fish = "fish" ;
        -- Very quality = "very" ++ quality ;
        -- Fresh = "fresh" ;
        -- Warm = "warm" ;
        -- Italian = "Italian" ;
        -- Expensive = "expensive" ;
        -- Delicious = "delicious" ;
        -- Boring = "boring" ;

        -- 2.8 ambiguous
        -- With kind1 kind2 = kind1 ++ "with" ++ kind2 ;
        --2.8 unambiguous"
        -- With kind complexkind = kind ++ "with" ++ complexkind;
        Kind2C kind = kind;

        oper



        det_Kind : Det -> NP -> NP ;
        det_Kind this_that item = mkNP ((mkDet this_that) mkNP item) ;

        wine = mkN "wine" ;
        cheese = mkN "cheese" ;
        fish = mkN "fish" ;

        very : AP -> AP ;
        very quality = mkAP (very_AdA quality) ;

        fresh =  mkAP "fresh" ;
        warm = mkAP "warm" ;
        italian = mkAP "Italian" ;
        expensive = mkAP "expensive" ;
        delicious = mkAP "delicious" ;
        boring = mkAP "boring" ;

        with : CN -> CN -> NP ;
        with kind complexkind =
            let
                cheese              : CN  = mkCN complexkind                    ;
                with_chesse         : Adv = SyntaxEng.mkAdv (with_Prep cheese) ;
                fish_with_cheese    : CN  = mkCN kind with_cheese              ;
            in mkNP fish_with_cheese  ;           -- fish_with_cheese


}