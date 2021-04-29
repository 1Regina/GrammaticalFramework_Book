abstract Calculator = Numeral ** {

    flags startcat = Exp;
    cat
        Exp;

    fun
        EPlus, EMinus, ETimes, EDiv : Exp -> Exp -> Exp ;
        EInt                        : Numeral -> Exp ;
        --EIntDig : Digits -> Exp ;


}