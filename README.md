Notes and Exercises to Grammatical FrameworkA Programming Language for Multilingual Grammars and Their Applications by Aarne Ranta September 8, 2010
#### WordNet, RGL and gf_lib_path
1. When getting errors in every single A, N, or V in grammar, it can be a mismatch of the versions of RGL, wordnet and your grammars. There may be old *.gfo files lying around, even though you'd do make install from the latest gf-rgl. Better to just make everything in my $GF_LIB_PATH and do a fresh install.
1. cd into the gf-rgl directory and `git pull`
2. cd into the gf-wordnet and`git pull`
3. empty contents in gf_lib_path/
4. In gf-rgl: `make install`
5. In gf-wordnet: if I really want every language, then I can do make install there too, but it is slow. If I only need English, then I do this: `gf --gfo-dir=$GF_LIB_PATH WordNetEng.gf`


#### Chapter 02

* << General commands >>
1. i foodsEng.cf or foodsIta.cf or foodsChi.cf
   1. `gr`
   2. `gt`
   3. `l Pred (This Cheese) Expensive`
   4. `parse "questo formaggio `e caro"`
   5. `linearize Pred (This Cheese) Expensive`
   6. `gr -number=4 | l`
   7. `gt | l  or gt -depth=3 | l`
   8. l Pred (This Cheese) Juicy (NEED TO TWEAK?)
2. i FoodEng.gf FoodIta.gf
   1. `p -lang=Ita "quel pesce `e molto caro" | l -lang=Eng`
   2. `p -lang=Eng "this wine is Italian" | l -lang=Ita`
   3. `gt -number=4 | l`
   4. `gr -number=4 | l`
   5. `linearize Pred (This Cheese) Expensive`
   6. `gr Pred (This ?) Italian`
   7. `gr Pred (This ?) Italian | l`
   8. `gr -number=3 This ?`
   9. `(-depth=x) is for depth within the bracket`
   10. `gr -depth=2 -number=2`
   11. `gt -depth=2 -number=2 Pred (This ?) ?`
   12. `gt -depth=2 -number=2 Pred (This ?) ?|l`
   13. `gt -depth=1 Pred ? ?`
   14. `gt -depth=0 Pred (This (Mod ? ?)) ? | l -treebank`
3. after negative predication ex 2.7
   1. `gr NPred (This ?) ? | l`

4. P60 "it"  Pronoun but need an external program to dictate when to use it
   parse "it is very expensive" after adding to abstract and FoodEng
   fun Pron : Item -> Item
   lin Pron r = "it"
   Choose language by `parse -lang=Eng "it is very expensive" `  otherwise `parse "it is very expensive"`

6. Ex 2.8 use `ComplexKind` and `Kind2C` for FoodEng for unambiguous; and FoodsIta With
   1. `l Pred (This (Kind2C Cheese)) Expensive`
   2. `l NPred (This (Kind2C Cheese)) Expensive`
   3. `gr NPred (This (With ? ?)) Expensive| l`
   4. `gr NPred (That (With ? ?)) ?| l`
   5. `parse "this wine with warm cheese is very boring"`
   6. `gr Pred (This (With Wine (Kind2C (Mod Warm Cheese)))) (Very Boring)| l`
   7. `gr Pred (This (With ? (Kind2C (Mod ? ?)))) (Very ?)| l`

7. Ex 2.6 ticket
   1. `gr -number=3 | l -table` to show all the permutation of sentence
   2. `gr -number=3`

8. use a script in terminal outside of gf with `gf < FoodScript.gfs`

#### Chapter 03
* << Inflection table, param and oper>>
1. Ex 3.1
   1.  `i -retain BooleanE3.gf` Using i -retain bcos we are using param and oper
   2.  `cc ConDisjunct ! True ! True` NB: `!` bcos we are using a table so need to select input argument
   3.  `cc ConDisjunctStr ! True ! True`
   4.  `cc ConDisjuncStrSugarTbl ! True! True`
   5.  ` cc ConDisjuncBoolSugarTbl ! False ! True `
2. Ex 3.2
   test inflection table with param and oper
   1.  `i -retain FoodsEng.gf`  then `compute_concrete (regNoun "wine").s ! Pl`
   2.  `compute_concrete (noun "fish" "fish").s ! Pl`
   3.  `cc flynoun "fly"` to see the transformation
   4.  `l -table Wine`
   5.  `gf FoodsEng.gf`
3. Ex 3.3 DiscontEng.gf need help on ap and wp table ->  See comments in DiscontEng and Discont.
   1. DiscontEng
      1. Dont need `DeclCW` and `QuestClW` bcos now `CompAP` and `CompAPW` output a VP which will be arguments for `DeclCl` and `QuestCl`.
      2. Added `vp.when` to `SDecl` and `SQuest` for `PredVP np vp`
      3. Note the difference between `CompAP` vs `CompAPW` regarding `when`
   2. Discont : Add `Now`, `Already` and `CompAPW `
   3. Run `gr DeclCl (PredVP John (CompAPW ? ? )) `
