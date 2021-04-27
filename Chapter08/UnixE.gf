concrete UnixE of Unix = open Prelude in {
  lincat
    Command = SS;  -- SS when we potentially need records with more than 1 field ie more than just strings ..
    Path = SS ;
    Input = Str;
-- the definitions SS and ss from Prelude
            -- SS : Type = {s : Str} ;
            -- ss : Str -> SS
           -- Foo : Type = {s : Str ; g ; Gender} ;
           -- ==  Foo : Type = SS ** {g ; Gender} ;
    -- getStr : SS -> Str = \ss -> ss.s ;
  lin
    cd directory =  { s = "change directory to " ++ directory.s} ;
    -- directory  = -- { s = path.s}  this is for record ;

    -- dir : String -> Path ;
    dir s = s ; -- lincats of literals are automatically SS
    homedir = ss "home directory" ;


    grep search_term = { s = "find " ++ search_term } ;
    ls = { s = "list all files" } ;
    pipe cmd1 cmd2 = multi cmd1 cmd2;

    -- search_term : Input ;  -- lincat Input = Str ;
    search_term = "string" ; -- Str
  oper
    multi : SS -> SS -> SS = \x,y -> ss("first " ++ x.s ++ " then " ++ y.s);


}