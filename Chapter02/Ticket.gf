abstract Ticket = {
    flags startcat = Query ;
    cat
        Query ; Origin ; Destination ;
    
    fun
 
        Ticket : Origin -> Destination -> Query ;
      
        Singapore, Thailand, Malaysia : Origin ;
        England, Denmark, Australia : Destination ;
}