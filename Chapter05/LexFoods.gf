interface LexFoods = open Syntax in {
    --  lexicon interface for Foods.
    oper
        wine_N : N ;
        pizza_N : N ;
        cheese_N : N ;
        fish_N : N ;
        fresh_A : A ;
        warm_A : A ;
        italian_A : A ;
        expensive_A : A ;
        delicious_A : A ;
        boring_A : A ;

        -- Ex 5-6
        like_V2 : V2 ; 
        i_like : NP -> Cl ;
        

}