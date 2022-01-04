Find gf trees by
1. go to `/Users/regina/installations/gf-rgl/src/chinese`
2. `gf LangChi.gf ../english/LangEng.gf` so that you can compare trees for English vs Chinese later.
3. `p -cat=S "green cat walks" | l -treebank` to parse the **sentence** into AST then linearized accordingly in English and Chinese
    ```
    Lang> p -cat=S "green cat walks" | l -treebank
    Lang: UseCl (TTAnt TPres ASimul) PPos (PredVP (MassNP (AdjCN (PositA green_A) (UseN cat_N))) (UseV walk_V))
    LangChi: 绿 猫 走
    LangEng: green cat walks

    *this output is after fixing*
    ```

4. `p -cat=S "green cat walks" | l -table` to do the same as above but to confirm how many cat=S out of "green cat walks" are there.
    ```
    Lang> p -cat=S "green cat walks" | l -table
    s : 绿 猫 走
    s : green cat walks

    *this output is after fixing*
    ```

Run test e.g Adjectives for chinese in `/Users/regina/installations/gf-rgl/src/chinese`
1. `python ../../unittest/unittest.py unittest/adjectives.gftest`
2. If everything goes well , the output should be
    ```
    # Testing file: unittest/adjectives.gftest

    Test 1 (line 1..): 2 examples
    OK!

    Test 2 (line 1..): 2 examples
    OK!

    All 2 tests passed!
    ```