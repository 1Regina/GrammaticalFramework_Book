--# -path=.:present
concrete FoodsREng of Foods =
        open SyntaxEng,ParadigmsEng in {
            lincat
                Comment         = Utt ;
                Item            = NP ;
                Kind            = CN ;
                Quality         = AP ;
            
            lin
                Pred item quality   = mkUtt (mkCl item quality)         ;
                This kind           = mkNP this_Det kind                ;
                That kind           = mkNP that_Det kind                ;
                These kind          = mkNP these_Det kind               ;
                Those kind          = mkNP those_Det kind               ;
                Mod quality kind    = mkCN quality kind                 ;
                Wine                = mkCN (mkN "wine")                 ;
                Pizza               = mkCN (mkN "pizza")                ;
                Cheese              = mkCN (mkN "cheese")               ;
                Fish                = mkCN (mkN "fish" "fish")          ;
                Very quality        = mkAP very_AdA quality             ;
                Fresh               = mkAP (mkA "fresh")                ;
                Warm                = mkAP (mkA "warm")                 ;
                Italian             = mkAP (mkA "Italian")              ;
                Expensive           = mkAP (mkA "expensive")            ;
                Delicious           = mkAP (mkA "delicious")            ;
                Boring              = mkAP (mkA "boring")               ;
}