Notes and Exercises to Grammatical FrameworkA Programming Language for Multilingual Grammars and Their Applications by Aarne Ranta September 8, 2010

Commands run after
* <<FOOD>>  << Chapter 02>>
1. i foodsEng.cf or foodsIta.cf or foodsChi.cf
   1. gr
   2. gt
   3. l Pred (This Cheese) Expensive
   4. parse "questo formaggio `e caro"
   5. linearize Pred (This Cheese) Expensive
   6. gr -number=4 | l
   7. gt | l  or gt -depth=3 | l
   8. l Pred (This Cheese) Juicy (NEED TO TWEAK?)
2. i FoodEng.gf FoodIta.gf
   1. p -lang=Ita "quel pesce `e molto caro" | l -lang=Eng
   2. p -lang=Eng "this wine is Italian" | l -lang=Ita
   3. gt -number=4 | l
   4. gr -number=4 | l
   5. linearize Pred (This Cheese) Expensive
   6. gr Pred (This ?) Italian
   7. gr Pred (This ?) Italian | l
   8. gr -number=3 This ?
   9. (-depth=x) is for depth within the bracket
   10. gr -depth=2 -number=2
   11. gt -depth=2 -number=2 Pred (This ?) ?
   12. gt -depth=2 -number=2 Pred (This ?) ?|l
   13. gt -depth=1 Pred ? ?
   14. gt -depth=0 Pred (This (Mod ? ?)) ? | l -treebank
3. after negative predication ex 2.7
   1. gr NPred (This ?) ? | l

4. P60 "it"  Pronoun but need an external program to dictate when to use it
   parse "it is very expensive" after adding to abstract and FoodEng
   fun Pron : Item -> Item
   lin Pron r = "it"
   Choose language by ```parse -lang=Eng "it is very expensive" ```  otherwise ```parse "it is very expensive"```

6. Ex 2.8 use ComplexKind and Kind2C for FoodEng for unambiguous; and FoodsIta With
   1. l Pred (This (Kind2C Cheese)) Expensive
   2. l NPred (This (Kind2C Cheese)) Expensive
   3. gr NPred (This (With ? ?)) Expensive| l
   4. gr NPred (That (With ? ?)) ?| l
   5. parse "this wine with warm cheese is very boring"
   6. gr Pred (This (With Wine (Kind2C (Mod Warm Cheese)))) (Very Boring)| l
   7. gr Pred (This (With ? (Kind2C (Mod ? ?)))) (Very ?)| l

7. Ex 2.6 ticket
   1. ```gr -number=3 | l -table``` to show all the permutation of sentence
   2. ```gr -number=3```

8. use a script in terminal outside of gf with ```gf < FoodScript.gfs```

* << Inflection table, param and oper>> << Chapter 03>>
1. Ex 3.1
   1.  ```i -retain BooleanE3.gf``` Using i -retain bcos we are using param and oper
   2.  ```cc ConDisjunct ! True ! True``` NB: ```!``` bcos we are using    a table so need to select input argument
   3.  ```cc ConDisjunctStr ! True ! True```
   4.  ```cc ConDisjuncStrSugarTbl ! True! True```
   5.  ``` cc ConDisjuncBoolSugarTbl ! False ! True ```
2. Ex 3.2
   test inflection table with param and oper
   1.  ```i -retain FoodsEng.gf```  then ```compute_concrete (regNoun "wine").s ! Pl```
   2.  ```compute_concrete (noun "fish" "fish").ßs ! Pl```
   3.  ```cc flynoun "fly"``` to see the transformation
   4.  ```l -table Wine```
   5.  gf F
3. Ex 3.3 DiscontEng.gf need help on ap and wp table ->  See comments in DiscontEng and Discont.
   1. DiscontEng
      1. Dont need DeclCW and QuestClW bcos now CompAP and CompAPW output a VP which will be arguments for DeclCl and QuestCl.
      2. Added vp.when to SDecl and SQuest for PredVP np vp
      3. Note the difference between CompAP vs CompAPW regarding when
   2. Discont : Add Now, Already and CompAPW
   3. Run ```  gr DeclCl (PredVP John (CompAPW ? ? ))```
