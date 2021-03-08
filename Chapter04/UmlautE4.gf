resource UmlautE4 = {
    
    param
        umlautW = Str; 

    oper
        umlautGalore : Str -> Str = \w ->
            let umlautW : Str = case w of {
                x + "a" + y                 => x + "ä" + y ;
                x + "o" + y                 => x + "ö" + y ;
                x + "u" + y                 => x + "ü" + y 
            }
            in umlautW 
}    