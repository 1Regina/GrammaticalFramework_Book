resource prefix  = {

    -- P108 but need to set a table for case
oper
    
    getArticle: Str -> Str = 
        \x -> case x of {
        "eu"                        + _      => "a"        ; -- a euphemism
        "uni"                       + _      => "a"        ; -- a university
        "un"                        + _      => "an"       ; -- an unlce
        "u"                         + _      => "a"        ; -- a user
        "a" | "e" | "i" | "o"       + _      => "an"       ; 
        _                           + _      => "a"  
        };


}