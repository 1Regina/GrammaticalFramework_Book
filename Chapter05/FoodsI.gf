incomplete concrete FoodsI of Foods =
        open Syntax, LexFoods in {

-- functor for the concrete syntax of Foods. a functor is a module-level function taking instances (a module similar to aresource, but it contains only the types of opers, not their definitions) as arguments and producing modules as values.
-- With FoodsI as a function of type then its type signature is FoodsI : instance of Syntax ->instance of LexFoods -> concrete of Foods


    lincat
        Comment = Utt ;
        Item = NP ;
        Kind = CN ;
        Quality = AP ;
        
        -- Italian_pie = {s: Str};  
    lin
        Pred item quality = mkUtt (mkCl item quality) ;
        This kind = mkNP this_Det kind ;
        That kind = mkNP that_Det kind ;
        These kind = mkNP these_Det kind ;
        Those kind = mkNP those_Det kind ;
        Mod quality kind = mkCN quality kind ;
        Very quality = mkAP very_AdA quality ;
        
        Wine = mkCN wine_N ;
        --Ex 5-5
        Pizza = {-- mkCN ital_pie ; -- attempt 2: mkCN (Italian + "pie") -- originally: --} mkCN pizza_N ;
        -- Italian_pie = {s = "Italian pie"} ; -- ital_pie ("Italian pie"); 
        
        Cheese = mkCN cheese_N ;
        Fish = mkCN fish_N ;
        Fresh = mkAP fresh_A ;
        Warm = mkAP warm_A ;
        Italian = mkAP italian_A ;
        Expensive = mkAP expensive_A ;
        Delicious = mkAP delicious_A ;
        Boring = mkAP boring_A ;


    -- oper
    --Ex 5-5
    --     ital_pie  : Italian_pie -> CN = 
    --         \italP -> noun ("Italian pie") ;

 

}