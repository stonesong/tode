as yet unclassified
pathTermsNode: array
    | node |
    node := TDObjectNode new
        name: 'pathTermArray';
        topez: topez;
        basicContents: array;
        listBlock: [ :theNode | (1 to: array size) collect: [ :each | each asString ] ];
        elementBlock: [ :theNode :elementName :absentBlock | 
                    elementName isAllDigits
                        ifFalse: [ ^ self error: 'No such node: ' , elementName printString ].
                    (self pathTermNode: (array at: elementName asNumber))
                        parent: theNode;
                        name: elementName;
                        yourself ];
        yourself.
    ^ node