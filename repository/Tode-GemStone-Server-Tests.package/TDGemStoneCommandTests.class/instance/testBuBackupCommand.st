as yet unclassified
testBuBackupCommand
  "run without errors ... to keep me honest"

  [ 
  | backupDirectoryPath |
  backupDirectoryPath := TDGemStoneTool defaulBackupDirectoryName.
  self topez
    evaluateCommandString: 'bu --help backup';
    evaluateCommandString:
        'bu --dir=' , backupDirectoryPath , ' backup seaside.dbf';
    yourself ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: ex description;
        show: (GsProcess stackReportToLevel: 100) ]