concrete DiscontEng of Discont = {
    param
        SForm = SDecl | SQuest ;
    lincat
        S, NP, AP , WP = Str ; -- E3-3 add WP
        Cl = SForm => Str ;
        VP = {verb,comp, when : Str} ;
        
    lin
        DeclCl  cl = cl ! SDecl ;
        QuestCl cl = cl ! SQuest ;
        PredVP np vp = table {
            SDecl  => np ++ vp.verb ++ vp.comp ++ vp.when ; -- John is old ++ now. vp.when applies only if CompAPW but will be an empty string if it is CompAP
            SQuest => vp.verb ++ np ++ vp.comp ++ vp.when -- Is John old
            } ;
          
        CompAP ap = {
                verb = "is" ;
                comp = ap ;
                when = ""
                } ;
        John = "John" ;
        Old = "old" ;
    
    
        --Ex 3-3 not required bcos CompAP & CompAPW produce VP which is input for PredVp for DeclCl and QuestCl
        -- DeclClW  cl = cl ! SDeclW ;
        -- QuestClW cl = cl ! SQuestW ;
        -- PredVPW np vp wp = table {
        --     SDeclW  => np ++ vp.verb ++ vp.comp ++ vp.when; -- John is old now / already
        --     SQuestW => vp.verb ++ np ++ vp.comp ++ vp.when  -- Is John old now/ already
        --     } ;
        CompAPW ap wp = {
            verb = "is";
            comp = ap;
            when = wp
            };

        Sleeping = "asleep";
        Now = "now";
        Already = "already";

}