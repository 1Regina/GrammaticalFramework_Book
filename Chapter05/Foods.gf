abstract Foods = {
    flags startcat = Comment ;
    cat
        Comment ; Item ; Kind ; Quality ; --ComplexKind ; {-add ComplexKind for unambiguous-}-}
    fun
        --Pron : Item -> Item ;
        -- NPred: Item -> Quality -> Comment ; {-negative Pred-}
        Pred : Item -> Quality -> Comment ;
        --This, That : ComplexKind -> Item ; {-change Kind to ComplexKind so fish can now be complexkind as Kind2C is added-}
        This, That, These, Those : Kind -> Item ; 
        Mod : Quality -> Kind -> Kind ;
        Wine, Cheese, Fish, Pizza : Kind ;
        Very : Quality -> Quality ;
        Fresh, Warm, Italian, Expensive, Delicious, Boring : Quality ;
        {- -- 2.8 ambiguous
        -- With : Kind -> Kind -> Kind ;
        -- 2.8 unambiguous
        With : Kind -> ComplexKind -> ComplexKind; 
        Kind2C : Kind -> ComplexKind; -}


        -- Ex 5-5
        
}