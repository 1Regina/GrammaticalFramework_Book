concrete CalculatorC of Calculator = open Formal, Prelude in {

    lincat
        Exp = TermPrec  ;

    lin
        EPlus       = infixl    0   "+" ;
        EMinus      = infixl    0   "-" ;
        ETimes      = infixl    1   "*" ;
        EDiv        = infixl    1   "/" ;
        EInt    i   = constant  i.s     ;

    -- oper

    --     -- param
    --     Prec  = Ints      2       ;
    --     TermPrec    : Type = {s : Str ; p : Prec}   ;

    --     mkPrec      : Prec  -> Str -> TermPrec = \p, s -> s { s = s; p = p };
    --     usePrec     : TermPrec -> Prec -> Str = \x, p ->
    --                   case lessPrec x.p p of {                -- lessPrec defines  the  ordering  of  integer
    --                       True  => "(" x.s ")" ;
    --                       False => x.s
    --                   };
    --     constant    : Str -> TermPrec = mkPrec 2 ;--  \s -> s { s = s; p = maxPrec}; -- maxPrec = 2 here in book e.g
    --     parenthOpt  : Str -> Str = \s -> s | "(" ++ s ++ ")"       ;

    --     -- def
    --     -- parenthOpt s   = s                ;
    --     -- parenthOpt (s) = "(" ++ s ++ ")"  ;

    --     -- Left-associative means that e1 op e2 op e3 is interpreted as (e1 op e2) op e3 with (op associates to the left)
    --     infixl      : Prec  ->  Str  -> (_,_ : TermPrec) -> TermPrec = \ p, f, x, y -> {
    --                 s = usePrec x p ++ f ++ usePrec y (nextPrec p) ;  -- e.g (EPlus 3) ++ f ++ (EDiv (7))
    --                 p = p
    --                 };

    --     -- Right-associative means that  e1 op e2 op e3 is interpreted as e1 op (e2 op e3) (op associates to the right).
    --     infixr      : Prec  ->  Str  -> (_,_ : TermPrec) -> TermPrec = \ p, f, x, y -> {
    --                 s = usePrec x (nextPrec p) ++ f ++ usePrec y p ;     -- right assoc means a = b = c aka a = (b = c)
    --                 p = p
    --                 };

    --     -- non-associative examples are minus and division
    --     infix       : Prec  ->  Str  -> (_,_ : TermPrec) -> TermPrec = \ p, f, x, y -> {
    --                 s = usePrec x p ++ f ++ usePrec y p ; [wrong]     -- right assoc means a = b = c aka a = (b = c)
                        --    (usePrec (nextPrec p) x ++ f ++ usePrec (nextPrec p) y) [answer from http://www.grammaticalframework.org/~john/rgl-browser/#!prelude/Formal]
    --                 p = p
    --                 };
    }