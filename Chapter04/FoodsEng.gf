concrete FoodsEng of Foods = open ResEng in {
    lincat
        Comment, Quality = {s : Str} ;
        Kind = {s : Number => Str} ;
        Item = {s : Str ; n : Number} ;
    lin
        Pred item quality ={s = item.s ++ copula ! item.n ++ quality.s} ;
        This  = det Sg "this" ;
        That  = det Sg "that" ;
        These = det Pl "these" ;
        Those = det Pl "those" ;
        Mod quality kind =
            {s = \\n => quality.s ++ kind.s ! n} ;
        Wine = regNoun "wine" ;
        Cheese = regNoun "cheese" ;
        Fish = noun "fish" "fish" ;
        Pizza = regNoun "pizza" ;
        
        -- Ex3-2
        Fly = flynoun "fly" "flies"; 

        Very a = {s = "very" ++ a.s} ;
        Fresh = adj "fresh" ;
        Warm = adj "warm" ;
        Italian = adj "Italian" ;
        Expensive = adj "expensive" ;
        Delicious = adj "delicious" ;
        Boring = adj "boring" ;
}