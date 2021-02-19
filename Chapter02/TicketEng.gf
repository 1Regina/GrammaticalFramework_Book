concrete TicketEng of Ticket = {
    lincat
        Query, Origin, Destination = Str ;
    lin
        Ticket origin destination =
               
            let 
                mayI : Str = ("may" | "can") ++ "I";  
                iWouldLike : Str = "I would like"; 
                giveMe : Str = ("could you" | []) ++ "give me";
            in 
            (mayI | iWouldLike | giveMe | [])          ++ -- optional "may I" / "I'd like" /give me"
            ("a ticket" | [] )                         ++ -- Optional "ticket"
            "from " ++ origin ++ "to " ++ destination  ++ -- obligatory origin and destionation
            ("please"| []);                             -- Optional "please"

          
        Singapore = "Singapore";
        Thailand = "Thailand";
        Malaysia = "Malaysia";
        England = "England";
        Denmark = "Denmark";
        Australia = "Australia";
 
}