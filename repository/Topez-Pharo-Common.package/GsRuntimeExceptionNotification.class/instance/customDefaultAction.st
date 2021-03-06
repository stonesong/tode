accessing
customDefaultAction
	| answer |
	Smalltalk isHeadless
		ifTrue: [ Error signal: 'GemStone Server error: ' , self description ].
	answer := UIManager default
		confirm: (self description withNoLineLongerThan: 80)
		trueChoice: 'Proceed'
		falseChoice: 'Abort'
		cancelChoice: 'Debug'
		default: false.
	answer
		ifNil: [ 
			^ {#debug.
			self} ].
	answer
		ifTrue: [ ^ #resume ].
	^ {#abort.
	(STON toString: 'Aborted...')}