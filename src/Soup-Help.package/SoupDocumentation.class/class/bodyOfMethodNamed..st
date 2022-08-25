private
bodyOfMethodNamed: aSymbol

	| method source lines firstStatement statements body |
	method := self methodNamed: aSymbol.
	source := method sourceCode.
	body := source allButFirst: source lines first size.
	^ body trimBoth.