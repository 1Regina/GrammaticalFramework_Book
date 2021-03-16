--# -path=.:present
concrete FoodsRIta of Foods =
        open SyntaxIta,ParadigmsIta in {
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
                Wine                = mkCN (mkN "vino")                 ;
                Pizza               = mkCN (mkN "pizza")                ;
                Cheese              = mkCN (mkN "formaggio")            ;
                Fish                = mkCN (mkN "pesce")                ;
                Very quality        = mkAP very_AdA quality             ;
                Fresh               = mkAP (mkA "fresca")               ;
                Warm                = mkAP (mkA "caldo")                ;
                Italian             = mkAP (mkA "Italiano")              ;
                Expensive           = mkAP (mkA "caro")            ;
                Delicious           = mkAP (mkA "delizioso")            ;
                Boring              = mkAP (mkA "noioso")               ;
}