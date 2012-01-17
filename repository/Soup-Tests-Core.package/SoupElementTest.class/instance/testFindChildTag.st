finding tags
testFindChildTag
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'abc'.
	self assert: ((b findChildTag: 'b') = nil).
