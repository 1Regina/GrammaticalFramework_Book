concrete CalculatorEng of Calculator =
    NumeralEng ** -- Numeral module from the RGL
    open SyntaxEng, ParadigmsEng in {


    lincat
        Exp = NP ;

    lin
        -- Exp -> Exp -> Exp
        EPlus e1 e2 = arith sum_N e1 e2 ;
        EMinus e1 e2 = arith difference_N e1 e2 ;
        ETimes e1 e2 = arith product_N e1 e2 ;
        EDiv e1 e2 = divide division_N e1 e2 ;

        -- Numeral -> Exp;
        EInt numeral =  mkNP (mkDet numeral)  ; -- mkNP and mkDet from SyntaxEng
       -- EIntDig dig = mkNP (mkDet dig) ;


    oper
    sum_N = mkN "sum" ;
    difference_N = mkN "difference" ;
    product_N = mkN "product" ;
    division_N = mkN "division" ;

    arith : N -> NP -> NP -> NP ;
    arith op e1 e2 =
              let cake                  : NP       = mkNP and_Conj e1 e2               ;  -- the rgl way
              of_cake                   : Adv      = SyntaxEng.mkAdv possess_Prep cake ;  -- added SyntaxEng. bcos mkAdv appear in ParadigmsEng too
              piece_of_cake             : CN       = mkCN op of_cake                   ;
           in mkNP the_Det piece_of_cake                                               ; -- the_piece_of_cake


    divide : N -> NP -> NP -> NP ;
    divide op_Div e1 e2 =
                let by_e2               : Adv       = SyntaxEng.mkAdv by8agent_Prep e2      ;
                e1_by_e2                : NP        = mkNP e1 by_e2                         ;
                of_e1_by_e2             : Adv       = SyntaxEng.mkAdv possess_Prep e1_by_e2 ;
                division_of_e1_by_e2    : CN        = mkCN op_Div of_e1_by_e2               ;
            in mkNP the_Det division_of_e1_by_e2                                            ; -- the_division_of_e1_by_e2

}
-- Possibility, but unsafe due to touching raw fields of RGL cats
-- Eng RGL Conj is currently {s1,s2 : Str ; n : Number}
        -- oper plus_Conj = and_Conj ** {s2 = "plus"} ; -- making an assumption about the name and lincat
        -- lincat Exp = NP ;
        -- lin EPlus e1 e2 = mkNP plus_Conj e1 e2 ;