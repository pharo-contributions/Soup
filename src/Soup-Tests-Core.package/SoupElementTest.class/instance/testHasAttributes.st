finding tags
testHasAttributes
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findString: 'def'.
	self assert: (b hasAttributes = false).
	self assert: (c hasAttributes = false).

	