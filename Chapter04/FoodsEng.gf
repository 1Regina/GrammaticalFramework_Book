concrete FoodsEng of Foods = open ResEng in {
    lincat
        Comment, Quality = {s : Str} ;
        Kind, ComplexKind = Noun ; -- (from ResEng) --original {s : Number => Str} ;
        Item = NounPhrase ; -- from ResEng --original {s : Str ; n : Number} ;
    lin
        Pred item quality = {s = item.s ++ copula ! item.n ++ quality.s} ;
        Kind2C kind = kind ;

        This noun = det Sg "this" noun ;
        That  = det Sg "that" ;
        These = det Pl "these" ;
        Those = det Pl "those" ;
        Mod quality kind =
            {s = \\n => quality.s ++ kind.s ! n} ;
        Wine = regNoun "wine" ;
        Cheese = regNoun "cheese" ;
        Fish = mkNoun "fish" "fish" ;
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