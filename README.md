Notes and Exercises to Grammatical FrameworkA Programming Language for Multilingual Grammars and Their Applications by Aarne Ranta September 8, 2010

Commands run after 
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
   2. p -lang=Eng "this wine is Italian" | l -lang=Ita  (NEED TO TWEAK?)
   3. gt -number=4 | l 
   4. gr -number=4 | l 
   5. linearize Pred (This Cheese) Expensive