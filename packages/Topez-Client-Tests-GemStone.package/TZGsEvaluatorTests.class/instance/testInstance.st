testing
testInstance
    | result x |
    self
        doNoError: [ 
            result := self runInstance.
            self assert: (x := result asString) = '[58 sz:0 cls: 74241 SmallInteger] 7' ]