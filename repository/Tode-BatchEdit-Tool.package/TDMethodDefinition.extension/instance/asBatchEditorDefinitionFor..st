*tode-batchedit-tool
asBatchEditorDefinitionFor: aBatchEditor
  ^ (TDBatchEditMethodDefinition
    className: self className
    isMeta: self isMeta
    selector: self selector
    messagePattern: self messagePattern
    messagePatternIsRegex: self messagePatternIsRegex)
    batchEditor: aBatchEditor;
    yourself