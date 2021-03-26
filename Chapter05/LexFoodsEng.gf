instance LexFoodsEng of LexFoods =
        open SyntaxEng, ParadigmsEng in {
    -- English instance of the lexicon interface for Foods
    oper
        wine_N = mkN "wine" ;
        pizza_N = mkN "pizza" ;
        cheese_N = mkN "cheese" ;
        fish_N = mkN "fish" "fish" ;

        fresh_A = mkA "fresh" ;
        warm_A = mkA "warm" ;
        italian_A = mkA "Italian" ;
        expensive_A = mkA "expensive" ;
        delicious_A = mkA "delicious" ;
        boring_A = mkA "boring" ;

        -- Ex 5-6
        like_V2 = mkV2 "like" ;
        i_like it = mkCl i_NP (mkV2 "like") it ;
}