4. Cannot `i FoodsIta.gf` even though they are copied from textbook. (Bcos ResIta shows that noun also need a gender. Fixed by adding `g = masc` in FoodsIta.gf to `wine`)
5. Can we walk thru the oper meaning in ResIta.gf. P90. Dont understand why `(nero,nera,neri,nere : Str) -> Adjective = `  can be wildcard since they are used again. (Explanation: ResIta line 24 can be wildcard `n1,_,_,n4` or as it is to make it clearer see Function Types with Variable in [tutorial](http://www.grammaticalframework.org/doc/tutorial/gf-tutorial.html#toc60) but the line 25 should be named.)
6. desugar of `Very qual` in FoodsIta. correct? (Fixed. need to add another nested table. See extra alternative)
7. ?Ch 03. other than cc and retain, how can i do "p "these cakes are expensive" or to make use of flyNoun or regNoun opers. (See https://inariksit.github.io/gf/2018/08/28/gf-gotchas.html#:~:text=sense.-,re-export%20rgl%20opers%20in%20application%20grammar,-Here) Solution:
      1. Run `i -retain ../Chapter03/FoodsEng.gf` then `cc -one Pred (These (regNoun "cake with cheese")) (adj "pink")` to get "these cake with cheeses are pink"
      2. `i -retain FoodsEng.gf` then `cc -one Pred (These (flyNoun "candy")) (adj "tasty")` to get `these candies are tasty`

#### Chapter 04
* << Resource Grammar and overload. Prefix and Grammars extension >>
1. how should I read ResEng.gf `oper det`. Take 3 arguments and return `These Fishes` e.g . See the replacement codes and notes.
2. resEng Mth 1 and Mth 2 correct and concept. (Correct)
3. do I need to ensure the same oper name exist for ResEng and ResIta? (Nope dont need. https://inariksit.github.io/gf/2021/02/15/rgl-api-core-extensions.html)
4. resEng : what does the `w` and `ws` in `regNoun` stand for. LHS or RHS? .
    (Explanation: `regNoun "boy"` calls `mkNoun` function with the arguments. `w = "boy"` and `ws = "boys"`)
5.  With resource FoodsEng, why do I still need a abstract Foods ..comparing agst BooleanE3. (Correct. See [Inari rgl-tutorial](https://github.com/inariksit/rgl-tutorial))
6.  See `regNounNomGen` for `complex Noun` in ResEng.gf Should it be 2 or 3 arguments  `Str -> Str -> Str -> regNounNomGen`. (Code is now changed and updated. Old is deleted.)
7.  Is my case expression in table for `allVerb` in ResEng.gf correct? if yes, i can get rid of regVerb correct? (Yes. `allVerb` is more comprehensive than the `regVerb` so keep `allVerb`, rid `regVerb`)
8.  UmlautE4 syntax error (corrected. Use this instead of gf tutorial one. remove "in umlaut at end... and param" dont need since the string are not called again like in ResEng into other functions. Run command `i -retain UmlautE4.gf` and then `cc umlautGalore "boy"` )
9.  OverloadEng - need to take care of all 5 scenarios in `irregVerb` for `PresentPl` altho no modification eg `sing -> sing` since  "in `worstCaseVerb sings sing singing sang sung ;`" last line has 5 arguments.    (Code is updated. Note that `PresentPl` is taken care of/ passed along in `worstCaseVerb`. All `PresentSg` and `Continous` is taken care of in `irregVerb`. `i -retain OverloadEng.gf` and `cc -trace regVerb "walk"` and 5 argu for `worstCaseVerb`)
10.  OverloadEng - syntax error  (solved)
11.  Commands to run to get dependency graph to show module structures
    1.  `i -retain Shopping.gf`
    2.  `dependency_graph`   << or use dg for abbreviation >>
    3.  `! dot -Tpng _gfdepgraph.dot >diamond.png`
12.  more question : p108 4.14 `prefix` oper in OverloadEng pre { } why the yellow syntax colour comes on is bcos pre { } is missing type with case pre of  etc. (Solved and can load anywhere. Mistaken as Haskell file)
13.  Notes: p109 Tokens can be created in the following ways:
    1.  quoted string; "foo"
    2.  gluing: t + s
    3.  predefiined operations: `init`, `tail`, `tk`, `dp`
    4.  pattern matching over strings: `"y" => "ies"`
    5.  prefix-dependent choices: pre { ..}
14. prefix.gf to discuss  Meng question. (Done. need a table of cases)

#### Chapter 05
* << Resource Grammar Library >>
1. Read again of the Resource Grammar Library at S5.4 p115, 116 for notes.
2.
    1. ? Should FoodsRGLEng be linked with Ch04 ResEng.gf. (Ans: After all the hardwork to create ResEng.gf. Use `--# -path=../Chapter04/ ` at top line in FoodsRGLEng.gf)
    2. Ex 5-0 + Ex 5-1 Commands to run
      1. `gr`
      2. `gr Pred ? ? |l `
      3. `gr That ? |l `
      4. `gr Mod ? ? `
      5. `gr Mod `
      6. `gt | l -treebank `
3. Ex 5-2 FoodsRIta.gf concrete but without flag startcat? (Yes flag startcat is only in abstract files). Run command after import ` gr | l -treebank` to see both linearized gr and treebank of a gr.
4. Ex 5-3 Commands to test Foods grammar with syntax, lexicon and concrete `gf FoodsIChi.gf FoodsIEng.gf FoodsIFin.gf FoodsIGer.gf FoodsIIta.gf`:
      1. `gr | l -treebank`
      2. `gt Pred (This Fish) ?`
      3. `gt Pred ? Delicious`
5.  1. Q Ex 5-4 is it asking me to do the different LexFoodsLangs and FoodsILangs?
    2. Q Ex 5-5: Not generalizing FoodsI properly for italian pie. Need oper?
    3. Ex 5-6: linking ok but what commands to test?
    4. Q Ex 5-7 word alignment test with `p "this Italian wine is very expensive" | aw`
    5. p133-135 good case examples of categories in API e.g Det, CN, VP types.
6. Parsing sentences using `import alltenses/LangEng.gfo` and testing the resource API functions with module `TryL` (-- a union of SyntaxL, LexiconL and ParadigmsL)
    *  Ex 5-8 Commands to run in terminal after gf:
       1.  `import alltenses/LangEng.gfo (then p "is this wine good" `. see table below)
       2.  `p "is this wine good" | tt` for a tree like form
       3.  `i -retain alltenses/TryEng.gfo`
              1.  `cc -all mkUtt (mkCl this_NP (mkA "cool"))`
              2. ? with the parsed tokens, can we do `cc -all (PhrUtt NoPConj........)` (In theory yes but there is a bug plus "cool" is not in the lexicon. If there was no bug, e.g Dutch, do just `l  .... ` bcos it has `fun/lin`. Solution `i alltenses/LangEng.gfo` and `p "this is good"` and finally `l PhrUtt NoPConj (UttS (UseCl (TTAnt TPres ASimul) PPos (PredVP (DetNP (DetQuant this_Quant NumSg)) (UseComp (CompAP (PositA good_A)))))) NoVoc` )

|  | parsed phrase with | parsers |
| --- | --- | --- |
| 1 | p "this wine is good" | PhrUtt NoPConj (UttS (UseCl (TTAnt TPres ASimul) PPos (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A)))))) NoVoc |
| 2 | p "is this wine good" | PhrUtt NoPConj (UttQS (UseQCl (TTAnt TPres ASimul) PPos (QuestCl (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A))))))) NoVoc |
| 3 | p "he says that this wine is good" | PhrUtt NoPConj (UttS (UseCl (TTAnt TPres ASimul) PPos (PredVP (UsePron he_Pron) (ComplVS say_VS (UseCl (TTAnt TPres ASimul) PPos (PredVP (DetCN (DetQuant this_Quant NumSg) (UseN wine_N)) (UseComp (CompAP (PositA good_A))))))))) NoVoc |

