abstract Unix = {

  flags startcat = Command ;

  cat
    Command ; Input ;
    Path ;
    -- hidden under the hood, we have also cats
    -- String ; Float ; Int ;

  fun

    pipe : Command -> Command -> Command ;
    grep : Input -> Command ;
    ls : Command ;

    search_term : Input ;

    cd  : Path -> Command;

    -- Paths
    dir : String -> Path ; -- any random string literal without spaces. String is a cat, and different from Str.
    homedir : Path ; -- home


}