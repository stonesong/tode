as yet unclassified
testProtocolRename
  "run without errors ... to keep me honest"

  | x |
  self createMockSubClass.
  self evaluateCommandString: 'cls --help protocol'.
  self
    evaluateCommandString:
        'cls protocol --add=' , self mockSubClassName , ' sample bubble';
    evaluateCommandString:
        'cls protocol --rename=' , self mockSubClassName , ' sample ample bubble ubble'.
  self
    assert: (x := self mockSubClass categoryNames sorted) = #(#'ample' #'ubble').
  self
    evaluateCommandString:
        'cls protocol --class --add=' , self mockSubClassName , ' sample bubble';
    evaluateCommandString:
        'cls protocol --class --rename=' , self mockSubClassName
            , ' sample ample bubble ubble'.
  self
    assert:
      (x := self mockSubClass class categoryNames sorted) = #(#'ample' #'ubble')