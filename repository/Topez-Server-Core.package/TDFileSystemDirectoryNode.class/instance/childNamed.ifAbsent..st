as yet unclassified
childNamed: childName ifAbsent: absentBlock
  ^ (self
    resolveSpecialChildNamed: childName
    ifAbsent: [ 
      (self directoryEntries
        detect: [ :entry | 
          (entry name endsWith: self stonFileExtension)
            ifTrue: [ 
              (entry name copyFrom: 1 to: entry name size - self stonFileExtension size)
                = childName ]
            ifFalse: [ entry name = childName ] ]
        ifNone: [ ^ absentBlock value ]) asTDFileSystemNode
        parent: self;
        yourself ])
    topez: self topez;
    yourself