abstract Calculator = {

    flags startcat = Exp;
    cat
        Exp;

    fun
        EInt                        : Int -> Exp ;
        EPlus, EMinus, ETimes, EDiv : Exp -> Exp -> Exp ;

    -- Program constructors

    -- Ex 8-2
        -- ParenthOpt                  : Exp -> Exp ;
}