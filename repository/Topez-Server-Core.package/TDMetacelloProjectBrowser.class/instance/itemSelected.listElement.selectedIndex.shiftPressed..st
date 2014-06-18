tools
itemSelected: miniTool listElement: listElement selectedIndex: index shiftPressed: shiftPressed
  | registration enabled disabled enable |
  selectedProjectName := nil.
  index == 0
    ifTrue: [ ^ false ].
  registration := self projects at: index.
  selectedProjectName := registration projectName.
  enabled := {}.
  disabled := {#'dirtyProject'.
  #'versionSkew'.
  #'loadedProject'.
  #'unloadedProject'.
  #'repoBasedProject'.
  #'writableRepoBasedProject'.
  #'gitProject'.
  #'project'.
  #'metacelloProject'.
  #'configurationProject'.
  #'githubProject'.
  #'baselineProject'.
  #'nonDirtyGitProject'.
  #'loadableConfigurationProject'}.
  enable := [ :symbol | 
  enabled add: symbol.
  disabled remove: symbol ].
  registration hasVersionSkew
    ifTrue: [ enable value: #'versionSkew' ].
  registration hasGithubRepo
    ifTrue: [ enable value: #'githubProject' ].
  (registration isLoadedInImage or: [ registration isExternalGitProject ])
    ifTrue: [ 
      registration isLoadedInImage
        ifTrue: [ 
          registration isDirty
            ifTrue: [ enable value: #'dirtyProject' ].
          enable value: #'loadedProject' ].
      (registration isMetacelloProject or: [ registration hasGitRepository ])
        ifTrue: [ 
          enable value: #'repoBasedProject'.
          registration hasGithubRepo
            ifFalse: [ enable value: #'writableRepoBasedProject' ].
          registration isConfigurationBased
            ifTrue: [ 
              enable
                value: #'configurationProject';
                value: #'loadableConfigurationProject' ] ] ]
    ifFalse: [ 
      registration isExternalGitProject
        ifFalse: [ enable value: #'unloadedProject' ].
      registration isConfigurationBased
        ifTrue: [ enable value: #'loadableConfigurationProject' ] ].
  registration hasGitRepository
    ifTrue: [ 
      enable value: #'gitProject'.
      registration isDirty
        ifFalse: [ enable value: #'nonDirtyGitProject' ] ].
  registration isMetacelloProject
    ifTrue: [ enable value: #'metacelloProject' ].
  registration isBaselineBased
    ifTrue: [ enable value: #'baselineProject' ].
  enable value: #'project'.
  ^ STON
    toString:
      {#'setMenuCategories:'.
      enabled.
      #'clearMenuCategories:'.
      disabled}