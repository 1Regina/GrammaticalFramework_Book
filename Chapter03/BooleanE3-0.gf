data Bool = False | True deriving (Read, Show, Eq, Ord, Enum, Bounded) -- zvon.org for bool

-- using truth table
table {
    Conjunct => table {True && True => True; False && False => False };
    Disjunct => table { True || False => False; False || True => False} 
}