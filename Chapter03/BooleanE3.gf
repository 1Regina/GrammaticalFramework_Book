-- data Bool = False | True deriving (Read, Show, Eq, Ord, Enum, Bounded) -- zvon.org for bool. But incorrect as this is gf not haskell
resource BooleanE3 = {

param 
    Bool = True | False; 

oper 
-- using truth table. Incorrect bcos && and || is for haskell and not gf.
-- ConDisjunct = table {
--     Conjunct => table {True && True => True; False && False => False };
--     Disjunct => table { True || False => False; False || True => False} 
--     }

-- Method 1:Output Bool instead of Str
    ConDisjunct : Bool => Bool => Bool =
        table {
            True  => table {
                  True  => True;      --True, True
                  False => False };   --True, False
            False => table {
                  True => False;      -- False, True
                  False => False}     -- False, False
            };
 

{--- inari hint, unrelated to truth tables
param
   Number = Sg | Pl ;
   Case = Nom | Acc ;

oper

  numCaseTbl : Number => Case => Str = 
    table {
        Sg => table {
                Nom => "foo" ;  -- Sg, Nom
                Acc => "bar"} ; -- Sg, Acc
        Pl => table {
                Nom => "baz" ;  -- Pl, Nom
                Acc => "quux"}  -- Pl, Acc
    } ; -}


-- Method 2: Output Str instead of Bool
    ConDisjunctStr : Bool => Bool => Str =
        table {
            True  => table {
                  True  => "True";      --True, True
                  False => "False" };   --True, False
            False => table {
                  True => "False";      -- False, True
                  False => "False"}     -- False, False
            };

           
    -- Method 3: Separate case expression table with Str as output type for Conjuctive vs Disjunctive
    
    {-inari hint
        -- fun : typ1   -> typ2 -> returntyp = \t1,t2 ->
  numCaseTblSugar : Number => Case => Str = 
   \\num,cas => case <num,cas> of {
       <Sg,Nom> => "foo" ;  -- Sg, Nom
       <Sg,Acc> => "bar" ; -- Sg, Acc
       <Pl,Nom> => "baz" ;  -- Pl, Nom
       <Pl,Acc> => "quux" } ;  -- Pl, Acc
        -}

    ConDisjuncStrSugarTbl: Bool => Bool => Str =
        \\bool1, bool2 => case < bool1, bool2>  of {
            <True, True  >  => "True";  -- True, True
            <False, False>  => "False"; -- False, False
            <True, False >  => "False"; -- True, False
            <False, True >  => "False"  -- False, True
        };

    -- Method 4: Separate case expression table with Bool as output type for Conunctive vs Disjunctive
    ConDisjuncBoolSugarTbl: Bool => Bool => Bool =
        \\bool1, bool2 => case < bool1, bool2>  of {
            <True, True  >  => True;  -- True, True
            <False, False>  => False; -- False, False
            <True, False >  => False; -- True, False
            <False, True >  => False  -- False, True
        };

}
