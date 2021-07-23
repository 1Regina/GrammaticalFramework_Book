concrete Food1treeEng of Food1tree = open SyntaxEng, ParadigmsEng in {
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

        Pred item quality = mkUtt (mkCl (item) (quality)); -- dont need to mkNP item and mkAP quality as item and quality are alr NP and AP per lincat
        NPredPast item quality = mkUtt (mkS (pastTense) (anteriorAnt) (negativePol) (mkCl (item) (quality)));  -- item ++ "isn't" ++ quality ;{-negative Pred-} --- FROM RGL: mkS (Tense) -> (Ant) -> (Pol) -> Cl -> S
        NPredPresentParticiple item quality = mkUtt (mkS (anteriorAnt) (negativePol) (mkCl (item) (quality)));
        NPredPresent item quality = mkUtt (mkS (negativePol) (mkCl (item) (quality)));
        Pron r = mkNP (it_Pron) ;
        -- This kind = "this" ++ kind ;
        -- That kind = "that" ++ kind ;
        This kind = mkNP this_Det kind ;
        That kind = mkNP that_Det kind ;
        Mod quality kind = mkCN (quality) (kind) ;
        -- Mod quality kind = quality ++ kind ;
        Wine = mkCN wine ;
        Cheese = mkCN cheese ;
        Fish = mkCN fish ;
        Very quality = very quality;
        Fresh = mkAP fresh ;
        Warm = mkAP warm ;
        Italian = mkAP italian ;
        Expensive = mkAP expensive ;
        Delicious = mkAP delicious ;
        Boring = mkAP boring ;

        -- 2.8 ambiguous
        -- With kind1 kind2 = kind1 ++ "with" ++ kind2 ;
        --2.8 unambiguous"
        -- With kind complexkind = kind ++ "with" ++ complexkind;
        With kind complexKind = mkCN ((mkCN complexKind))  ((with_Prep) (mkCN kind)) ;
        Kind2C kind = kind;

        oper


        -- det_kind stuff replace by This item and That item already
        -- det_Kind : Det -> CN -> NP ;
        -- det_Kind this_that kind = mkNP (this_that) kind ;

        wine = mkN "wine" ;
        cheese = mkN "cheese" ;
        fish = mkN "fish" ;

        very : AP -> AP ;
        very quality = mkAP (very_AdA) quality ;

        fresh =  mkA "fresh" ;
        warm = mkA "warm" ;
        italian = mkA "Italian" ;
        expensive = mkA "expensive" ;
        delicious = mkA "delicious" ;
        boring = mkA "boring" ;

        -- with : CN -> CN -> NP ;
        -- with kind complexkind =
        --     let
        --         cheese              : CN  = mkCN kind                    ;
        --         with_chesse         : Adv = SyntaxEng.mkAdv (with_Prep cheese) ;
        --         fish_with_cheese    : CN  = mkCN complexkind with_cheese    ;
        --     in mkNP fish_with_cheese  ;           -- fish_with_cheese


}