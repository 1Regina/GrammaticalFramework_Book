
concrete QueryEng of Query = open SyntaxEng, ParadigmsEng in  {

lincat
    Answer, Question, Object = Str;

lin
    Even object = "is" ++ object ++ "even?";
    Odd object = "is" ++ object ++ "odd?" ;
    Prime object = "is" ++ object ++ "prime?";
    Number int = int.s ;
    Yes = "Yes";
    No = "No";

}