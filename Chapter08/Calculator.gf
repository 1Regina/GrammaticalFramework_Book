abstract Calculator = {

    flags startcat = Exp;
    cat
        Exp;

    fun
        EPlus, EMinus, ETimes, EDiv : Exp -> Exp -> Exp ;
        EInt                        : Int -> Exp ;

    -- Program constructors
        

    -- Ex 8-2
        ParenthOpt                  : Exp -> Exp ;
}