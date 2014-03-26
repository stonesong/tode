stash
spawn: aString adornmentColor: aColorOrNil
	aColorOrNil ifNil: [ adornmentColor := self adornmentColorFor: aString ] ifNotNil: [ :color | adornmentColor := color ].
	sessionName := aString.
	console := TodeConsole todeConsole: self.
	shellWindow := console openAsMorphLabel: self shellId asString , ': ' , self label welcome: false.
	shellWindow activate.
	self windowRegistration.
	^ shellWindow