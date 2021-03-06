accessing
evaluateSTONCommand: stonCommand
  | command result text |
  self ensureSessionMethodsEnabled.
  command := STON fromString: stonCommand.
  redirectTarget := command redirectTarget.
  result := self evaluateCommand: command objIn: objIn value.
  self objIn: result resultObject.
  self redirectObjIn: redirectTarget.
  self ensureSessionMethodsEnabled.
  text := result renderAsTextFor: self.
  ^ STON toString: text