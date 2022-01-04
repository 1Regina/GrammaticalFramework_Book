Find gf trees by
1. go to `/Users/regina/installations/gf-rgl/src/chinese`
2. `gf LangChi.gf ../english/LangEng.gf` so that you can compare trees for English vs Chinese later.
3. `p -cat=S "green cat walks" | l -treebank` to parse the **sentence** into AST then linearized accordingly in English and Chinese
4. `p -cat=S "green cat walks" | l -table` to do the same as above but to confirm how many cat=S out of "green cat walks" are there.

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