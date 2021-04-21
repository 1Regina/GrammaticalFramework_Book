abstract Foods = {
    flags startcat = Comment ;
    cat
        Comment ; Item ; Kind ; Quality ;
    fun
        Pred : Item -> Quality -> Comment ;
        This, That, These, Those : Kind -> Item ;
        Mod : Quality -> Kind -> Kind ;
        Wine, Cheese, Fish, Pizza : Kind ;
        Very : Quality -> Quality ;
        Fresh, Warm, Italian,Expensive, Delicious, Boring : Quality ;
        
    -- E3-2 for fly dont need to put here as params n oper takes care of that in FoodsEng.gf already
    
}