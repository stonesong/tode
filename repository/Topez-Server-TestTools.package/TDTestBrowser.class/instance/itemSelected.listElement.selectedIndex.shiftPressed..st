tools
itemSelected: miniTool listElement: listElement selectedIndex: selectionIndex shiftPressed: shiftPressed
  selectionIndex == 0
    ifTrue: [ ^ false ].
  self resultSlot == 1
    ifTrue: [ 
      (selectionIndex > 2 and: [ run size <= 0 ])
        ifTrue: [ ^ false ].
      selectionIndex > 1
        ifTrue: [ resultSlot := selectionIndex ] ]
    ifFalse: [ 
      selectionIndex < 3
        ifTrue: [ resultSlot := selectionIndex ]
        ifFalse: [ 
          | testCase testMethodClass |
          testCase := self testCasesAtResultSlot at: selectionIndex - 2.
          testMethodClass := testCase class
            whichClassIncludesSelector: testCase selector asString.
          (TDMethodDefinition
            className: testMethodClass name
            isMeta: false
            selector: testCase selector
            messagePattern: testCase selector asString
            messagePatternIsRegex: false) itemSelected: listElement topez.
          ^ STON
            toString:
              {#'setMenuCategories:'.
              #(#'testMethod').
              #'clearMenuCategories:'.
              #()} ] ].
  ^ STON
    toString:
      {#'setMenuCategories:'.
      #().
      #'clearMenuCategories:'.
      #(#'testMethod').
      #'refreshView'.
      nil}