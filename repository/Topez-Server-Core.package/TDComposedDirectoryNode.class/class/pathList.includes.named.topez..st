instance creation
pathList: pathList includes: includes named: nodeName topez: topez
  | entryList |
  entryList := OrderedCollection new.
  1 to: pathList size do: [ :index | 
    | entry |
    entry := TDPathComposedDirectoryEntry new
      path: (pathList at: index);
      includes: (includes at: index);
      topez: topez;
      yourself.
    entryList add: entry ].
  ^ self new
    name: nodeName;
    contents:
        (TDPathComposedDirectoryNodeContents new
            entryList: entryList;
            yourself);
    topez: topez;
    yourself