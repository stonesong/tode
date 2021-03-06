accessing
createFor: aShellId options: optionArray
  | topezServer transcriptClientForwarder topezClientClientForwarder resultArray transcriptClientForwarderOop |
  topezServer := self for: aShellId.
  topezClientClientForwarder := ClientForwarder new.
  (optionArray includes: #'transcript')
    ifTrue: [ 
      Smalltalk
        at: #'TranscriptProxy'
        ifPresent: [ :cl | 
          transcriptClientForwarder := ClientForwarder new.
          cl registerTranscriptClientForwarder: transcriptClientForwarder.
          transcriptClientForwarderOop := Reflection
            oopOf: transcriptClientForwarder ] ].
  topezServer topezClientForwarder: topezClientClientForwarder.
  resultArray := {(topezServer asOop).
  transcriptClientForwarderOop.
  (Reflection oopOf: topezClientClientForwarder)}.
  ^ STON toString: resultArray