7. Ex 5-10. See [functor exercise solution](https://github.com/1Regina/GrammaticalFramework_tutorial/tree/master/lesson_4/functorExMP3)

#### Chapter 06
* << outdated >>
1. ? Ex 6-1 -- error msg "no overload instance of ConstructorsEng.mkCl" (Chapter 6 can be skipped as outdated similar to the Chapter 5 + 6 in tutorial. Attempted and discussed at [stackoverflow](https://stackoverflow.com/questions/55883172/grammatical-framework-linearization-type-field-cannot-be-int-how-to-write-a/66653390#66653390))

#### Chapter07
* << Embeddedd grammar in applications >>
1.  ? Translator: Copied Foods.gf, FoodsEng.gf, FoodsIta.gf from Chapter03
        1.  `ghc --make -o trans Translator.hs`
        2.  `gf -make FoodEng.gf FoodIta.gf`
2. Query yes no. Application consists of the following:

| files                     | purpose                             |
| ---                       | ---                                 |
| Makefile    (Query.hs)    | a makefile                          |
| Query.gf                  | abstract syntax                     |
| Query???.gf               | concrete syntaxes for each language |
| Answer.hs                 | the question-to-answer function     |
| QuerySystem.hs (Main.hs)  | Haskell Main module                 |
| .cabal                    | update main-is & other-modules in hs|
| stack.yaml                | to enable stack work                |

2. continue
    1. ? Cannot import QuerySystems.hs (renamed Main.hs) properly. (Due to not having global installation of pgf libraries so use a stack build to overcome. See below for steps)
       1. With Main.hs, Query.gf, Answer.hs in directory from book, type in terminal ` gf -make -f haskell Query.gf` to generate a Query.hs
       2. copy both cabal and yaml. Use  `wget https://raw.githubusercontent.com/1Regina/GrammaticalFramework_tutorial/master/gf-embedded-grammars-tutorial/stack.yaml` in terminal to copy a file of the same contents and tweak its contents for name and module. To get the url, click raw on github.
       3. `stack  build`
       4. make a concrete QueryEng.gf and note that number can use the library for integer string with `Number int = int.s ;` in line 11.
       5. `gf -make QueryEng.gf`
       6. `stack run`
       7. Questions time after stack run by ` is 2 prime? `
       8. Whenever QueryEng.gf is edited, do `gf -make QueryEng.gf` again to update the QueryEng.gfo, then do `stack run`, then do questions `is 2 prime?`

#### Chapter08
* << Arithmetic and Interface for formal and natural language. Calculator and Unix commands >>
1. ? `p "2 + 3 * 4"` and `p -cat=Exp "2 + 3 * 4"` did not return parser altho linking ok for Calculator.gf (Need a concrete. With abstract, I can only do gt and gr. `import CalculatorC.gf` instead and do `p "2 + 3 * 4"` , `put_string -lexcode "2 + 3 * 4"` and `put_string -lexcode "2 + 3 * 4"|p ` ).
2. CalculatorC.gf
    1. ? Ex 8-0  `infixl`, `p = Type Prec` , `f = Type Str`, `x, y = Type TermPrec` and `EPlus ... EInt  = Type Str`. (See [Prelude Formal](http://www.grammaticalframework.org/~john/rgl-browser/#!prelude/Formal) to understand how they work)
    2. ? Ex 8-0 Dont we need to know whats `nextPrec` and `lessPrec` (See [Prelude Formal](http://www.grammaticalframework.org/~john/rgl-browser/#!prelude/Formal))
    3. ? Ex 8-1 done with `parenthOpt` (See [Prelude Formal](http://www.grammaticalframework.org/~john/rgl-browser/#!prelude/Formal))
    4. ? Ex 8-1 with Book Section 6.10 `def` in CalculatorC line 27 and `ParenthOpt` in Calculator but cant test  with and without a pipe to `pt -compute` can try Ch06 P156 `parse -tr "1 + 1" | put_tree -compute -tr | linearize` (Deprecated compute with pipe in gf alr)

      ```
      p "foo" | pt -compute  -- deprecated
      pt -compute Foo (Bar (Baz)) -- still in use
      ```

3. CalculatorEng.gf: Ex 8-2 natural language calculator at Chapter08/CalculatorNumeral/CalculatorEng.gf Read more from about the import [NumeralEng](http://www.grammaticalframework.org/~john/rgl-browser/#!english/NumeralEng) and [Abstract Numeral](http://www.grammaticalframework.org/~john/rgl-browser/#!abstract/Numeral)
    1. ? Ex 8-2 Should these be added to Calculator.gf from p194 (Ignore and see next point)
       Section 8-3 Programs with variables

               cat
                  Prog, Var ;
               fun
                  PEmpty : Prog ;
                  PInit  : Exp -> (Var -> Prog) -> Prog ;
                  PAss   : Var -> Exp  -> Prog  -> Prog ;

                  EVar   : Var -> Exp ;


   2. Working with natural english: cd to Chapter08/CalculatorNumeral to
      1. Open Module and extend in CalculatorEng.gf
      > NumeralEng
      2. Since sum, difference, product are always "integer and integer", we can have a template ` oper arith op e1 e2`
      3. Create a unique oper for divide as it is of "integer by integer", ` oper divide op_Div e1 e2` .
      4. Statements will be "the sum of e1 and e2" and "the division of e1 by e2" .
      5. Run these commands to try
          1. `p "the sum of two and ten"`
          2. `gr EDiv ? ? | l`
          3. `gr  | l -treebank`
          4. `p "ten thousand" | l -treebank`
          5. `gr EPlus ? ? | l -treebank`
      6. Note the
       > lin type Numeral -> Exp for  EInt numeral =  mkNP (mkDet numeral)  ; -- mkNP and mkDet from SyntaxEng
   3. To work with **digits** AND **natural english**: Chapter08/CalculatorDigitNumeral:
      1. `open SymbolicEng` and also change
       > l lin EInt numberal
      2. Note that CalculatorJ is not relevant.
      3. Add in CalculatorEng.gf
       > SymbolicEng instead and lin type Int -> Exp for EInt numeral = symb numeral ; -- Symbolic module, symb : Int -> NP
      4. Commands: `gf CalculatorC.gf CalculatorEng.gf`
        1. `gr  | l -treebank`
        2. `p -lang=C "9 * ( 12 - 79 )"`
        3. `p -lang=C "9 * ( 12 - 79 )" | l -treebank`
        4. `p -lang=Eng "the sum of 2 and 10" `
        5. `p -lang=Eng "the division of 2 by  10"`
        6. `p -lang=Eng "the division of 2 by  10" |l -treebank`
      5. Run `i -retain CalculatorEng.gf` and `cc arith sum_N`
      6. Visualise tree is same gf shell
         1. p "the sum of 12 and 24" | vt | wf -file="mydemo.dot”
         2. ! dot -Tpng mydemo.dot > mydemo.png    | method 2: go to another shell outside gf and `dot -Tpng mydemo.dot > mydemo.png`
         3. ! code mydemo.png                      | method 2 continue: `code mydemo.png`

4. ? E8-10 Chapter08/UnixCommand `lin directory path` has type error Str vs {s: Str}. How to provide for a string to be whatever is the input like IO -> StdOut? ({s: Str} is a record and note that Str and string are not the same. To get it interactive, use String literals. See unix.gf fun dir under Paths. String, Float and Int are literals cats hidden under the hood. and they have limited generation see [String literals](https://inariksit.github.io/gf/2018/12/05/literals.html#generation:~:text=4003012203950112767-,Generation)
   1. credit: Maryam ` grep, ls , pipe portion`
   2. I added dir and homedir and cd
   3. `l cd homedir` returns `change directory to home directory`
   4. home directory: `l cd homedir | p` returns `cd homedir`
   5. other directory  `p "change directory to somedirectory"` returns `cd (dir "somedirectory")`
   6. note `cd (dir "some other directory")` returns `command not found: cd` bcos of spacing but `l cd (dir "some other directory")` can returns `change directory to some other directory`
   7. `l cd (dir "some other directory")|p` also fail bcos of spaces in the s of `dir s`. The only word with space allowable is "home directory", hence `l cd (dir "home directory")|p` return `cd homedir` .
   8. Use SS for records in cases where expecting > 1 field for the record e.g  {s : Str ; g ; Gender} ie more than just strings. { s = path.s} is also for record in e.g UnixE.gf concrete
      > lincat Path, Command = SS

   9. The definitions SS (a type) and ss from Prelude


               SS : Type = {s : Str} ;
               ss : Str -> SS   (as in dir of Unix.gf)
               Foo : Type = {s : Str ; g ; Gender} ;
               ==  Foo : Type = SS ** {g ; Gender} ;
               getStr : SS -> Str = \ss -> ss.s ;


#### Chapter 09
1. p213 Fig 68. variable (is for lhs of equation) and agreement.
2. 9.6 Determinants p217. lost with the case and agreement part below fig 76. pls walk me over the lin and lincat esp
      `lin DetCN det cn = {s = \\c => det.s ! cn.g ! c ++ cn.s ! det.n ! c ;..... `
3. ? Compare 9.7 modication has `lincat ap.s and cn.s` per the argument, similar to 9.4 Predication and 9.5 Complementation vs 9.5 P216 EXTRA ++. (See comments with  -- . Reorganised the features in obvious format.)
      ```
      9.4 p214
      lin
         PredVP np vp ={s = \\t => np.s ! nom ++ vp.s ! t ! np.a}

      9.5 p215-216
      lin
         ComplV2 v np = {s = \\t,a => v.s ! t ! a ++ np.s ! v.c}

      9.7 p218
      lincat
        AP  = {s : Gender => Number => Case => Str             }
        CN  = {s :           Number => Case => Str ;
               g : Gender }   ;
       lin

         -- 3 equivalents
         -- AdjCN ap cn = {s = \\n,c => cn.s ! n ! c ; g=cn.g} ;  --- simplest implementation of cn fn by ignoring the ap part
         -- AdjCn ap cn = {s = cn.s ; g=cn.g} ;                   --- simplest implementation of cn fn by ignoring the ap part
         -- AdjCn ap cn = cn ;                                    --- simplest implementation of cn fn by ignoring the ap part

         -- note that n! c! order depends on inflexion order in the lincat of AP and CN
        AdjCN ap cn = {s = \\n,c => ap.s ! cn.g ! n ! c -- the string we choose from AP. Gender of cn will determine the ap.s to choose.
                                 ++ cn.s ! n ! c ;      -- the string we choose from CN
                      g = cn.g}

      9.5 p216 EXTRA ++
      lincat
       V2 ={s : Tense => Agr => Str ; c : Case ; prep : Str}
      lin
       ComplV2 v2 vp ={s = \\t,a => v2.s ! t ! a ++ v2.prep ++ np.s ! v2.c}
     ```
4. ? 9.11 p222 Modiciation and Determination using `oper preOrPost for AdjCN` in Prelude for `isPre` feature. (See -- comment comparison and alternative 1 & 2)

      ```
         oper preOrPost : Bool -> Str -> Str = \p,a,b ->
            case p of {
               True  => a ++ b ;
               False => b ++ a
               }

         lin AdjCN cn ap = {
            s = \\n =>
               preOrPost ap.isPre (ap.s ! cn.g ! n) (cn.s ! n) ;  -- compare with 9.7 above. Similar.
            g = cn.g
            }

          -- in line version of the above without the oper preOrPost (Alternative 1)
         lin AdjCN cn ap = {
            s = \\n =>
                       case ap.isPre of {
                                       True  => (ap.s ! cn.g ! n )  ++ (cn.s ! n  ) ;
                                       False => (cn.s ! n  )        ++ ( ap.s ! cn.g ! n )
                       } ;
            g = cn.g
            }

          -- in line version of the above without the oper preOrPost (Alternative 2)
         lin AdjCN cn ap = case ap.isPre of {
                                       True  => {s = \\n => (ap.s ! cn.g ! n )  ++ (cn.s ! n  )         ; g = cn.g };
                                       False => {s = \\n => (cn.s ! n  )        ++ ( ap.s ! cn.g ! n )  ; g = cn.g };
                       } ;



      ```

#### Chapter 10
1. Ex 10.1 Using Food and FoodEng from Chapter 2, undo 2.8 unambigous Kind2C and ComplexKind and recreate, to get 2 trees, do:
   1. to get 2 trees
      ```
      p "this fish with cheese with wine is Italian"
      Pred (This (With Fish (With Cheese Wine))) Italian
      Pred (This (With (With Fish Cheese) Wine)) Italian
      ```
   2. to utilise "it"
      ```
      l NPred (Pron (That Fish)) Warm
      it isn't warm
      ```

      ```
      NPred (Pron ?1) Warm
      it isn't warm
      ```
   3. ? Food1treeEng.gf: How to incorp NPred for item ++ "isn't" ++ quality. (See different tense forms with `mkS (anteriorAnt) (negativePol)`)
      ```
      NPredPast item quality = mkUtt (mkS (pastTense) (anteriorAnt) (negativePol) (mkCl (item) (quality)));

      NPredPresentParticiple item quality = mkUtt (mkS (anteriorAnt) (negativePol) (mkCl (item) (quality)));

      NPredPresent item quality = mkUtt (mkS (negativePol) (mkCl (item) (quality)));
      ```
   4. ? syntax error upon importing (fixed. See notes at bottom)
   5. Test after import
      ```
      Food> p "it hasn't been boring"
      NPredPresentParticiple (Pron ?1) Boring

      Food> gr NPredPresentParticiple (Pron ?1) ? | l -treebank
      Food: NPredPresentParticiple (Pron (That Fish)) Expensive
      Food1treeEng: it hasn't been expensive

      Food> gr NPredPresent (This (Mod Italian Fish)) (Very Italian) | l
      this Italian fish isn't very Italian
      ```
   6. ? Food1treeEng.gf cant import after adding disambiguous with kind complexKind. Aim to be able to `p "this delicious fish with cheese is expensive"` ERROR is ** Maybe you gave too many arguments to with_Prep + syntax error. Should i do --2.8 unambiguous" way or the bottom oper way (Fixed for 2.8 unambiguous (Method a) without oper with_ by Abstract This, That, With & Kind2C and Concrete lincat ComplexKind, lin With kind complexKind, oper Kind2C kind and (Method b) Abstract This, That, With & Kind2C and Concrete lincat ComplexKind, lin With = with_ , Kind2C kind using oper with_   )
   7. ?Ch 03. other than cc and retain, how can i do "p "these cakes are expensive" or to make use of fly. (See https://inariksit.github.io/gf/2018/08/28/gf-gotchas.html#:~:text=sense.-,re-export%20rgl%20opers%20in%20application%20grammar,-Here) Solution:
      1. Run `i -retain ../Chapter03/FoodsEng.gf` then `cc -one Pred (These (regNoun "cake with cheese")) (adj "pink")` to get "these cake with cheeses are pink"
      2. `i -retain FoodsEng.gf` then `cc -one Pred (These (flyNoun "candy")) (adj "tasty")` to get `these candies are tasty`

#### A : mini resource grammar
1.  __A.2 ResIta__
    1.  ? p250 `param Agr    = Ag Gender Number Person ;`  where is that `Ag` coming/lifted from? (It is just a type constructor) NB Agreement is a constituent form that is dependent on other constituents. p259 an inherent feature of one constituent determines a variable feature of another one, e.g. `lin Pred np vp = np.s ++ vp.s ! np.n`.(e.g the cats sleep vs the cat sleeps)
    2.  ? `=>` for inherent features and case expression? (`=>` is for table and case expressions)
        1.  p252 `oper adjDet : Adj -> Number -> {s : Gender => Case => Str ; n : Number} = ...` : isnt `=>` for case expression as in `regVerb` above? How/when are `=>` normally used.
            1.  Ans: (for table and case: `=>` can be used inside or outside a record. For outside then inside .g GFSS reflPron : Agr => Str = table { P1 Sg => "myself" ; P1 PL = "ourselves"};)
        2. ? p268 and for inherent features `oper regA : Str -> {s : Gender => Number => Str} = ...`
           1. Ans: ( In  regA : Str -> {s : Gender => Number => Str} =.. , it would be first the gender table and next the number table determines the Str)
           ```
           param Gender = Masc | Fem ;
           oper
            regA : Str -> {s : Gender => Number => Str} =
               \fin -> {s = table {
                  Masc => table {
                                 Sg => fin ;
                                 Pl => fin + "s"
                                 } ;
                  Fem => table {
                                 Sg => fin + "e" ;
                                 Pl => fin + "es"
                                 }
                                 }} ;

           ```
    3.  ? p257 interface Syntax `oper ... overload` allow for multiple trees for each parser like `mkS` , `mkCl` . (Yes the overload creates the different paths for creating the opers e.g. 3 for mkS and 5 for mkCl)

#### B: Linguistic terms glossary
1.  Read them!

#### C: GF Programming Language
1.  C2.1 : Read this section P267-268 to know:
    1.  lincat
    2.  linearization with lin definition
    3.  param
    4.  fun (to give a lin) and cat (to give a lincat)
    5.  inheritance/ extension
    6.  resource module with its oper constituting params
    7.  opening module with `open MorphoFre in {...}` vs qualified via prefix `.` e.g. A.a
    8.  interface e.g Lexicon {oper(s)} vs instance e.g. LexiconEng of Lexicon = { oper "more granular"}
    9.  functors = parametrized modules = incomplete modules for concrete syntax via interface:
        1.  `incomplete concrete AdjI of Adj =  open Lexicon in {lincat..lin..}`
        2.  instantiate by providing instances `concrete AdjEng of Adj = AdjI with(Lexicon = LexiconEng) ;`
        3. Also from C2.10 Functor instantiated:

        ```
         concrete FoodsEng of Foods = CommentsEng **
            FoodsI-[Pizza] with
               (Syntax = SyntaxEng),
               (LexFoods = LexFoodsEng)
            open SyntaxEng, ParadigmsEng in {
               lin Pizza = mkCN (mkA "Italian") (mkN "pie") ;
            }
         ```
2.  ? C2.1: to confirm Branching order with muliple fetures:

      ```
      oper regA : Str -> {s : Gender => Number => Str}
            =\fin -> {s = table {
                        Masc => table {Sg => fin       ; Pl => fin + "s"} ;
                        Fem  => table {Sg => fin + "e" ; Pl => fin + "es"}
                                 }} ;

      (Ans: 1st decide the gender then 2nd the Sg / Pl )
      ```
3. C2.5: Modules and their extends and opens types

| module type         | extends   | opens    | body                |
| ---                 | ---       | ---      | ---                 |
| abstract            | abstract  | -        | cat, fun, def, data |
| concrete of _abstr_ | concrete  | resource*| lin*, oper, param   |
| resource            | resource* | resource*| oper, param         |
| interface           | resource+ | resource*| oper, param         |
| instance of _interf_| resource* | resource*| oper, param         |
| incomplete concrete | concrete+ | resource+| lin*, oper, param   |

* resource* : resource, instance, concrete
* resource+ : resource*, interface, abstract
* concrete+ : concrete, incomplete concrete
* lin* : lin, lincat, lindef, printname cat, printname fun

4. C2.7: Inheritance: inherits a, b, c from M1, and all names but d from M2
   > N = M1 [a,b,c], M2-[d]

5. C2.10: Completeness requirement across the different modules, interface , instances etc.
   1. Interface need not be complete.
   2. Instance can complete the interface!

   ```
      interface Pos = {
         param Case ;                 -- no definition
         param Number = Sg | Pl ;     -- definition given
         oper Noun : Type = {         -- relative definition given
            s : Number => Case => Str
         } ;

         oper regNoun : Str -> Noun ; -- no definition
      }
         instance PosEng of Pos = {
            param Case = Nom | Gen ;     -- definition of Case
                                         -- Number and Noun inherited
            oper regNoun = \dog -> {     -- type of regNoun inherited
               s = table {                -- definition of regNoun
                  Sg => table {
                     Nom => dog
                     -- etc
                     }
               } ;
            oper house_N : Noun =        -- new definition
               regNoun "house" ;
            }
      ```
6. ? C3.1 What are flags? (flags are commonly included in grammars:
      1. coding - defining the character encoding of Unicode string literals (in any module containing string literals)
      2. startcat - define the default target category of parsing (in an abstract module))
7. ? C3.6 We dont really use data constructor declaration correct? Data f: A -> A1 -> A2
8. ? C3.7 Abstract syntax that we have always been using is primitive/constructor/defined?
9. C4.2 Table of precedences of GF expressions -- See and compare
10. ? C4.4 Conversion : had not seen them in my gf exercises so far. How to read the down arrow
11. C4.9 : String literals. Expressions of type Str have the following canonical forms:
      1. tokens, i.e. __string literals__, in double quotes, e.g."foo"
      2. the empty token list,[]
      3. concatenation,s++t, where s, t: __Str__
      4. prefix-dependent choice, __pre__ { p1 => s1; . . . ; pn => sn ; _ =>s }, where
            1. s1, . . . , sn, s: __Str__
            2. p1, . . . , pn are patterns of type __Str__

      ```
      #gluing: there are no empty tokens, but the expression[]can be usedin a context requiring a token, in particular in gluing expression:
      s + t, where s, t: Str
      "foo" + "bar" ⇓ "foobar"
      t + [] ⇓ t
      [] + t ⇓ t

      e.g:
      "one two three" ≡≡ "one" ++ "two" ++ "three"
      ```
12. C4.9 Gluing = concatenation
      ```
      s + (t + u) ⇓ s + t + u
      s ++ (t ++ u) ⇓ s ++ t ++ u
      ```
13. C4.9 prefix dependency `pre {"a" | "e" | "i" | "o" => "an" ; _ => "a"}` then gluing `pre{p1 => s1; . . . ; pn => sn; => s} ++ t ⇓` . See Chapter 4 [prefix](Chapter04/prefix.gf).
14. C4.10 records:
      1. Record form :
          >  {r1 : A1;. . .; rn : An}
      2. Record to denote combo of its features:
         >  {r1 = a1;. . .; rn = an}
      3.  The fields of a record  are of the form `r = a`, also called value assignments. Value assignments may optionally indicate the type, as in `r : A = a` .
      4. Order of fields is unimpt so long as values assignments are all type-correct.
      5. Label
         > ss : Str -> {s : Str} = \s -> {s = s} ;
      6. Projection `t.r` where t must be a record and r must be a label defined in it. The computation rule for projection returns the value assigned to that field: `{. . .; r = a;. . .}.r ⇓ a`
      7. Record extension with R ** S produces a record with union of fields of R and S. It requires:
         1. both R and S are either records or record types
         2. the labels in R and S are distinct.
15. C4.11 [Subtyping](https://inariksit.github.io/gf/2018/05/25/subtyping-gf.html)
      1. A is a subtype of B means that a : A implies a : B.
      2. covariance: if A is a subtype of B, then C -> A is a subtype of C -> B.
      3. contravariance: if A is a subtype of B, then B -> C is a subtype of A -> C
      4. transitive: if A is a subtype of B and B is a subtype of C, then A is a subtype of C.
16. C4.12 Tables aka finite functions because could finitely enumerate all argument-value pairs.
      1. V1,. . . ,Vn is the complete list of the parameter values of the argument type P, and each ti is an expression of the value type T.
         > table { V1 => t1; . . . ;Vn => tn}
      2. Support patterns matching where p1,. . . .,pm is a list of patterns that covers all values of type P. Each pattern pi may bind some variables, on which the expression ti may depend.
         > table{p1=> t1; . . . ;pm => tm}
      3. Selection operator `!` , applied to a table t and to an expression v of its argument type `t!v` returns the first pattern matching result from t with v.
      4. Case expression syntactic sugar below.  Note type of e can be not just Str, but also a record (or a tuple) with __Str__ and parameter type components.
         > case e of {. . .} ≡≡ table {. . .} ! e
17. C4.13 Pattern matching  p295 for
      1. types:
         1. Integer and Str
         2. Str
         3. Ints n
      2. record pattern matching can use partial records:
         > {g = Fem} => t in a table of type {g : Gender ; n : Number} => T means the same as {g = Fem ; n = _} => t
      3. Pattern macros = opers of type patternT with operator #. Using #as a switch.
         > oper vowel : pattern Str = #("a" | "e" | "i" | "o")

         > pre {#vowel => "an" ;_ => "a"}
         #as a switch
18. C4.15 Local Definition. See "piece_of_cake" in [Calculator](Chapter08/CalculatorDigitNumeral) CalculatorEng.gf. Compression of several local definitions:
      1.  > let x : T = t ; y : U = u in e
          is the same as
          > let x : T = t in let y : U = u in e
19. C4.17 Reusing grammars as resources:
      1. if `t : T then lin C t : lincat C T` The type `lincat C T` is a subtype of T, which makes the above translation of lin judgements type-correct.
      2. The constructs lincat C T and lin C t are implemented internally  by  using __lock  fields__,  which  are  record  labels  of  form lock C of  the dummy type {} added to the record type T. **By using the lin C construct,[lock fields](https://github.com/1Regina/GrammaticalFramework_RGL/tree/master/RGL/rgl-tutorial/lesson4) can, and should, be avoided altogether in the source code.**
20. C4.18 Predefined concrete syntax types:
      1. Types:
         1. Str, the type of tokens and token lists (defined in Section C.4.9)
         2. Integer, the type of nonnegative integers
         3. Ints n, the type of integers from 0 to n
         4. Type, the type of (concrete syntax) types -- user-written
         5. PType, the type of parameter types -- user-written for param
      2. **Str** and **Integer** (Concrete Syntax Types) vs **String** and **Int** (Abstract Syntax Categories/Types)
21. C5.2 Compiler pragmas to search through file
      1. search through the current directory (.) and the directories *present* and */home/aarne/GF/tmp*, in this order.
      > --# -path=.:present:/home/aarne/GF/tmp
      2. $(GFLIBPATH)/DIR is searched. The default path list is **.:prelude**, and the directory prelude is automatically included in all path lists.
22. C6.1 Literals - Double precision float literals: 〈digit〉+‘.’〈digit〉+ (‘e’‘-’?〈digit〉+)? i.e. two sequences of digits separated by a decimal point, optionally followed by an unsigned or negative exponent

#### D: GF Resource Grammar Library
1. D.1 Catgegory System

|Category|Explanation                         |Example (default)           |
|---     |---                                 |---                         |
|Ant     |anteriority.                        |**simultaneous**, anterior. |
|CAdv    |comparative adverb                  |more                        |
|CN.     |common noun (without determiner)    |red house                   |
|Card    |cardinal number                     |seven                       |
|Cl      |declarative clause, with all tenses |she looks at this           |
|ClSlash |clause missing noun phrase          |she looks at                |
|Comp    |complement of copula, such asAP     |very warm                   |
|Conj    |conjunction                         |and                         |
|Det.    |determiner phrase                   |those seven                 |
|Digits. |cardinal or ordinal in digits       | 1,000/1,000th              |
|IAdv    |interrogative adverb                |why                         |
|IComp   |interrogative complement of copula  |where                       |
|IDet.   |interrogative determiner            |how many                    |
|IP      |interrogative pronoun               |who                         |
|Imp.    |imperative                          |look at this                |
|NP.     |noun phrase (subject or object)     |the red house               |
|Num     |number determining element.         |seven, **singular**, plural |
|Numeral |cardinal or ordinal in words        |five/fifth                  |
|Ord.    |ordinal number (used inDet)         |seventh                     |
|PConj   |phrase-beginning conjunction        |therefore, **no pconj**     |
|Phr     |phrase in a text                    |but be quiet please         |
|Pol     |polarity                            |**positive**, negative      |
|Predet  |predeterminer (prefixedQuant)       |all                         |
|Prep.   |preposition, or just case           |in                          |
|Pron.   |personal pronoun                    |she                         |
|QCl     |question clause, with all tenses.   |why does she walk           |
|QS      |question                            |where did she live          |
|Quant.  |quantifier (’nucleus’ of Det).      |this/these                  |
|RCl.    |relative clause, with all tenses.   |in which she lives          |
|RP      |relative pronounin                  |which                       |
|RS      |relative sentence                   |in which she lived          |
|S       |declarative sentence                |she looked at him.          |
|SC      |embedded sentence or question.      |that it rains               |
|SSlash  |sentence missing noun phrase.       |she looked at               |
|Subj.   |subjunction                         |if                          |
|Temp    |temporal and aspectual features     |past anterior               |
|Tense.  |tense                               |**present**, past, future   |
|Text    |text consisting of several phrases. |He is here. Why?            |
|Utt.    |utterance: sentence, question. . .  |be quiet                    |
|VPverb  |phrase                              |is very warm                |
|VPSlash.|verb phrase missing noun phrase     |look at                     |
|Voc     |vocative                            |my darling, **no voc**      |
[C]      |list of categoryC=Adv,AP,NP,RS,S.   |X, Y, Z                     |

<< Syntax Trees>>
2. D2.3 Clause level predication and complementation on combo of uses of **Cl**, **VP**, **Comp**, **SC**.
3. D2.4 Extraction: SSlash, ClSlash, VPSlash combo: e.g mkVPSlash ( VV VPSlash ) for "want to use (it)"
4. D2.5 Question and relative clause formation . QCl and RCl
5. D2.6 Interrogative and relative pronouns for IP, IDet, IAdv, IComp (e.g where or who (is it)), RP
6. D2.7 Noun phrases and determiners for NP, Det, Quant, Num, Card, Ord
7. D2.8 Numbers and values
8. D2.9 Common noun, adjective and adverbs : CN, AP, AdN, AdA, Adv
9. D2.10 Coordination joining for C = Adv, AP, NP, RS, S
      1.  Conj [C] gives X, Y and Z
      2.  C C  gives Y, Z
      3.  C [C] gives X, Y, Z

10. D3 Lexical Paradigms
      1. Functions and their types
         1. For regular words, P315 it is just Str -> Type e.g mkN : Str -> N; mkV : Str -> V etc
         2. For subcategories P316 there are:
               1. mkV2 : V -> V2
               2. mkV2 : V -> Prep -> V2
               3. mkV3 : V -> V3
               4. mkV3 : V -> Prep -> Prep -> V3
               5. mkVQ : V -> VQ
               6. mkV2Q: V -> Prep -> V2Q
               7. mkN2 : N -> Prep -> N2
               8. mkN3 : N -> Prep -> Prep -> N3
               9. ..etc more on p316
11. D4 Prelude module for common utilies functions like SS, ss, andB, init, if ..then..else, Bool, optStr

|Oper         |Type                           |Explanation             |
|---          |---                            |---                     |
|SS           |Type                           |the type{s : Str}       |
|ss.          |Str -> SS                      |record from string      |
|nonExist.    |Str                            |missing form            |
|optStr       |Str -> Str                     |optional string         |
|bothWays.    |(x,y : Str) ->Str.             |either x ++ y or y ++ x |
|Bool         |PType values                   |True and False          |
|andB.        |(,: Bool) -> Bool              |conjunction.            |
|orB.         |(,: Bool) -> Bool              |disjunction             |
|notB         |Bool ->Bool                    |negation                |
|if then else |(A:Type) -> Bool -> A -> A ->A |conditional.            |
|init         |Str -> Str                     |drop last character     |
|last         |Str -> Str                     |return last character   |
|glue         |Str -> Str -> Str              |glue tokens together.   |

12. D4.2 Formal module for maths precedence, parentheses for subexpressions infixl , usePrec, Prec
13. D4.3 Symbolic module for functions to change symbols to natural language
     1. mksymb : Str -> Symb *e.g x*
     2. symb : Str -> NP *e.g x*
     3. symb : Int -> NP *e.g 23*
     4. symb : Det -> N+ -> Numeral -> NP *the level four*
     5. symb : Symb -> Card *n(number)*
     6. ..etc more on p317
14. D4.4 Combinator comule for predicates and function expressions regardless of resource languages.
     1. pred : A -> NP -> NP -> Cl *e.g x and y are equal*
     2. pred : A2 -> NP -> NP -> Cl *e.g x is divisible by y*
     3. pred : N -> NP -> NP -> Cl *e.g x and y are inverses*
     4. more pred in p317
     5. app : N2 -> NP -> CN *e.g divisor of x*
     6. app: N3 -> NP -> NP -> CN *path from x to y*
     7. more app in p317

#### E: GF Software Systems
1.  P320 worthwhile to glance again. run help in gf shell to get a full list of commands and explanations.
2. ? p320 gr -probs=FILE         -- generate with bias
3. ? p320 i -v LangEng.gf LangSwe.gf  -- import Eng and Swe, be verbose
4. E2 GF Batch Compiler: to run GF from a script, use redirection
      1. $ gf <script.gfs

22. ? ++ vs +
      1. ++ in [FoodsEng.gf](Chapter04/FoodsEng.gf) lin pred quality , lin  Mod quality kind and lin very a
      2. + in [ResEng.gf](Chapter04/ResEng.gf) oper flynoun and oper regnoun and [OverloadEng.gf](Chapter04/OverloadEng.gf) oper regVerb and irregVerb

23. #### Chapter 10
   ##### Tips for Chapter10/Food1treeEng.gf
   1. `gr -cat=Cl | l -all -treebank` give linearizations n treebanks of all Cat = Cl
   2. For tense and polarity sensitive sentences. Chapter10/Food1treeEng.gf FROM RGL: mkS (Tense) -> (Ant) -> (Pol) -> Cl -> S
   3. Pred item quality = mkUtt (mkCl (item) (quality)); -- dont need to mkNP item and mkAP quality as item and quality are alr NP and AP per lincat
   4. after making opers e.g wine = mkN "wine" ; i still need to tackle linearization in lin section by Wine = mkCN wine ie Wine = mkCN (mkN "wine")
24. #### GFSS
   1. `abstract_info VP` gives all the fun that produce a VP. similar `ai eat_V2` for eat and its probability
   2. `l -all i_Pron` to see all the inflextion table contents in i_Pron
   3. forming phrases by extracting the inherent features of different arg to make things coherent
      ```
      lincat
      ChangingCat = {
               beforeChangingPart , afterChangingPart : Str ;
               changingPart: Foo => Bar => Str   };

      lin
      -- fix : ChangingCat -> AffectingCat -> FixedCat
      fix ch af = { s = ch.beforeChangingPart ++ ch.changingingPart!af.foo!af.bar ++ ch.afterChangingPart };
      ```
   4. ` l -all eat_V2` to get all linearization of eat ie eat eats eat. `l -all ReflV2 love_V2`
   5. test
      1. `gf --run < corpus.gfs` where corpus.gfs contains the commands
      2. `gf --run < corpus.gfs > corpus.GOLD` which contains the results of the commands in corpus.gfs
      3. `gf --run < corpus.gfs | diff -u - corpus.GOLD` to compare results
   6. In code/GFSummerSchool/Singlish/Version0/SinglishEngOrg.gf hack to change a subcategory V2 to a V to use the RGL. `(mkVP <action : V> )`
   ```
      -- : Actor -> Action -> Pred  ;
    PersonAction actor action            = mkS(mkCl (mkNP actor) (mkVP <action : V> )) ; -- hack to force a sub-category action: V2 into a higher category
    ```
