--# -path=.:present
concrete ArithmREng of Arithm =
        open SyntaxEng,ParadigmsEng in {
            lincat
                Prop         = Cl ;
                Nat          = NP ;


            lin
                Zero                = mkCN (mkN "zero")                 ;
                Succ nat            = mkCN nat                          ;
                Even nat            = mkCl nat                         ;
                And prop prop       = mkCl prop prop                   ;
    }