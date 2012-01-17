finding tags
testIs
	| soup b | 
	soup := Soup fromString: '<b id="1">def<b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'def'.
	self assert: (soup isCData = false).
	self assert: (soup isComment = false).
	self assert: (soup isDeclaration = false).