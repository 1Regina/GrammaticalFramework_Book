concrete CalculatorChi of Calculator = open SyntaxChi, ParadigmsChi, SymbolicChi in {


    lincat
        -- case 1: with Str without oper
        Exp = Str;

        -- case 2: using NP and oper
        -- Exp = NP ;

    lin

-- case 1:

        -- Exp -> Exp -> Exp
        EPlus e1 e2 = e1 ++ "加" ++ e2 ;
        EMinus e1 e2 = e1 ++ "减" ++ e2 ;
        ETimes e1 e2 = e1 ++ "乘" ++ e2 ;
        EDiv e1 e2 = e1 ++ "除" ++ e2 ;

        EInt numeral = numeral.s ;


-- case 2: not reasonable for Chi bcos the structure with Eng is different
{-
        -- Exp -> Exp -> Exp
        EPlus e1 e2 = arith sum_N e1 e2 ;
        EMinus e1 e2 = arith difference_N e1 e2 ;
        ETimes e1 e2 = arith product_N e1 e2 ;
        EDiv e1 e2 = divide division_N e1 e2 ;

        -- Int -> Exp;
        EInt numeral = symb numeral ; -- Symbolic module, symb : Int -> NP


    oper
    sum_N = mkN "加" ;
    difference_N = mkN "减" ;
    product_N = mkN "乘" ;
    division_N = mkN "除" ;

    arith, divide : N -> NP -> NP -> NP ;
    arith op e1 e2 = -- e.g "the (sum (of (12 and 24)))" as "the piece of cake"
              let cake                  : NP       = mkNP and_Conj e1 e2               ;  -- the rgl way  [mkNP	Conj -> NP -> NP -> NP]
              of_cake                   : Adv      = SyntaxChi.mkAdv possess_Prep cake ;  -- added SyntaxChi. bcos mkAdv appear in ParadigmsChi too  [mkAdv	Prep -> NP -> Adv]
              piece_of_cake             : CN       = mkCN op of_cake                   ; --[mkCN	CN -> Adv -> CN]
           in mkNP the_Det piece_of_cake                                               ; -- the_piece_of_cake [mkNP	Det -> CN -> NP]


    --divide : N -> NP -> NP -> NP ;
    divide op_Div e1 e2 =
                let by_e2               : Adv       = SyntaxChi.mkAdv by8agent_Prep e2      ; --[mkAdv	Prep -> NP -> Adv]
                e1_by_e2                : NP        = mkNP e1 by_e2                         ;
                of_e1_by_e2             : Adv       = SyntaxChi.mkAdv possess_Prep e1_by_e2 ;
                division_of_e1_by_e2    : CN        = mkCN op_Div of_e1_by_e2               ;
            in mkNP the_Det division_of_e1_by_e2                                            ; -- the_division_of_e1_by_e2

-}
}