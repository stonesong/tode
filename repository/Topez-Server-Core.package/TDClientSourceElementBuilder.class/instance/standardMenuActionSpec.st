menu action specs
standardMenuActionSpec
  "label, shortcut character, actionSymbol"

  "works in concert with menuActionBlock"

  ^ self smalltalkMenuActionSpec , {#('-')} , self editMenuActionSpec , {#('-')}
    , {{('Window' -> self windowMenuActionSpec)}} , {#('-')}
    , self saveMenuActionSpec