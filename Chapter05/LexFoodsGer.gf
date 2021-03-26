instance LexFoodsGer of LexFoods =
        open SyntaxGer, ParadigmsGer in {
    oper
        wine_N = mkN "Wein" ;
        pizza_N = mkN "Pizza" "Pizzen" feminine ;
        cheese_N = mkN "K ̈ase" "K ̈asen" masculine ;
        fish_N = mkN "Fisch" ;
        fresh_A = mkA "frisch" ;
        warm_A = mkA "warm" "w ̈armer" "w ̈armste" ;
        italian_A = mkA "italienisch" ;
        expensive_A = mkA "teuer" ;
        delicious_A = mkA "k ̈ostlich" ;
        boring_A = mkA "langweilig" ;
}