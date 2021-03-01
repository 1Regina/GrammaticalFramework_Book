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

6. Ex 2.8 use ComplexKind and Kind2C for FoodEng for unambiguous? and FoodsIta With
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

* << Inflection table, param and ope>> << Chapter 03>>
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
3. Ex 3.3 need help on ap and wp table
4. Cannot i FoodsIta.gf even though they are copied from textbook.
5. Can we walk thru the oper meaning in ResIta.gf. P90. Dont understand why (nero,nera,neri,nere : Str) -> Adjective =  can be wildcard since they are used again.
6. desugar of Very qual in FoodsIta. correct?
7. <Ch04>
8. how should i read ResEng.gf oper det
9. resEng Mth 1 and Mth 2 correct and concept
10. do i need to ensure the same oper name exist for ResEng and ResIta?
11. resEng : what does the w and ws in regNoun stand for. LHS or RHS? 
12. With resource FoodEng, why do i still need a abstract Food ..comparing agst BooleanE3
13. See regNounNomGen for complex Noun in ResEng.gf Should it be 2 or 3 arguments < Str -> Str -> Str -> regNounNomGen