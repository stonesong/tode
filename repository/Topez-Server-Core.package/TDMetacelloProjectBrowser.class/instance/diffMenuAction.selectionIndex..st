menu actions
diffMenuAction: listElement selectionIndex: selectionIndex
  | registration patches |
  selectionIndex = 0
    ifTrue: [ ^ false ].
  registration := self projects at: selectionIndex.
  patches := registration diffProjectUsing: self projectTool.
  patches isEmpty
    ifTrue: [ self inform: 'No diffs' ].
  ^ #'refreshView'