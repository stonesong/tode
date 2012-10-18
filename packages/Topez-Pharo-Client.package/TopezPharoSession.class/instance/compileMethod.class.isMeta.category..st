api
compileMethod: source class: classProxy isMeta: isMeta category: categoryName
    | selector cls |
    cls := classProxy native.
    isMeta
        ifTrue: [ cls := cls class ].
    selector := cls compile: source classified: categoryName.
    ^ TZMethodElement new
        isMeta: isMeta;
        elementClass: classProxy;
        elementClassName: classProxy asTopezProxy proxyClassName;
        selector: selector;
        category: categoryName;
        setSource;
        yourself