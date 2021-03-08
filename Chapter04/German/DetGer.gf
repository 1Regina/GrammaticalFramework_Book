resource German = {

    {-FIGURE33 p106 The German definite article as a case expression and as an inflection table.-}    
    param 
        Gender  =    Masc | Fem  | Neutr         ;
        Case    =    Nom  | Acc  | Dat   | Gen   ;  
    oper 
        DetForm =    DSg Gender Case | DPl Case  ;
        artDef  :    DetForm => Str = 
            table {
                DSg  Masc Acc | DPl Dat                     => "den"  ;
                DSg (Masc | Neutr ) Dat                     => "dem"  ;
                DSg (Masc | Neutr ) Gen                     => "des"  ;
                DSg  Neutr   _                              => "das"  ;
                DSg  Fem (Nom | Acc)     | DPl (Nom | Acc)  => "die"  ;
                _                                           => "der"  
            }     
}