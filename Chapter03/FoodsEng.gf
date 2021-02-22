concrete FoodsEng of Foods = {
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
        Wine = regNoun "wine" ;C
        Cheese = regNoun "cheese" ;
        Fish = noun "fish" "fish" ;
        Pizza = regNoun "pizza" ;
        
        -- Ex3-2
        Fly = flynoun "fly" "fly"; 

        Very a = {s = "very" ++ a.s} ;
        Fresh = adj "fresh" ;
        Warm = adj "warm" ;
        Italian = adj "Italian" ;
        Expensive = adj "expensive" ;
        Delicious = adj "delicious" ;
        Boring = adj "boring" ;
    param
        Number = Sg | Pl ;
    oper
        det : Number -> Str ->
            {s : Number => Str} -> {s : Str ; n : Number} =
                \n,det,noun -> {s = det ++ noun.s ! n ; n = n} ;
        noun : Str -> Str -> {s : Number => Str} =
            \man,men -> {s = table {Sg => man ; Pl => men}} ;
        --Ex 3-2
        flynoun : Str  -> {s : Number => Str} = 
            \fly, flies -> {s = table { Sg => "fly"; Pl => "flies"}};
        --Ex 3-2 alternative with given param Number and oper noun
        {-Noun : Type = { s: Number => Str};
        mkNoun : Str -> Str -> Noun = \x, y ->
            { s = 
                table {
                    Sg  => x ; 
                    Pl  => y
                    }
            };

        flynoun : Str -> flynoun = \w ->
            let :
                ws : Str = case w of {
                x + "y"         => x + "ies";
                _               => w + "s"    
                }
            in mkNoun w ws     ; -}      

        regNoun : Str -> {s : Number => Str} =
            \car -> noun car (car + "s") ;
        adj : Str -> {s : Str} =
            \cold -> {s = cold} ;
        copula : Number => Str =
            table {Sg => "is" ; Pl => "are"} ;
}