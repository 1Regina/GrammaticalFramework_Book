resource UmlautE4 = {
    
    -- param
        -- umlautW  = ; 

    oper
        umlautGalore : Str -> Str = \w ->
            case w of {
                x + "a" + y                 => x + "ä" + y ;
                x + "o" + y                 => x + "ö" + y ;
                x + "u" + y                 => x + "ü" + y 
            }; 
             
}    