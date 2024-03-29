abstract Drink = {
    flags startcat = Comment ;
    cat
        Comment ; Item ; Kind ; Quality ; ComplexKind ; {-add ComplexKind for unambiguous-}
    fun
        Pron : Item -> Item ; 
        NPred: Item -> Quality -> Comment ; {-negative Pred-}
        Pred : Item -> Quality -> Comment ;
        This, That : ComplexKind -> Item ; {-change Kind to ComplexKind so fish can now be complexkind as Kind2C is added-}
        Mod : Quality -> Kind -> Kind ;
        Wine, Juice, Cocktail, Soup, Water : Kind ;
        Very : Quality -> Quality ;
        Fresh, Warm, Italian, Expensive, Delicious, Boring, Cool : Quality ;
        -- 2.8 ambiguous
        -- With : Kind -> Kind -> Kind ;
        -- 2.8 unambiguous
        With : Kind -> ComplexKind -> ComplexKind; 
        Kind2C : Kind -> ComplexKind;
}