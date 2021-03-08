abstract Discont = {
    cat
        S ; Cl ; NP ; VP ; AP ; WP ;
    fun
        DeclCl  : Cl -> S ;
        QuestCl : Cl -> S ;
        PredVP  : NP -> VP -> Cl ;
        CompAP  : AP -> VP ;
        John : NP ;
        Old : AP ;
        
        --Ex 3-3 add a when phrase for now and already and asleep
        Sleeping : AP;
        CompAPW  : AP -> WP -> VP  ; -- "is" ++ "asleep"/ "old" ++ "alr"/ "now" 
        Now, Already : WP ;  
}