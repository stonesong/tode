as yet unclassified
implementors
    <topezCommand: 'implementors' manPage: #'implementorsManPage'>
    ^ [ :topez :objIn :tokens :windowId | 
    (self
        topez: topez
        objIn: objIn
        tokens: tokens
        windowId: windowId) implementorsOf: (tokens at: 2) ]