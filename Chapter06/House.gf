abstract House = {
    cat
      Command ;
      Kind ;
      Device Kind ; -- argument type Kind
      Action Kind ;
    fun
      CAction : (k : Kind) -> Action k -> Device k -> Command ;
}