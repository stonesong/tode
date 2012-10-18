accessing
acceptContents: aStringOrText notifying: aController
    "Set aString to be the contents of the receiver.  Return true cuz happy"

    | selector newMethodElement formattedString |
    self topez setClass: self sourceElement elementClassName asTopezNative.
    self topez setCategory: self sourceElement category asTopezNative.
    formattedString := self format: aStringOrText.
    newMethodElement := self sourceElement isMeta asTopezNative
        ifTrue: [ self topez classMethod: formattedString ]
        ifFalse: [ self topez method: formattedString ].
    self contents: newMethodElement.
    ^ true