4. Cannot i FoodsIta.gf even though they are copied from textbook. (Bcos ResIta shows that noun also need a gender. Fixed by adding g = masc in FoodsIta.gf to wine)
5. Can we walk thru the oper meaning in ResIta.gf. P90. Dont understand why (nero,nera,neri,nere : Str) -> Adjective =  can be wildcard since they are used again. (Explanation: ResIta line 24 can be wildcard n1,_,_,n4 or as it is to make it clearer see Function Types with Variable in tutorial http://www.grammaticalframework.org/doc/tutorial/gf-tutorial.html#toc60 but the line 25 should be named.)
6. desugar of Very qual in FoodsIta. correct? (Fixed. need to add another nested table. See extra alternative)
* <Ch04> Resource Grammar and overload. Prefix and Grammars extension
1. how should i read ResEng.gf oper det. Take 3 arguments and return These Fishes e.g . See the replacement codes and notes.
2. resEng Mth 1 and Mth 2 correct and concept. (Correct)
3. do i need to ensure the same oper name exist for ResEng and ResIta? (Nope dont need. https://inariksit.github.io/gf/2021/02/15/rgl-api-core-extensions.html)
4. resEng : what does the w and ws in regNoun stand for. LHS or RHS? .
    (Explanation: regNoun "boy" calls mkNoun function with the arguments. w = "boy" and ws = "boys")
5.  With resource FoodEng, why do i still need a abstract Food ..comparing agst BooleanE3. (Correct. See Inari rgl-tutorial https://github.com/inariksit/rgl-tutorial)
6.  See regNounNomGen for complex Noun in ResEng.gf Should it be 2 or 3 arguments < Str -> Str -> Str -> regNounNomGen. (Code is now changed and updated. Old is deleted.)
7.  Is my case expression in table for allVerb in ResEng.gf correct? if yes, i can get rid of regVerb correct? (Yes. allVerb is more comprehensive than the regVerb so keep allVerb, rid regVerb)
8.  UmlautE4 syntax error (corrected. Use this instead of gf tutorial one. remove "in umlaut at end... and param" dont need since the string are not called again like in ResEng into other functions. Run command ```i -retain UmlautE4.gf``` and then ```cc umlautGalore "boy"``` )
9.  OverloadEng - need to take care of all 5 scenarios in irregVerb for PresentPl altho no modification eg sing -> sing since  "in worstCaseVerb sings sing singing sang sung ;" last line has 5 arguments.    (Code is updated. Note that PresentPl is taken care of/ passed along in worstCaseVerb. All PresentSg and Continous is taken care of irregVerb. ```i -retain OverloadEng.gf``` and ```cc -trace regVerb "walk"``` and 5 argu for worstCaseVerb)
10.  OverloadEng - syntax error  (solved)
11.  Commands to run to get dependency graph to show module structures
    1.  i -retain Shopping.gf
    2.  dependency_graph   << or use dg for abbreviation >>
    3.  ! dot -Tpng _gfdepgraph.dot >diamond.png
12.  more question : p108 4.14 prefix oper in OverloadEng pre { } why the yellow syntax colour comes on is bcos pre { } is missing type with case pre of  etc. (Solved and can load anywhere. Mistaken as Haskell file)
13.  Notes: p109 Tokens can be created in the following ways:
    1.  quoted string; "foo"
    2.  gluing: t + s
    3.  predefiined operations: init, tail, tk, dp
    4.  pattern matching over strings: "y" => "ies"
    5.  prefix-dependent choices: pre { ..}
14. prefix.gf to discuss  Meng question. (Done. need a table of cases)
<Ch05>
   1. Read again of the Resource Grammar Library at S5.4 p115, 116 for notes.
   2. ? Should FoodsRGLEng be linked with Ch04 ResEng.gf. (Ans: After all the hardwork to create ResEng.gf. Use --# -path=../Chapter04/ at top line in FoodsRGLEng.gf)
   3. Ex 5-0 + Ex 5-1 Commands to run
      1. gr
      2. gr Pred ? ? |l
      3. gr That ? |l
      4. gr Mod ? ?
      5. gr Mod
      6. gt | l -treebank
   4. Ex 5-2 FoodsRIta.gf concrete but without flag startcat? (Yes flag startcat is only in abstract files). Run command after import ``` gr | l -treebank``` to see both linearized gr and treebank of a gr.
   5. Ex 5-3 Commands to test Foods grammar with syntax, lexicon and concrete `gf FoodsIChi.gf FoodsIEng.gf FoodsIFin.gf FoodsIGer.gf FoodsIIta.gf`:
      1. gr | l -treebank
      2. gt Pred (This Fish) ?
      3. gt Pred ? Delicious
   6. Q Ex 5-4 is it asking me to do the different LexFoodsLangs and FoodsILangs?
   7. Q Ex 5-5: Not generalizing FoodsI properly for italian pie. Need oper?
   8. Ex 5-6: linking ok but what commands to test?
   9. Q Ex 5-7 word alignment test with `p "this Italian wine is very expensive" | aw`
   10. p133-135 good case examples of categories in API e.g Det, CN, VP types.
   11. Ex 5-8 Commands to run in terminal after gf:
       1.  import alltenses/LangEng.gfo
       2.  p "this wine is good" returns PhrUtt NoPConj (UttS (UseCl (TTAnt TPres ASimul) PPos (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A)))))) NoVoc
       3.  p "is this wine good" returns PhrUtt NoPConj (UttQS (UseQCl (TTAnt TPres ASimul) PPos (QuestCl (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A))))))) NoVoc
            |    |parsed phrase   | parsed tokens  | 
            |----|----------------|---|
            |  1 | p "this wine is good"   | hrUtt NoPConj (UttS (UseCl (TTAnt TPres ASimul) PPos (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A)))))) NoVoc  |
            |  2 | p "is this wine good"   | PhrUtt NoPConj (UttQS (UseQCl (TTAnt TPres ASimul) PPos (QuestCl (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A))))))) NoVoc  |